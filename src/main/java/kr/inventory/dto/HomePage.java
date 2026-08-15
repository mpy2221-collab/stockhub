package kr.inventory.dto;

import java.util.ArrayList;
import java.util.List;
import kr.inventory.goods.dto.Goods;
import kr.inventory.stock.dto.StockRequest;

/**
 * 메인 홈에 올릴 카드·표.
 */
public class HomePage {
  private int totalGoodsCount;
  private int myWaitRequestCount;
  private int lowStockCount;
  private int myMonthApprovedCount;
  private int waitRequestCount;
  private List<StockRequest> recentMyRequests = new ArrayList<>();
  private List<Goods> lowStockList = new ArrayList<>();

  public int getTotalGoodsCount() {
    return totalGoodsCount;
  }

  public void setTotalGoodsCount(int totalGoodsCount) {
    this.totalGoodsCount = totalGoodsCount;
  }

  public int getMyWaitRequestCount() {
    return myWaitRequestCount;
  }

  public void setMyWaitRequestCount(int myWaitRequestCount) {
    this.myWaitRequestCount = myWaitRequestCount;
  }

  public int getLowStockCount() {
    return lowStockCount;
  }

  public void setLowStockCount(int lowStockCount) {
    this.lowStockCount = lowStockCount;
  }

  public int getMyMonthApprovedCount() {
    return myMonthApprovedCount;
  }

  public void setMyMonthApprovedCount(int myMonthApprovedCount) {
    this.myMonthApprovedCount = myMonthApprovedCount;
  }

  public int getWaitRequestCount() {
    return waitRequestCount;
  }

  public void setWaitRequestCount(int waitRequestCount) {
    this.waitRequestCount = waitRequestCount;
  }

  public List<StockRequest> getRecentMyRequests() {
    return recentMyRequests;
  }

  public void setRecentMyRequests(List<StockRequest> recentMyRequests) {
    this.recentMyRequests = recentMyRequests;
  }

  public List<Goods> getLowStockList() {
    return lowStockList;
  }

  public void setLowStockList(List<Goods> lowStockList) {
    this.lowStockList = lowStockList;
  }
}
