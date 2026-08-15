package kr.inventory.admin.dto;

/**
 * 관리자 홈 요약 숫자.
 */
public class DashboardSummary {
  private int goodsCount;
  private int warehouseCount;
  private int categoryCount;
  private int memberCount;
  private int totalStockQty;
  private int lowStockCount;
  private int todayInOutQty;
  private int monthInOutQty;
  private int waitRequestCount;

  public int getGoodsCount() {
    return goodsCount;
  }

  public void setGoodsCount(int goodsCount) {
    this.goodsCount = goodsCount;
  }

  public int getWarehouseCount() {
    return warehouseCount;
  }

  public void setWarehouseCount(int warehouseCount) {
    this.warehouseCount = warehouseCount;
  }

  public int getCategoryCount() {
    return categoryCount;
  }

  public void setCategoryCount(int categoryCount) {
    this.categoryCount = categoryCount;
  }

  public int getMemberCount() {
    return memberCount;
  }

  public void setMemberCount(int memberCount) {
    this.memberCount = memberCount;
  }

  public int getTotalStockQty() {
    return totalStockQty;
  }

  public void setTotalStockQty(int totalStockQty) {
    this.totalStockQty = totalStockQty;
  }

  public int getLowStockCount() {
    return lowStockCount;
  }

  public void setLowStockCount(int lowStockCount) {
    this.lowStockCount = lowStockCount;
  }

  public int getTodayInOutQty() {
    return todayInOutQty;
  }

  public void setTodayInOutQty(int todayInOutQty) {
    this.todayInOutQty = todayInOutQty;
  }

  public int getMonthInOutQty() {
    return monthInOutQty;
  }

  public void setMonthInOutQty(int monthInOutQty) {
    this.monthInOutQty = monthInOutQty;
  }

  public int getWaitRequestCount() {
    return waitRequestCount;
  }

  public void setWaitRequestCount(int waitRequestCount) {
    this.waitRequestCount = waitRequestCount;
  }
}
