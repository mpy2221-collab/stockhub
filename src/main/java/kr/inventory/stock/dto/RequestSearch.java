package kr.inventory.stock.dto;

/**
 * 관리자 요청 목록 검색 조건.
 */
public class RequestSearch {
  private String status;
  private String requestType;
  private String keyword;

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getRequestType() {
    return requestType;
  }

  public void setRequestType(String requestType) {
    this.requestType = requestType;
  }

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }
}
