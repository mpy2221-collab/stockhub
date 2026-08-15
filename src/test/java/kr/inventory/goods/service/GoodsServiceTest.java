package kr.inventory.goods.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import java.util.List;
import kr.inventory.common.AppConstants;
import kr.inventory.goods.dao.GoodsDao;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.dto.GoodsSearch;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class GoodsServiceTest {
  @Mock
  private GoodsDao goodsDao;
  @InjectMocks
  private GoodsService goodsService;

  @Test
  void 안전재고_미만이면_부족목록에_포함된다() {
    Goods g = active("A001", 2, 5);
    when(goodsDao.selectStockList(any(GoodsSearch.class))).thenReturn(List.of(g));

    List<Goods> low = goodsService.selectLowStockList();

    assertEquals(1, low.size());
    verify(goodsDao, times(1)).selectStockList(any(GoodsSearch.class));
  }

  @Test
  void 안전재고_이상이면_부족목록에_없다() {
    Goods g = active("A002", 10, 5);
    when(goodsDao.selectStockList(any(GoodsSearch.class))).thenReturn(List.of(g));

    List<Goods> low = goodsService.selectLowStockList();

    assertEquals(0, low.size());
  }

  @Test
  void 품목코드_중복이면_등록_실패한다() {
    Goods g = new Goods();
    g.setGoodsCode("A001");
    when(goodsDao.countByCode("A001")).thenReturn(1);

    int result = goodsService.insert(g);

    assertEquals(0, result);
    verify(goodsDao, never()).insert(any(Goods.class));
  }

  @Test
  void 사용중지_품목은_일반_재고_목록에_안_나온다() {
    Goods on = active("A001", 3, 1);
    Goods off = active("A002", 3, 1);
    off.setUseYn(AppConstants.USE_N);
    when(goodsDao.selectStockList(any(GoodsSearch.class))).thenReturn(List.of(on, off));

    List<Goods> list = goodsService.selectStockList(new GoodsSearch());

    assertEquals(1, list.size());
    assertEquals("A001", list.get(0).getGoodsCode());
  }

  @Test
  void 부족_필터는_합계가_안전재고_미만인_품목만_남긴다() {
    Goods low = active("LOW", 2, 5);
    Goods ok = active("OK", 10, 5);
    GoodsSearch search = new GoodsSearch();
    search.setLowStock(true);
    when(goodsDao.selectStockList(search)).thenReturn(List.of(low, ok));

    List<Goods> list = goodsService.selectStockList(search);

    assertEquals(1, list.size());
    assertEquals("LOW", list.get(0).getGoodsCode());
  }

  @Test
  void 창고_필터면_해당_창고_수량으로_조회한다() {
    GoodsSearch search = new GoodsSearch();
    search.setWarehouseNo(1);
    Goods g = active("A001", 20, 5);
    g.setStockQty(7);
    when(goodsDao.selectStockList(search)).thenReturn(List.of(g));

    List<Goods> list = goodsService.selectStockList(search);

    assertEquals(1, list.size());
    assertEquals(7, list.get(0).getStockQty());
    verify(goodsDao).selectStockList(search);
  }

  @Test
  void 카테고리가_없으면_품목_등록_실패한다() {
    Goods g = new Goods();
    g.setGoodsCode("NEW-001");
    when(goodsDao.countByCode("NEW-001")).thenReturn(0);

    int result = goodsService.insert(g);

    assertEquals(0, result);
    verify(goodsDao, never()).insert(any(Goods.class));
  }

  @Test
  void 허용_확장자면_이미지_경로를_넣고_등록한다() {
    Goods g = new Goods();
    g.setGoodsCode("NEW-001");
    g.setCategoryNo(1);
    g.setImagePath("tmp_abc.jpg");
    when(goodsDao.countByCode("NEW-001")).thenReturn(0);
    when(goodsDao.insert(g)).thenReturn(1);

    int result = goodsService.insert(g);

    assertEquals(1, result);
    verify(goodsDao).insert(g);
  }

  @Test
  void 허용하지_않는_확장자면_등록하지_않는다() {
    Goods g = new Goods();
    g.setGoodsCode("NEW-001");
    g.setCategoryNo(1);
    g.setImagePath("note.gif");
    when(goodsDao.countByCode("NEW-001")).thenReturn(0);

    int result = goodsService.insert(g);

    assertEquals(0, result);
    verify(goodsDao, never()).insert(any(Goods.class));
  }

  @Test
  void 수정_시_새_경로가_없으면_기존_이미지를_유지한다() {
    Goods stored = new Goods();
    stored.setGoodsNo(3);
    stored.setImagePath("old.png");
    Goods incoming = new Goods();
    incoming.setGoodsNo(3);
    incoming.setGoodsCode("A001");
    incoming.setImagePath(null);
    when(goodsDao.countByCodeExcept("A001", 3)).thenReturn(0);
    when(goodsDao.selectOne(3)).thenReturn(stored);
    when(goodsDao.update(incoming)).thenReturn(1);

    int result = goodsService.update(incoming);

    assertEquals(1, result);
    assertEquals("old.png", incoming.getImagePath());
    verify(goodsDao).update(incoming);
  }

  @Test
  void 수정_시_새_경로가_있으면_이미지를_바꾼다() {
    Goods stored = new Goods();
    stored.setGoodsNo(3);
    stored.setImagePath("old.png");
    Goods incoming = new Goods();
    incoming.setGoodsNo(3);
    incoming.setGoodsCode("A001");
    incoming.setImagePath("new.jpg");
    when(goodsDao.countByCodeExcept("A001", 3)).thenReturn(0);
    when(goodsDao.selectOne(3)).thenReturn(stored);
    when(goodsDao.update(incoming)).thenReturn(1);

    int result = goodsService.update(incoming);

    assertEquals(1, result);
    assertEquals("new.jpg", incoming.getImagePath());
    verify(goodsDao).update(incoming);
  }

  @Test
  void 품목_엑셀_행에_코드와_이름이_들어간다() {
    Goods g = active("NB-001", 5, 2);
    g.setGoodsName("노트북");
    g.setCategory("전자기기");
    g.setUnit("대");
    g.setUnitPrice(1200000);
    when(goodsDao.selectAdminListBySearch(any(GoodsSearch.class))).thenReturn(List.of(g));

    List<List<String>> rows = goodsService.toExcelRows();

    assertEquals(1, rows.size());
    assertEquals("NB-001", rows.get(0).get(0));
    assertEquals("노트북", rows.get(0).get(1));
  }

  @Test
  void 품목_관리_목록은_코드나_이름_키워드만_남긴다() {
    Goods hit = active("NB-001", 5, 2);
    hit.setGoodsName("노트북");
    Goods miss = active("PEN-01", 5, 2);
    miss.setGoodsName("볼펜");
    when(goodsDao.selectAdminListBySearch(any(GoodsSearch.class)))
        .thenReturn(List.of(hit, miss));
    GoodsSearch search = new GoodsSearch();
    search.setKeyword("NB");

    List<Goods> list = goodsService.selectAdminList(search);

    assertEquals(1, list.size());
    assertEquals("NB-001", list.get(0).getGoodsCode());
  }

  @Test
  void 품목_관리_목록_사용중지면_중지_품목만_남긴다() {
    Goods on = active("A001", 5, 2);
    Goods off = active("A002", 5, 2);
    off.setUseYn(AppConstants.USE_N);
    when(goodsDao.selectAdminListBySearch(any(GoodsSearch.class)))
        .thenReturn(List.of(on, off));
    GoodsSearch search = new GoodsSearch();
    search.setUseYn(AppConstants.USE_N);

    List<Goods> list = goodsService.selectAdminList(search);

    assertEquals(1, list.size());
    assertEquals("A002", list.get(0).getGoodsCode());
  }

  private Goods active(String code, int totalQty, int safetyQty) {
    Goods g = new Goods();
    g.setGoodsCode(code);
    g.setUseYn(AppConstants.USE_Y);
    g.setTotalQty(totalQty);
    g.setStockQty(totalQty);
    g.setSafetyQty(safetyQty);
    return g;
  }
}
