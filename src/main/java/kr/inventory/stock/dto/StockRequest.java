package kr.inventory.stock.dto;

import java.util.Date;

/**
 * 입고·출고 요청. 이 테이블에서 재고를 직접 바꾸지 않는다.
 */
public class StockRequest {
  private int requestNo;
  private String memberId;
  private int warehouseNo;
  private int goodsNo;
  private int qty;
  private String requestType;
  private String status;
  private String memo;
  private Date requestDate;
  private Date processDate;
  private String processMemberId;
  private String goodsCode;
  private String goodsName;
  private String warehouseName;
  private int stockQty;

  public int getRequestNo() {
    return requestNo;
  }

  public void setRequestNo(int requestNo) {
    this.requestNo = requestNo;
  }

  public String getMemberId() {
    return memberId;
  }

  public void setMemberId(String memberId) {
    this.memberId = memberId;
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

  public String getRequestType() {
    return requestType;
  }

  public void setRequestType(String requestType) {
    this.requestType = requestType;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }

  public Date getRequestDate() {
    return requestDate;
  }

  public void setRequestDate(Date requestDate) {
    this.requestDate = requestDate;
  }

  public Date getProcessDate() {
    return processDate;
  }

  public void setProcessDate(Date processDate) {
    this.processDate = processDate;
  }

  public String getProcessMemberId() {
    return processMemberId;
  }

  public void setProcessMemberId(String processMemberId) {
    this.processMemberId = processMemberId;
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

  public int getStockQty() {
    return stockQty;
  }

  public void setStockQty(int stockQty) {
    this.stockQty = stockQty;
  }
}
