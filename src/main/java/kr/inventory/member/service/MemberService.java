package kr.inventory.member.service;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Function;
import java.util.function.ToIntFunction;
import kr.inventory.common.AppConstants;
import kr.inventory.common.MailSender;
import kr.inventory.common.MybatisUtil;
import kr.inventory.member.dao.MemberDao;
import kr.inventory.member.dto.Member;
import kr.inventory.member.dto.MemberSearch;
import org.apache.ibatis.session.SqlSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 * 회원가입·로그인·마이페이지·탈퇴와 관리자 등급 변경을 담당한다.
 */
public class MemberService {
  private static final SecureRandom RANDOM = new SecureRandom();
  private MemberDao memberDao;
  private MailSender mailSender;

  public MemberService() {
  }

  public MemberService(MemberDao memberDao) {
    this.memberDao = memberDao;
  }

  public MemberService(MemberDao memberDao, MailSender mailSender) {
    this.memberDao = memberDao;
    this.mailSender = mailSender;
  }

  public Member login(String memberId, String memberPw) {
    if (memberId == null || memberPw == null) {
      return null;
    }
    MemberDao dao = memberDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(MemberDao.class);
      }
      Member member = dao.selectById(memberId);
      if (member == null || !BCrypt.checkpw(memberPw, member.getMemberPw())) {
        return null;
      }
      member.setMemberPw(null);
      return member;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  public boolean isDuplicated(String memberId) {
    MemberDao dao = memberDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(MemberDao.class);
      }
      return dao.countById(memberId) > 0;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  public boolean isEmailDuplicated(String memberEmail) {
    if (memberEmail == null || memberEmail.isEmpty()) {
      return false;
    }
    MemberDao dao = memberDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(MemberDao.class);
      }
      return dao.countByEmail(memberEmail) > 0;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  /**
   * 세션에서 확인한 이메일과 폼 이메일이 같을 때만 가입한다.
   */
  public int join(Member member, String verifiedEmail) {
    if (MemberValidator.validateJoin(member) != null) {
      return 0;
    }
    if (!member.getMemberEmail().equals(verifiedEmail)) {
      return 0;
    }
    if (isDuplicated(member.getMemberId()) || isEmailDuplicated(member.getMemberEmail())) {
      return 0;
    }
    member.setMemberPw(BCrypt.hashpw(member.getMemberPw(), BCrypt.gensalt()));
    member.setMemberLevel(AppConstants.MEMBER_LEVEL_USER);
    MemberDao dao = memberDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(MemberDao.class);
      }
      int result = dao.insert(member);
      if (session != null) {
        session.commit();
      }
      return result;
    } catch (Exception e) {
      if (session != null) {
        session.rollback();
      }
      return 0;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  /**
   * 이름·전화·주소만 고친다. 이메일은 가입 인증값이라 바꾸지 않는다.
   */
  public int updateMember(Member member) {
    if (MemberValidator.validateProfile(member) != null) {
      return 0;
    }
    MemberDao dao = memberDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(MemberDao.class);
      }
      int result = dao.update(member);
      if (session != null) {
        session.commit();
      }
      return result;
    } catch (Exception e) {
      if (session != null) {
        session.rollback();
      }
      return 0;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  public int updatePw(String memberId, String currentPw, String newPw) {
    Member login = login(memberId, currentPw);
    if (login == null) {
      return 0;
    }
    String hashed = BCrypt.hashpw(newPw, BCrypt.gensalt());
    MemberDao dao = memberDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(MemberDao.class);
      }
      int result = dao.updatePw(memberId, hashed);
      if (session != null) {
        session.commit();
      }
      return result;
    } catch (Exception e) {
      if (session != null) {
        session.rollback();
      }
      return 0;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  public List<Member> selectAll() {
    return hidePw(withDao(dao -> dao.selectAll()));
  }

  public List<Member> selectList(MemberSearch search) {
    MemberSearch cond = search == null ? new MemberSearch() : search;
    if (cond.getKeyword() != null) {
      cond.setKeyword(cond.getKeyword().trim());
    }
    return hidePw(filterList(withDao(dao -> dao.selectList(cond)), cond));
  }

  private List<Member> filterList(List<Member> raw, MemberSearch cond) {
    if (raw == null) {
      return Collections.emptyList();
    }
    String key = cond.getKeyword() == null ? "" : cond.getKeyword().toLowerCase();
    Integer level = cond.getMemberLevel();
    List<Member> result = new ArrayList<>();
    for (Member m : raw) {
      if (level != null && level > 0 && m.getMemberLevel() != level) {
        continue;
      }
      if (!key.isEmpty()) {
        String id = nvl(m.getMemberId()).toLowerCase();
        String name = nvl(m.getMemberName()).toLowerCase();
        String email = nvl(m.getMemberEmail()).toLowerCase();
        if (!id.contains(key) && !name.contains(key) && !email.contains(key)) {
          continue;
        }
      }
      result.add(m);
    }
    return result;
  }

  private String nvl(String v) {
    return v == null ? "" : v;
  }

  private List<Member> hidePw(List<Member> list) {
    if (list == null) {
      return Collections.emptyList();
    }
    for (Member m : list) {
      m.setMemberPw(null);
    }
    return list;
  }

  /**
   * 관리자가 대상 회원의 등급만 바꾼다. 본인·마지막 관리자는 실패.
   */
  public int updateLevel(String targetMemberId, int newLevel, String actorId) {
    if (targetMemberId == null || actorId == null) {
      return 0;
    }
    if (newLevel != AppConstants.MEMBER_LEVEL_ADMIN
        && newLevel != AppConstants.MEMBER_LEVEL_USER) {
      return 0;
    }
    if (targetMemberId.equals(actorId)) {
      return 0;
    }
    Member target = withDao(dao -> dao.selectById(targetMemberId));
    if (target == null) {
      return 0;
    }
    if (target.getMemberLevel() == AppConstants.MEMBER_LEVEL_ADMIN
        && newLevel == AppConstants.MEMBER_LEVEL_USER
        && withDao(dao -> dao.countByLevel(AppConstants.MEMBER_LEVEL_ADMIN)) <= 1) {
      return 0;
    }
    return write(dao -> dao.updateLevel(targetMemberId, newLevel));
  }

  /**
   * 비밀번호가 맞을 때만 본인 행을 지운다. 마지막 관리자면 0.
   */
  public int withdraw(String memberId, String currentPw) {
    if (memberId == null || memberId.isEmpty() || currentPw == null || currentPw.isEmpty()) {
      return 0;
    }
    Member stored = withDao(dao -> dao.selectById(memberId));
    if (stored == null || stored.getMemberPw() == null
        || !BCrypt.checkpw(currentPw, stored.getMemberPw())) {
      return 0;
    }
    if (isSoleAdmin(stored)) {
      return 0;
    }
    return write(dao -> dao.delete(memberId));
  }

  public boolean isSoleAdmin(String memberId) {
    if (memberId == null || memberId.isEmpty()) {
      return false;
    }
    Member stored = withDao(dao -> dao.selectById(memberId));
    return isSoleAdmin(stored);
  }

  private boolean isSoleAdmin(Member stored) {
    if (stored == null || stored.getMemberLevel() != AppConstants.MEMBER_LEVEL_ADMIN) {
      return false;
    }
    return withDao(dao -> dao.countByLevel(AppConstants.MEMBER_LEVEL_ADMIN)) <= 1;
  }

  /**
   * 가입 인증번호 6자리를 메일로 보낸다. 형식이 아니면 null.
   */
  public String sendJoinCode(String email) {
    if (!isEmailFormat(email)) {
      return null;
    }
    String code = String.format("%06d", RANDOM.nextInt(1_000_000));
    try {
      mail().send(email, "[StockHub] 회원가입 인증번호",
          "인증번호는 " + code + " 입니다. 5분 안에 입력하세요.");
      return code;
    } catch (Exception e) {
      return null;
    }
  }

  /**
   * 아이디와 이메일이 같으면 임시 비밀번호를 저장하고 메일로 보낸다.
   */
  public int resetPassword(String memberId, String email) {
    if (memberId == null || memberId.isEmpty() || !isEmailFormat(email)) {
      return 0;
    }
    Member stored = withDao(dao -> dao.selectById(memberId));
    if (stored == null || stored.getMemberEmail() == null
        || !email.equals(stored.getMemberEmail())) {
      return 0;
    }
    String temp = tempPassword();
    int updated = write(dao -> dao.updatePw(memberId, BCrypt.hashpw(temp, BCrypt.gensalt())));
    if (updated < 1) {
      return 0;
    }
    String subject = "[StockHub] 임시 비밀번호";
    String body = "임시 비밀번호는 " + temp + " 입니다. 로그인 후 비밀번호를 바꿔 주세요.";
    if (mailSender != null) {
      mailSender.send(email, subject, body);
      return 1;
    }
    new Thread(() -> {
      try {
        new MailSender().send(email, subject, body);
      } catch (Exception e) {
        return;
      }
    }, "temp-pw-mail").start();
    return 1;
  }

  public boolean isEmailFormat(String email) {
    return email != null && email.matches("[^@\\s]+@[^@\\s]+\\.[^@\\s]+");
  }

  private String tempPassword() {
    String chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789";
    StringBuilder sb = new StringBuilder(8);
    for (int i = 0; i < 8; i++) {
      sb.append(chars.charAt(RANDOM.nextInt(chars.length())));
    }
    return sb.toString();
  }

  private MailSender mail() {
    return mailSender != null ? mailSender : new MailSender();
  }

  private <T> T withDao(Function<MemberDao, T> action) {
    MemberDao dao = memberDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(MemberDao.class);
      }
      return action.apply(dao);
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }

  private int write(ToIntFunction<MemberDao> action) {
    MemberDao dao = memberDao;
    SqlSession session = null;
    try {
      if (dao == null) {
        session = MybatisUtil.getSqlSession();
        dao = session.getMapper(MemberDao.class);
      }
      int result = action.applyAsInt(dao);
      if (session != null) {
        session.commit();
      }
      return result;
    } catch (Exception e) {
      if (session != null) {
        session.rollback();
      }
      return 0;
    } finally {
      if (session != null) {
        session.close();
      }
    }
  }
}
