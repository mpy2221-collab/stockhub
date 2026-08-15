package kr.inventory.goods.dto;

/**
 * 관리자 창고·카테고리 목록 검색 조건.
 */
public class AdminSearch {
  private String keyword;
  private String useYn;

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }

  public String getUseYn() {
    return useYn;
  }

  public void setUseYn(String useYn) {
    this.useYn = useYn;
  }
}
