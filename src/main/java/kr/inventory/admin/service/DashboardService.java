package kr.inventory.admin.service;

import java.time.Instant;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.inventory.admin.dao.DashboardDao;
import kr.inventory.admin.dto.ChartPoint;
import kr.inventory.admin.dto.DashboardChart;
import kr.inventory.admin.dto.DashboardPage;
import kr.inventory.admin.dto.DashboardSummary;
import kr.inventory.common.AppConstants;
import kr.inventory.common.MybatisUtil;
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
import org.apache.ibatis.session.SqlSession;

/**
 * 대시보드 카드·표·차트 숫자를 한 세션에서 모은다.
 */
public class DashboardService {
  private GoodsDao goodsDao;
  private WarehouseDao warehouseDao;
  private CategoryDao categoryDao;
  private MemberDao memberDao;
  private GoodsService goodsService;
  private StockDao stockDao;
  private RequestDao requestDao;
  private DashboardDao dashboardDao;

  public DashboardService() {
  }

  public DashboardService(GoodsDao goodsDao, WarehouseDao warehouseDao, CategoryDao categoryDao,
      MemberDao memberDao, GoodsService goodsService, StockDao stockDao, RequestDao requestDao,
      DashboardDao dashboardDao) {
    this.goodsDao = goodsDao;
    this.warehouseDao = warehouseDao;
    this.categoryDao = categoryDao;
    this.memberDao = memberDao;
    this.goodsService = goodsService;
    this.stockDao = stockDao;
    this.requestDao = requestDao;
    this.dashboardDao = dashboardDao;
  }

  public DashboardPage loadPage() {
    boolean owned = goodsDao == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : null;
    try {
      GoodsDao gDao = goodsDao != null ? goodsDao : session.getMapper(GoodsDao.class);
      WarehouseDao wDao = warehouseDao != null ? warehouseDao : session.getMapper(WarehouseDao.class);
      CategoryDao cDao = categoryDao != null ? categoryDao : session.getMapper(CategoryDao.class);
      MemberDao mDao = memberDao != null ? memberDao : session.getMapper(MemberDao.class);
      StockDao sDao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
      RequestDao rDao = requestDao != null ? requestDao : session.getMapper(RequestDao.class);
      DashboardDao dDao = dashboardDao != null ? dashboardDao : session.getMapper(DashboardDao.class);
      GoodsService gs = goodsService != null ? goodsService : new GoodsService(gDao);

      List<Goods> low = gs.selectLowStockList();
      List<StockRequest> wait = waitOnly(rDao.selectList());
      List<StockHistory> history = sDao.selectHistoryList();
      int[] inOut = sumInOut(history);

      DashboardSummary summary = new DashboardSummary();
      summary.setGoodsCount(gDao.countAll());
      summary.setWarehouseCount(wDao.countAll());
      summary.setCategoryCount(cDao.countAll());
      summary.setMemberCount(mDao.countAll());
      summary.setTotalStockQty(dDao.sumActiveStock());
      summary.setLowStockCount(low.size());
      summary.setTodayInOutQty(inOut[0]);
      summary.setMonthInOutQty(inOut[1]);
      summary.setWaitRequestCount(wait.size());

      DashboardPage page = new DashboardPage();
      page.setSummary(summary);
      page.setLowList(low);
      page.setRecentList(recent(history));
      page.setWaitList(wait);
      return page;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  /**
   * 월별 IN/OUT, 창고·카테고리 재고, 출고 상위 5.
   */
  public DashboardChart loadChart() {
    boolean owned = stockDao == null;
    SqlSession session = owned ? MybatisUtil.getSqlSession() : null;
    try {
      StockDao sDao = stockDao != null ? stockDao : session.getMapper(StockDao.class);
      DashboardDao dDao = dashboardDao != null ? dashboardDao : session.getMapper(DashboardDao.class);
      List<StockHistory> history = sDao.selectHistoryList();
      DashboardChart chart = new DashboardChart();
      fillMonthly(chart, history);
      fillPoints(chart.getWarehouseLabels(), chart.getWarehouseValues(),
          dDao.selectWarehouseStock());
      fillPoints(chart.getCategoryLabels(), chart.getCategoryValues(),
          dDao.selectCategoryStock());
      fillTopOut(chart, history);
      return chart;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  private List<StockRequest> waitOnly(List<StockRequest> all) {
    List<StockRequest> wait = new ArrayList<>();
    if (all == null) {
      return wait;
    }
    for (StockRequest r : all) {
      if (AppConstants.REQUEST_WAIT.equals(r.getStatus())) {
        wait.add(r);
      }
    }
    return wait;
  }

  private List<StockHistory> recent(List<StockHistory> history) {
    if (history == null || history.isEmpty()) {
      return Collections.emptyList();
    }
    int to = Math.min(10, history.size());
    return new ArrayList<>(history.subList(0, to));
  }

  /**
   * [0] 오늘 IN+OUT, [1] 이번 달 IN+OUT. ADJUST는 넣지 않는다.
   */
  private int[] sumInOut(List<StockHistory> history) {
    int todayQty = 0;
    int monthQty = 0;
    LocalDate today = LocalDate.now();
    YearMonth month = YearMonth.from(today);
    if (history == null) {
      return new int[] {0, 0};
    }
    for (StockHistory h : history) {
      if (!isInOrOut(h)) {
        continue;
      }
      LocalDate day = toLocalDate(h.getHistoryDate());
      if (day == null) {
        continue;
      }
      if (day.equals(today)) {
        todayQty += h.getQty();
      }
      if (YearMonth.from(day).equals(month)) {
        monthQty += h.getQty();
      }
    }
    return new int[] {todayQty, monthQty};
  }

  private void fillMonthly(DashboardChart chart, List<StockHistory> history) {
    YearMonth now = YearMonth.now();
    List<YearMonth> months = new ArrayList<>();
    for (int i = 5; i >= 0; i--) {
      months.add(now.minusMonths(i));
    }
    int[] inQty = new int[6];
    int[] outQty = new int[6];
    if (history != null) {
      for (StockHistory h : history) {
        LocalDate day = toLocalDate(h.getHistoryDate());
        if (day == null) {
          continue;
        }
        int idx = months.indexOf(YearMonth.from(day));
        if (idx < 0) {
          continue;
        }
        if (AppConstants.HISTORY_TYPE_IN.equals(h.getHistoryType())) {
          inQty[idx] += h.getQty();
        } else if (AppConstants.HISTORY_TYPE_OUT.equals(h.getHistoryType())) {
          outQty[idx] += h.getQty();
        }
      }
    }
    for (int i = 0; i < months.size(); i++) {
      chart.getMonthLabels().add(months.get(i).toString());
      chart.getMonthIn().add(inQty[i]);
      chart.getMonthOut().add(outQty[i]);
    }
  }

  private void fillTopOut(DashboardChart chart, List<StockHistory> history) {
    Map<Integer, ChartPoint> map = new HashMap<>();
    if (history != null) {
      for (StockHistory h : history) {
        if (!AppConstants.HISTORY_TYPE_OUT.equals(h.getHistoryType())) {
          continue;
        }
        ChartPoint p = map.get(h.getGoodsNo());
        if (p == null) {
          String name = h.getGoodsName() != null && !h.getGoodsName().isEmpty()
              ? h.getGoodsName() : h.getGoodsCode();
          p = new ChartPoint(name, 0);
          map.put(h.getGoodsNo(), p);
        }
        p.setValue(p.getValue() + h.getQty());
      }
    }
    List<ChartPoint> ranked = new ArrayList<>(map.values());
    ranked.sort(Comparator.comparingInt(ChartPoint::getValue).reversed());
    int limit = Math.min(5, ranked.size());
    for (int i = 0; i < limit; i++) {
      chart.getTopOutLabels().add(ranked.get(i).getLabel());
      chart.getTopOutValues().add(ranked.get(i).getValue());
    }
  }

  private void fillPoints(List<String> labels, List<Integer> values, List<ChartPoint> points) {
    if (points == null) {
      return;
    }
    for (ChartPoint p : points) {
      labels.add(p.getLabel());
      values.add(p.getValue());
    }
  }

  private boolean isInOrOut(StockHistory h) {
    String type = h.getHistoryType();
    return AppConstants.HISTORY_TYPE_IN.equals(type)
        || AppConstants.HISTORY_TYPE_OUT.equals(type);
  }

  private LocalDate toLocalDate(Date date) {
    if (date == null) {
      return null;
    }
    return Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
  }
}
