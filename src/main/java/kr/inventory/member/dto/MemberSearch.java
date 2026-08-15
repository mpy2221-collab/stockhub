package kr.inventory.member.dto;

/**
 * 관리자 회원 목록 검색 조건.
 */
public class MemberSearch {
  private String keyword;
  private Integer memberLevel;

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }

  public Integer getMemberLevel() {
    return memberLevel;
  }

  public void setMemberLevel(Integer memberLevel) {
    this.memberLevel = memberLevel;
  }
}
