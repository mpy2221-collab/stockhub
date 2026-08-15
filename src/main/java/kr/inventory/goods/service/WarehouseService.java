package kr.inventory.goods.service;

import java.util.ArrayList;
import java.util.List;
import kr.inventory.common.AppConstants;
import kr.inventory.common.MybatisUtil;
import kr.inventory.goods.dao.WarehouseDao;
import kr.inventory.goods.dto.AdminSearch;
import kr.inventory.goods.dto.Warehouse;
import org.apache.ibatis.session.SqlSession;

/**
 * 창고 등록·수정과 목록 조회를 담당한다.
 */
public class WarehouseService {
  private WarehouseDao warehouseDao;

  public WarehouseService() {
  }

  public WarehouseService(WarehouseDao warehouseDao) {
    this.warehouseDao = warehouseDao;
  }

  public List<Warehouse> selectAll() {
    return withDao(dao -> dao.selectAll());
  }

  public List<Warehouse> selectList(AdminSearch search) {
    AdminSearch cond = search == null ? new AdminSearch() : search;
    if (cond.getKeyword() != null) {
      cond.setKeyword(cond.getKeyword().trim());
    }
    List<Warehouse> raw = withDao(dao -> dao.selectList(cond));
    return filterList(raw, cond);
  }

  private List<Warehouse> filterList(List<Warehouse> raw, AdminSearch cond) {
    String key = cond.getKeyword() == null ? "" : cond.getKeyword().toLowerCase();
    String useYn = cond.getUseYn();
    List<Warehouse> result = new ArrayList<>();
    for (Warehouse w : raw) {
      if (useYn != null && !useYn.isEmpty() && !useYn.equals(w.getUseYn())) {
        continue;
      }
      if (!key.isEmpty()) {
        String name = w.getWarehouseName() == null ? "" : w.getWarehouseName().toLowerCase();
        if (!name.contains(key)) {
          continue;
        }
      }
      result.add(w);
    }
    return result;
  }

  private <T> T withDao(java.util.function.Function<WarehouseDao, T> action) {
    WarehouseDao dao = warehouseDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(WarehouseDao.class);
      }
      return action.apply(dao);
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  public List<Warehouse> selectActiveList() {
    return withDao(dao -> dao.selectActiveList());
  }

  public Warehouse selectOne(int warehouseNo) {
    return withDao(dao -> dao.selectOne(warehouseNo));
  }

  public int insert(Warehouse warehouse) {
    if (warehouse.getUseYn() == null || warehouse.getUseYn().isEmpty()) {
      warehouse.setUseYn(AppConstants.USE_Y);
    }
    return write(dao -> dao.insert(warehouse));
  }

  public int update(Warehouse warehouse) {
    return write(dao -> dao.update(warehouse));
  }

  private int write(java.util.function.ToIntFunction<WarehouseDao> action) {
    WarehouseDao dao = warehouseDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(WarehouseDao.class);
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
