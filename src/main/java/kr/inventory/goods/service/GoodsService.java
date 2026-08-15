package kr.inventory.goods.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kr.inventory.common.AppConstants;
import kr.inventory.common.FileUtil;
import kr.inventory.common.MybatisUtil;
import kr.inventory.goods.dao.GoodsDao;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.dto.GoodsSearch;
import kr.inventory.goods.dto.WarehouseStock;
import org.apache.ibatis.session.SqlSession;

/**
 * 품목 CRUD와 재고 목록·상세 조회를 담당한다.
 */
public class GoodsService {
  public static final String[] EXCEL_HEADERS = {
      "품목코드", "품목명", "카테고리명", "단위", "안전재고", "단가", "사용여부", "전 창고 합계"
  };

  private GoodsDao goodsDao;

  public GoodsService() {
  }

  public GoodsService(GoodsDao goodsDao) {
    this.goodsDao = goodsDao;
  }

  public List<Goods> selectLowStockList() {
    GoodsSearch search = new GoodsSearch();
    search.setLowStock(true);
    return selectStockList(search);
  }

  public List<Goods> selectAll() {
    return withDao(dao -> dao.selectAll());
  }

  public List<Goods> selectList(String keyword) {
    return withDao(dao -> dao.selectList(keyword));
  }

  public List<Goods> selectAdminList() {
    return selectAdminList(new GoodsSearch());
  }

  public List<Goods> selectAdminList(GoodsSearch search) {
    GoodsSearch cond = search == null ? new GoodsSearch() : search;
    if (cond.getKeyword() != null) {
      cond.setKeyword(cond.getKeyword().trim());
    }
    List<Goods> raw = withDao(dao -> dao.selectAdminListBySearch(cond));
    return filterAdminList(raw, cond);
  }

  private List<Goods> filterAdminList(List<Goods> raw, GoodsSearch cond) {
    String key = cond.getKeyword() == null ? "" : cond.getKeyword().toLowerCase();
    String useYn = cond.getUseYn();
    List<Goods> result = new ArrayList<>();
    for (Goods g : raw) {
      if (useYn != null && !useYn.isEmpty() && !useYn.equals(g.getUseYn())) {
        continue;
      }
      if (!key.isEmpty()) {
        String code = nvl(g.getGoodsCode()).toLowerCase();
        String name = nvl(g.getGoodsName()).toLowerCase();
        if (!code.contains(key) && !name.contains(key)) {
          continue;
        }
      }
      result.add(g);
    }
    return result;
  }

  /**
   * 사용중인 품목만. 부족 필터는 전 창고 합계 기준.
   */
  public List<Goods> selectStockList(GoodsSearch search) {
    GoodsSearch cond = search == null ? new GoodsSearch() : search;
    List<Goods> raw = withDao(dao -> dao.selectStockList(cond));
    List<Goods> result = new ArrayList<>();
    for (Goods g : raw) {
      if (!AppConstants.USE_Y.equals(g.getUseYn())) {
        continue;
      }
      if (cond.isLowStock() && g.getTotalQty() >= g.getSafetyQty()) {
        continue;
      }
      result.add(g);
    }
    return result;
  }

  public Goods selectOne(int goodsNo) {
    return withDao(dao -> dao.selectOne(goodsNo));
  }

  public Goods selectOneActive(int goodsNo) {
    Goods g = selectOne(goodsNo);
    if (g == null || !AppConstants.USE_Y.equals(g.getUseYn())) {
      return null;
    }
    return g;
  }

  public boolean isDuplicatedCode(String goodsCode) {
    if (goodsCode == null || goodsCode.isEmpty()) {
      return false;
    }
    return withDao(dao -> dao.countByCode(goodsCode)) > 0;
  }

  public boolean isDuplicatedCode(String goodsCode, int goodsNo) {
    if (goodsCode == null || goodsCode.isEmpty()) {
      return false;
    }
    return withDao(dao -> dao.countByCodeExcept(goodsCode, goodsNo)) > 0;
  }

  /**
   * 품목코드가 이미 있으면 0.
   */
  public int insert(Goods goods) {
    if (goods == null || goods.getGoodsCode() == null) {
      return 0;
    }
    if (isDuplicatedCode(goods.getGoodsCode())) {
      return 0;
    }
    if (goods.getCategoryNo() < 1) {
      return 0;
    }
    if (goods.getUseYn() == null || goods.getUseYn().isEmpty()) {
      goods.setUseYn(AppConstants.USE_Y);
    }
    if (!FileUtil.isAllowedPath(goods.getImagePath())) {
      return 0;
    }
    return write(dao -> dao.insert(goods));
  }

  /**
   * 새 imagePath가 없으면 기존 경로를 유지한다. 바뀌면 이전 파일을 지운다.
   */
  public int update(Goods goods) {
    if (goods == null) {
      return 0;
    }
    if (isDuplicatedCode(goods.getGoodsCode(), goods.getGoodsNo())) {
      return 0;
    }
    Goods stored = selectOne(goods.getGoodsNo());
    if (stored == null) {
      return 0;
    }
    String incoming = goods.getImagePath();
    if (incoming == null || incoming.isEmpty()) {
      goods.setImagePath(stored.getImagePath());
    } else if (!FileUtil.isAllowedPath(incoming)) {
      return 0;
    }
    int result = write(dao -> dao.update(goods));
    if (result > 0 && incoming != null && !incoming.isEmpty()
        && stored.getImagePath() != null && !incoming.equals(stored.getImagePath())) {
      FileUtil.delete(stored.getImagePath());
    }
    return result;
  }

  public List<WarehouseStock> selectWarehouseStocks(int goodsNo) {
    return withDao(dao -> dao.selectWarehouseStocks(goodsNo));
  }

  /**
   * 관리자 품목 목록을 엑셀 행으로 만든다. 재고 수량은 읽기 전용.
   */
  public List<List<String>> toExcelRows() {
    List<List<String>> rows = new ArrayList<>();
    for (Goods g : selectAdminList()) {
      rows.add(Arrays.asList(
          nvl(g.getGoodsCode()),
          nvl(g.getGoodsName()),
          nvl(g.getCategory()),
          nvl(g.getUnit()),
          String.valueOf(g.getSafetyQty()),
          String.valueOf(g.getUnitPrice()),
          nvl(g.getUseYn()),
          String.valueOf(g.getStockQty())));
    }
    return rows;
  }

  private String nvl(String v) {
    return v == null ? "" : v;
  }

  private <T> T withDao(java.util.function.Function<GoodsDao, T> action) {
    GoodsDao dao = goodsDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(GoodsDao.class);
      }
      return action.apply(dao);
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  private int write(java.util.function.ToIntFunction<GoodsDao> action) {
    GoodsDao dao = goodsDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(GoodsDao.class);
      }
      int result = action.applyAsInt(dao);
      if (session != null) {
        session.commit();
      }
      return result;
    } catch (Exception e) {
      if (session != null) {
        session.rollback();
      }
      return 0;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }
}
