package kr.inventory.admin.dto;

import java.util.ArrayList;
import java.util.List;
import kr.inventory.goods.dto.Goods;
import kr.inventory.stock.dto.StockHistory;
import kr.inventory.stock.dto.StockRequest;

/**
 * 대시보드 화면용 카드·표.
 */
public class DashboardPage {
  private DashboardSummary summary = new DashboardSummary();
  private List<Goods> lowList = new ArrayList<>();
  private List<StockHistory> recentList = new ArrayList<>();
  private List<StockRequest> waitList = new ArrayList<>();

  public DashboardSummary getSummary() {
    return summary;
  }

  public void setSummary(DashboardSummary summary) {
    this.summary = summary;
  }

  public List<Goods> getLowList() {
    return lowList;
  }

  public void setLowList(List<Goods> lowList) {
    this.lowList = lowList;
  }

  public List<StockHistory> getRecentList() {
    return recentList;
  }

  public void setRecentList(List<StockHistory> recentList) {
    this.recentList = recentList;
  }

  public List<StockRequest> getWaitList() {
    return waitList;
  }

  public void setWaitList(List<StockRequest> waitList) {
    this.waitList = waitList;
  }
}
