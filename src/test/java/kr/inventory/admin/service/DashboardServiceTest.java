package kr.inventory.admin.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import kr.inventory.admin.dao.DashboardDao;
import kr.inventory.admin.dto.DashboardChart;
import kr.inventory.admin.dto.DashboardPage;
import kr.inventory.common.AppConstants;
import kr.inventory.goods.dao.CategoryDao;
import kr.inventory.goods.dao.GoodsDao;
import kr.inventory.goods.dao.WarehouseDao;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.service.GoodsService;
import kr.inventory.member.dao.MemberDao;
import kr.inventory.stock.dao.RequestDao;
import kr.inventory.stock.dao.StockDao;
import kr.inventory.stock.dto.StockHistory;
import kr.inventory.stock.dto.StockRequest;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class DashboardServiceTest {
  @Mock
  private GoodsDao goodsDao;
  @Mock
  private WarehouseDao warehouseDao;
  @Mock
  private CategoryDao categoryDao;
  @Mock
  private MemberDao memberDao;
  @Mock
  private GoodsService goodsService;
  @Mock
  private StockDao stockDao;
  @Mock
  private RequestDao requestDao;
  @Mock
  private DashboardDao dashboardDao;
  @InjectMocks
  private DashboardService dashboardService;

  @Test
  void 미달_카드_건수가_안전재고_미만_품목_수와_같다() {
    Goods low1 = goods(1, "A", 2, 5);
    Goods low2 = goods(2, "B", 1, 10);
    when(goodsService.selectLowStockList()).thenReturn(List.of(low1, low2));
    when(goodsDao.countAll()).thenReturn(0);
    when(warehouseDao.countAll()).thenReturn(0);
    when(categoryDao.countAll()).thenReturn(0);
    when(memberDao.countAll()).thenReturn(0);
    when(dashboardDao.sumActiveStock()).thenReturn(0);
    when(requestDao.selectList()).thenReturn(List.of());
    when(stockDao.selectHistoryList()).thenReturn(List.of());

    DashboardPage page = dashboardService.loadPage();

    assertEquals(2, page.getLowList().size());
    assertEquals(page.getLowList().size(), page.getSummary().getLowStockCount());
  }

  @Test
  void 대기_요청_건수는_WAIT만_센다() {
    when(goodsService.selectLowStockList()).thenReturn(List.of());
    when(goodsDao.countAll()).thenReturn(0);
    when(warehouseDao.countAll()).thenReturn(0);
    when(categoryDao.countAll()).thenReturn(0);
    when(memberDao.countAll()).thenReturn(0);
    when(dashboardDao.sumActiveStock()).thenReturn(0);
    when(requestDao.selectList()).thenReturn(List.of(
        request(AppConstants.REQUEST_WAIT),
        request(AppConstants.REQUEST_APPROVE),
        request(AppConstants.REQUEST_REJECT),
        request(AppConstants.REQUEST_WAIT)));
    when(stockDao.selectHistoryList()).thenReturn(List.of());

    DashboardPage page = dashboardService.loadPage();

    assertEquals(2, page.getSummary().getWaitRequestCount());
    assertEquals(2, page.getWaitList().size());
  }

  @Test
  void 오늘_입출고_수량에_ADJUST는_넣지_않는다() {
    when(goodsService.selectLowStockList()).thenReturn(List.of());
    when(goodsDao.countAll()).thenReturn(0);
    when(warehouseDao.countAll()).thenReturn(0);
    when(categoryDao.countAll()).thenReturn(0);
    when(memberDao.countAll()).thenReturn(0);
    when(dashboardDao.sumActiveStock()).thenReturn(0);
    when(requestDao.selectList()).thenReturn(List.of());
    Date today = toDate(LocalDate.now());
    when(stockDao.selectHistoryList()).thenReturn(List.of(
        history(AppConstants.HISTORY_TYPE_IN, 10, today, 1, "펜"),
        history(AppConstants.HISTORY_TYPE_OUT, 3, today, 1, "펜"),
        history(AppConstants.HISTORY_TYPE_ADJUST, 20, today, 2, "노트")));

    DashboardPage page = dashboardService.loadPage();

    assertEquals(13, page.getSummary().getTodayInOutQty());
    assertEquals(13, page.getSummary().getMonthInOutQty());
  }

  @Test
  void 출고_상위_품목은_OUT_수량_합_내림차순이다() {
    Date today = toDate(LocalDate.now());
    when(stockDao.selectHistoryList()).thenReturn(List.of(
        history(AppConstants.HISTORY_TYPE_OUT, 4, today, 1, "펜"),
        history(AppConstants.HISTORY_TYPE_OUT, 10, today, 2, "노트"),
        history(AppConstants.HISTORY_TYPE_OUT, 2, today, 1, "펜"),
        history(AppConstants.HISTORY_TYPE_IN, 50, today, 3, "자")));
    when(dashboardDao.selectWarehouseStock()).thenReturn(List.of());
    when(dashboardDao.selectCategoryStock()).thenReturn(List.of());

    DashboardChart chart = dashboardService.loadChart();

    assertEquals(List.of("노트", "펜"), chart.getTopOutLabels());
    assertEquals(List.of(10, 6), chart.getTopOutValues());
  }

  private Goods goods(int no, String code, int total, int safety) {
    Goods g = new Goods();
    g.setGoodsNo(no);
    g.setGoodsCode(code);
    g.setTotalQty(total);
    g.setSafetyQty(safety);
    g.setUseYn(AppConstants.USE_Y);
    return g;
  }

  private StockRequest request(String status) {
    StockRequest r = new StockRequest();
    r.setStatus(status);
    return r;
  }

  private StockHistory history(String type, int qty, Date date, int goodsNo, String name) {
    StockHistory h = new StockHistory();
    h.setHistoryType(type);
    h.setQty(qty);
    h.setHistoryDate(date);
    h.setGoodsNo(goodsNo);
    h.setGoodsName(name);
    return h;
  }

  private Date toDate(LocalDate day) {
    return Date.from(day.atStartOfDay(ZoneId.systemDefault()).toInstant());
  }
}
