package kr.inventory.stock.dto;

import java.util.Date;

/**
 * 실제 재고 변동 이력. 이동은 같은 groupNo의 OUT+IN 두 행.
 */
public class StockHistory {
  private int historyNo;
  private int groupNo;
  private String historyType;
  private int warehouseNo;
  private int goodsNo;
  private int qty;
  private int beforeQty;
  private int afterQty;
  private String memberId;
  private Integer requestNo;
  private String memo;
  private Date historyDate;
  private String goodsCode;
  private String goodsName;
  private String warehouseName;

  public int getHistoryNo() {
    return historyNo;
  }

  public void setHistoryNo(int historyNo) {
    this.historyNo = historyNo;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }

  public String getHistoryType() {
    return historyType;
  }

  public void setHistoryType(String historyType) {
    this.historyType = historyType;
  }

  public int getWarehouseNo() {
    return warehouseNo;
  }

  public void setWarehouseNo(int warehouseNo) {
    this.warehouseNo = warehouseNo;
  }

  public int getGoodsNo() {
    return goodsNo;
  }

  public void setGoodsNo(int goodsNo) {
    this.goodsNo = goodsNo;
  }

  public int getQty() {
    return qty;
  }

  public void setQty(int qty) {
    this.qty = qty;
  }

  public int getBeforeQty() {
    return beforeQty;
  }

  public void setBeforeQty(int beforeQty) {
    this.beforeQty = beforeQty;
  }

  public int getAfterQty() {
    return afterQty;
  }

  public void setAfterQty(int afterQty) {
    this.afterQty = afterQty;
  }

  public String getMemberId() {
    return memberId;
  }

  public void setMemberId(String memberId) {
    this.memberId = memberId;
  }

  public Integer getRequestNo() {
    return requestNo;
  }

  public void setRequestNo(Integer requestNo) {
    this.requestNo = requestNo;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }

  public Date getHistoryDate() {
    return historyDate;
  }

  public void setHistoryDate(Date historyDate) {
    this.historyDate = historyDate;
  }

  public String getGoodsCode() {
    return goodsCode;
  }

  public void setGoodsCode(String goodsCode) {
    this.goodsCode = goodsCode;
  }

  public String getGoodsName() {
    return goodsName;
  }

  public void setGoodsName(String goodsName) {
    this.goodsName = goodsName;
  }

  public String getWarehouseName() {
    return warehouseName;
  }

  public void setWarehouseName(String warehouseName) {
    this.warehouseName = warehouseName;
  }
}
