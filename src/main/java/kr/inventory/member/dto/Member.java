package kr.inventory.member.dto;

import java.util.Date;

/**
 * 회원 정보.
 */
public class Member {
  private int memberNo;
  private String memberId;
  private String memberPw;
  private String memberName;
  private String memberPhone;
  private String memberAddr;
  private String memberEmail;
  private int memberLevel;
  private Date enrollDate;

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public String getMemberId() {
    return memberId;
  }

  public void setMemberId(String memberId) {
    this.memberId = memberId;
  }

  public String getMemberPw() {
    return memberPw;
  }

  public void setMemberPw(String memberPw) {
    this.memberPw = memberPw;
  }

  public String getMemberName() {
    return memberName;
  }

  public void setMemberName(String memberName) {
    this.memberName = memberName;
  }

  public String getMemberPhone() {
    return memberPhone;
  }

  public void setMemberPhone(String memberPhone) {
    this.memberPhone = memberPhone;
  }

  public String getMemberAddr() {
    return memberAddr;
  }

  public void setMemberAddr(String memberAddr) {
    this.memberAddr = memberAddr;
  }

  public String getMemberEmail() {
    return memberEmail;
  }

  public void setMemberEmail(String memberEmail) {
    this.memberEmail = memberEmail;
  }

  public int getMemberLevel() {
    return memberLevel;
  }

  public void setMemberLevel(int memberLevel) {
    this.memberLevel = memberLevel;
  }

  public Date getEnrollDate() {
    return enrollDate;
  }

  public void setEnrollDate(Date enrollDate) {
    this.enrollDate = enrollDate;
  }
}
