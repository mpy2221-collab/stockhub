package kr.inventory.member.service;

import kr.inventory.member.dto.Member;

/**
 * 회원 입력값 형식 검사. 화면 검증을 우회해도 막도록 Service에서도 같은 규칙을 쓴다.
 * 통과하면 null, 아니면 틀린 입력의 name을 돌려준다.
 */
public final class MemberValidator {
  public static final String ID_REGEX = "^[a-z][a-z0-9_]{3,19}$";
  public static final String PW_REGEX = "^(?=.*[A-Za-z])(?=.*[0-9]).{8,20}$";
  public static final String NAME_REGEX = "^[가-힣a-zA-Z]{2,20}$";
  public static final String PHONE_REGEX = "^01[016789]-?[0-9]{3,4}-?[0-9]{4}$";
  public static final String ADDR_REGEX = "^.{2,100}$";
  public static final String EMAIL_REGEX = "^[^@\\s]+@[^@\\s]+\\.[a-zA-Z]{2,}$";

  private MemberValidator() {
  }

  /**
   * 가입 폼 전체. 이메일까지 본다.
   */
  public static String validateJoin(Member member) {
    if (member == null) {
      return "memberId";
    }
    if (!matches(member.getMemberId(), ID_REGEX)) {
      return "memberId";
    }
    if (!matches(member.getMemberPw(), PW_REGEX)) {
      return "memberPw";
    }
    String profile = validateProfile(member);
    if (profile != null) {
      return profile;
    }
    if (!matches(member.getMemberEmail(), EMAIL_REGEX)) {
      return "memberEmail";
    }
    return null;
  }

  /**
   * 마이페이지에서 고칠 수 있는 값만. 전화·주소는 비워도 된다.
   */
  public static String validateProfile(Member member) {
    if (member == null) {
      return "memberName";
    }
    if (!matches(member.getMemberName(), NAME_REGEX)) {
      return "memberName";
    }
    if (isFilled(member.getMemberPhone()) && !matches(member.getMemberPhone(), PHONE_REGEX)) {
      return "memberPhone";
    }
    if (isFilled(member.getMemberAddr()) && !matches(member.getMemberAddr(), ADDR_REGEX)) {
      return "memberAddr";
    }
    return null;
  }

  public static String message(String field) {
    if ("memberId".equals(field)) {
      return "아이디는 영문 소문자로 시작하는 4~20자입니다. 영문 소문자, 숫자, _만 쓸 수 있습니다.";
    }
    if ("memberPw".equals(field)) {
      return "비밀번호는 영문과 숫자를 함께 쓴 8~20자입니다.";
    }
    if ("memberName".equals(field)) {
      return "이름은 한글 또는 영문 2~20자입니다.";
    }
    if ("memberPhone".equals(field)) {
      return "전화번호는 010-0000-0000 형식으로 입력하세요.";
    }
    if ("memberAddr".equals(field)) {
      return "주소는 2~100자로 입력하세요.";
    }
    if ("memberEmail".equals(field)) {
      return "이메일 형식이 올바르지 않습니다.";
    }
    return "입력값을 확인해 주세요.";
  }

  private static boolean matches(String value, String regex) {
    return value != null && value.matches(regex);
  }

  private static boolean isFilled(String value) {
    return value != null && !value.trim().isEmpty();
  }
}
