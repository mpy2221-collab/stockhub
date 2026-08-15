package kr.inventory.service;

import java.time.Instant;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import kr.inventory.common.AppConstants;
import kr.inventory.dto.HomePage;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.dto.GoodsSearch;
import kr.inventory.goods.service.GoodsService;
import kr.inventory.stock.dto.StockRequest;
import kr.inventory.stock.service.StockService;

/**
 * 메인 홈 카드·표를 기존 조회 Service로 모은다.
 */
public class HomeService {
  private GoodsService goodsService;
  private StockService stockService;

  public HomeService() {
  }

  public HomeService(GoodsService goodsService, StockService stockService) {
    this.goodsService = goodsService;
    this.stockService = stockService;
  }

  public HomePage load(String memberId) {
    GoodsService gs = goodsService != null ? goodsService : new GoodsService();
    StockService ss = stockService != null ? stockService : new StockService();
    List<Goods> active = gs.selectStockList(new GoodsSearch());
    List<Goods> low = gs.selectLowStockList();
    List<StockRequest> mine = ss.selectMyRequestList(memberId);
    if (mine == null) {
      mine = Collections.emptyList();
    }
    if (low == null) {
      low = Collections.emptyList();
    }
    HomePage page = new HomePage();
    page.setTotalGoodsCount(active == null ? 0 : active.size());
    page.setMyWaitRequestCount(countStatus(mine, AppConstants.REQUEST_WAIT));
    page.setLowStockCount(low.size());
    page.setMyMonthApprovedCount(countMonthApproved(mine));
    page.setRecentMyRequests(first(mine, 5));
    page.setLowStockList(first(low, 5));
    page.setWaitRequestCount(ss.countWaitRequest());
    return page;
  }

  private int countStatus(List<StockRequest> list, String status) {
    int n = 0;
    for (StockRequest r : list) {
      if (status.equals(r.getStatus())) {
        n++;
      }
    }
    return n;
  }

  /**
   * 이번 달 APPROVE만. process_date가 없으면 request_date.
   */
  private int countMonthApproved(List<StockRequest> list) {
    YearMonth month = YearMonth.now();
    int n = 0;
    for (StockRequest r : list) {
      if (!AppConstants.REQUEST_APPROVE.equals(r.getStatus())) {
        continue;
      }
      Date raw = r.getProcessDate() != null ? r.getProcessDate() : r.getRequestDate();
      LocalDate day = toLocalDate(raw);
      if (day != null && YearMonth.from(day).equals(month)) {
        n++;
      }
    }
    return n;
  }

  private <T> List<T> first(List<T> list, int size) {
    if (list.isEmpty()) {
      return Collections.emptyList();
    }
    return new ArrayList<>(list.subList(0, Math.min(size, list.size())));
  }

  private LocalDate toLocalDate(Date date) {
    if (date == null) {
      return null;
    }
    return Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
  }
}
