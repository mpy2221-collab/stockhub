package kr.inventory.common;

/**
 * 세션 키와 이력/요청 상태 상수.
 */
public final class AppConstants {
  public static final String LOGIN_MEMBER = "loginMember";
  public static final String EMAIL_CODE = "emailCode";
  public static final String EMAIL_CODE_TARGET = "emailCodeTarget";
  public static final String EMAIL_CODE_EXPIRE = "emailCodeExpire";
  public static final String EMAIL_VERIFIED = "emailVerified";
  public static final long EMAIL_CODE_TTL_MS = 5 * 60 * 1000L;

  public static final int MEMBER_LEVEL_ADMIN = 1;
  public static final int MEMBER_LEVEL_USER = 3;

  public static final String HISTORY_TYPE_IN = "IN";
  public static final String HISTORY_TYPE_OUT = "OUT";
  public static final String HISTORY_TYPE_ADJUST = "ADJUST";

  public static final String REQUEST_TYPE_IN = "IN";
  public static final String REQUEST_TYPE_OUT = "OUT";

  public static final String REQUEST_WAIT = "WAIT";
  public static final String REQUEST_APPROVE = "APPROVE";
  public static final String REQUEST_REJECT = "REJECT";
  public static final String REQUEST_CANCEL = "CANCEL";

  public static final String USE_Y = "Y";
  public static final String USE_N = "N";

  private AppConstants() {
  }
}
