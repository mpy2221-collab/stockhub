package kr.inventory.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import kr.inventory.common.AppConstants;
import kr.inventory.dto.HomePage;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.dto.GoodsSearch;
import kr.inventory.goods.service.GoodsService;
import kr.inventory.stock.dto.StockRequest;
import kr.inventory.stock.service.StockService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class HomeServiceTest {
  @Mock
  private GoodsService goodsService;
  @Mock
  private StockService stockService;
  @InjectMocks
  private HomeService homeService;

  @Test
  void 내_대기_요청_건수는_본인_WAIT만_센다() {
    when(goodsService.selectStockList(any(GoodsSearch.class))).thenReturn(List.of());
    when(goodsService.selectLowStockList()).thenReturn(List.of());
    when(stockService.selectMyRequestList("user1")).thenReturn(List.of(
        request(AppConstants.REQUEST_WAIT, LocalDate.now(), null),
        request(AppConstants.REQUEST_APPROVE, LocalDate.now(), LocalDate.now()),
        request(AppConstants.REQUEST_WAIT, LocalDate.now(), null)));
    when(stockService.countWaitRequest()).thenReturn(0);

    HomePage page = homeService.load("user1");

    assertEquals(2, page.getMyWaitRequestCount());
  }

  @Test
  void 이번_달_승인_건수는_본인_APPROVE만_센다() {
    when(goodsService.selectStockList(any(GoodsSearch.class))).thenReturn(List.of());
    when(goodsService.selectLowStockList()).thenReturn(List.of());
    when(stockService.selectMyRequestList("user1")).thenReturn(List.of(
        request(AppConstants.REQUEST_APPROVE, LocalDate.now(), LocalDate.now()),
        request(AppConstants.REQUEST_REJECT, LocalDate.now(), LocalDate.now()),
        request(AppConstants.REQUEST_APPROVE, LocalDate.now().minusMonths(1),
            LocalDate.now().minusMonths(1))));
    when(stockService.countWaitRequest()).thenReturn(0);

    HomePage page = homeService.load("user1");

    assertEquals(1, page.getMyMonthApprovedCount());
  }

  @Test
  void 미달_카드_건수는_안전재고_미만_품목_수와_같다() {
    List<Goods> low = List.of(goods("A"), goods("B"), goods("C"));
    when(goodsService.selectStockList(any(GoodsSearch.class))).thenReturn(List.of());
    when(goodsService.selectLowStockList()).thenReturn(low);
    when(stockService.selectMyRequestList("user1")).thenReturn(List.of());
    when(stockService.countWaitRequest()).thenReturn(0);

    HomePage page = homeService.load("user1");

    assertEquals(3, page.getLowStockCount());
    assertEquals(page.getLowStockList().size(), page.getLowStockCount());
  }

  @Test
  void 최근_내_요청은_최대_5건이다() {
    List<StockRequest> mine = new ArrayList<>();
    for (int i = 0; i < 7; i++) {
      mine.add(request(AppConstants.REQUEST_WAIT, LocalDate.now(), null));
    }
    when(goodsService.selectStockList(any(GoodsSearch.class))).thenReturn(List.of());
    when(goodsService.selectLowStockList()).thenReturn(List.of());
    when(stockService.selectMyRequestList("user1")).thenReturn(mine);
    when(stockService.countWaitRequest()).thenReturn(0);

    HomePage page = homeService.load("user1");

    assertEquals(5, page.getRecentMyRequests().size());
  }

  private Goods goods(String code) {
    Goods g = new Goods();
    g.setGoodsCode(code);
    g.setUseYn(AppConstants.USE_Y);
    return g;
  }

  private StockRequest request(String status, LocalDate requestDay, LocalDate processDay) {
    StockRequest r = new StockRequest();
    r.setStatus(status);
    r.setRequestDate(toDate(requestDay));
    r.setProcessDate(processDay == null ? null : toDate(processDay));
    return r;
  }

  private Date toDate(LocalDate day) {
    return Date.from(day.atStartOfDay(ZoneId.systemDefault()).toInstant());
  }
}
