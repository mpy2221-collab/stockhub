package kr.inventory.stock.dto;

/**
 * 입출고 이력 검색 조건. type은 Service에서 MOVE 묶음과 함께 거른다.
 */
public class HistorySearch {
  private String type;
  private String from;
  private String to;
  private Integer warehouseNo;
  private String keyword;

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getFrom() {
    return from;
  }

  public void setFrom(String from) {
    this.from = from;
  }

  public String getTo() {
    return to;
  }

  public void setTo(String to) {
    this.to = to;
  }

  public Integer getWarehouseNo() {
    return warehouseNo;
  }

  public void setWarehouseNo(Integer warehouseNo) {
    this.warehouseNo = warehouseNo;
  }

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }
}
