package kr.inventory.member.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import kr.inventory.common.AppConstants;
import kr.inventory.common.MailSender;
import java.util.List;
import kr.inventory.member.dao.MemberDao;
import kr.inventory.member.dto.Member;
import kr.inventory.member.dto.MemberSearch;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mindrot.jbcrypt.BCrypt;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class MemberServiceTest {
  @Mock
  private MemberDao memberDao;
  @Mock
  private MailSender mailSender;
  @InjectMocks
  private MemberService memberService;

  @Test
  void 로그인_성공한다() {
    Member stored = new Member();
    stored.setMemberId("user1");
    stored.setMemberPw(BCrypt.hashpw("1234", BCrypt.gensalt()));
    when(memberDao.selectById("user1")).thenReturn(stored);

    Member login = memberService.login("user1", "1234");

    assertNotNull(login);
    assertNull(login.getMemberPw());
    verify(memberDao, times(1)).selectById("user1");
  }

  @Test
  void 로그인_실패한다() {
    Member stored = new Member();
    stored.setMemberId("user1");
    stored.setMemberPw(BCrypt.hashpw("1234", BCrypt.gensalt()));
    when(memberDao.selectById("user1")).thenReturn(stored);

    Member login = memberService.login("user1", "wrong");

    assertNull(login);
  }

  @Test
  void 아이디가_중복이면_true를_반환한다() {
    when(memberDao.countById("user1")).thenReturn(1);

    boolean dup = memberService.isDuplicated("user1");

    assertTrue(dup);
    verify(memberDao, times(1)).countById("user1");
  }

  @Test
  void 아이디가_없으면_중복이_아니다() {
    when(memberDao.countById("newUser")).thenReturn(0);

    boolean dup = memberService.isDuplicated("newUser");

    assertFalse(dup);
  }

  @Test
  void 회원_등급을_관리자로_올리면_성공한다() {
    Member target = new Member();
    target.setMemberId("user01");
    target.setMemberLevel(AppConstants.MEMBER_LEVEL_USER);
    when(memberDao.selectById("user01")).thenReturn(target);
    when(memberDao.updateLevel("user01", AppConstants.MEMBER_LEVEL_ADMIN)).thenReturn(1);

    int result = memberService.updateLevel("user01", AppConstants.MEMBER_LEVEL_ADMIN, "admin");

    assertEquals(1, result);
    verify(memberDao, times(1)).updateLevel("user01", AppConstants.MEMBER_LEVEL_ADMIN);
  }

  @Test
  void 마지막_관리자는_일반으로_강등_실패한다() {
    Member target = new Member();
    target.setMemberId("admin");
    target.setMemberLevel(AppConstants.MEMBER_LEVEL_ADMIN);
    when(memberDao.selectById("admin")).thenReturn(target);
    when(memberDao.countByLevel(AppConstants.MEMBER_LEVEL_ADMIN)).thenReturn(1);

    int result = memberService.updateLevel("admin", AppConstants.MEMBER_LEVEL_USER, "other");

    assertEquals(0, result);
    verify(memberDao, never()).updateLevel(anyString(), anyInt());
  }

  @Test
  void 인증하지_않은_이메일은_가입_실패한다() {
    Member member = joinMember();

    int result = memberService.join(member, null);

    assertEquals(0, result);
    verify(memberDao, never()).insert(any(Member.class));
  }

  @Test
  void 이메일이_중복이면_true를_반환한다() {
    when(memberDao.countByEmail("user1@test.com")).thenReturn(1);

    boolean dup = memberService.isEmailDuplicated("user1@test.com");

    assertTrue(dup);
    verify(memberDao, times(1)).countByEmail("user1@test.com");
  }

  @Test
  void 이메일이_없으면_중복이_아니다() {
    when(memberDao.countByEmail("new@test.com")).thenReturn(0);

    boolean dup = memberService.isEmailDuplicated("new@test.com");

    assertFalse(dup);
  }

  @Test
  void 이메일이_중복이면_가입하지_않는다() {
    Member member = joinMember();
    when(memberDao.countById("user1")).thenReturn(0);
    when(memberDao.countByEmail("user1@test.com")).thenReturn(1);

    int result = memberService.join(member, "user1@test.com");

    assertEquals(0, result);
    verify(memberDao, never()).insert(any(Member.class));
  }

  @Test
  void 인증한_이메일은_가입_성공한다() {
    Member member = joinMember();
    when(memberDao.countById("user1")).thenReturn(0);
    when(memberDao.countByEmail("user1@test.com")).thenReturn(0);
    when(memberDao.insert(any(Member.class))).thenReturn(1);

    int result = memberService.join(member, "user1@test.com");

    assertEquals(1, result);
    verify(memberDao).insert(any(Member.class));
  }

  @Test
  void 아이디와_이메일이_맞으면_임시_비밀번호를_보내고_갱신한다() {
    Member stored = joinMember();
    stored.setMemberEmail("user1@test.com");
    when(memberDao.selectById("user1")).thenReturn(stored);
    when(memberDao.updatePw(eq("user1"), anyString())).thenReturn(1);

    int result = memberService.resetPassword("user1", "user1@test.com");

    assertEquals(1, result);
    verify(memberDao).updatePw(eq("user1"), anyString());
    verify(mailSender).send(eq("user1@test.com"), anyString(), anyString());
  }

  @Test
  void 아이디와_이메일이_다르면_메일을_보내지_않는다() {
    Member stored = joinMember();
    stored.setMemberEmail("user1@test.com");
    when(memberDao.selectById("user1")).thenReturn(stored);

    int result = memberService.resetPassword("user1", "other@test.com");

    assertEquals(0, result);
    verify(memberDao, never()).updatePw(anyString(), anyString());
    verify(mailSender, never()).send(anyString(), anyString(), anyString());
  }

  @Test
  void 본인_등급은_변경하지_못한다() {
    int result = memberService.updateLevel("admin", AppConstants.MEMBER_LEVEL_USER, "admin");

    assertEquals(0, result);
    verify(memberDao, never()).selectById(anyString());
    verify(memberDao, never()).updateLevel(anyString(), anyInt());
  }

  @Test
  void 비밀번호_형식이_아니면_가입하지_않는다() {
    Member member = joinMember();
    member.setMemberPw("1234");

    int result = memberService.join(member, "user1@test.com");

    assertEquals(0, result);
    verify(memberDao, never()).insert(any(Member.class));
  }

  @Test
  void 이름_형식이_아니면_정보를_수정하지_않는다() {
    Member member = joinMember();
    member.setMemberName("김");

    int result = memberService.updateMember(member);

    assertEquals(0, result);
    verify(memberDao, never()).update(any(Member.class));
  }

  @Test
  void 전화번호_형식이_아니면_정보를_수정하지_않는다() {
    Member member = joinMember();
    member.setMemberPhone("01012");

    int result = memberService.updateMember(member);

    assertEquals(0, result);
    verify(memberDao, never()).update(any(Member.class));
  }

  @Test
  void 형식이_맞으면_정보를_수정한다() {
    Member member = joinMember();
    member.setMemberPhone("010-1234-5678");
    member.setMemberAddr("서울시 강남구");
    when(memberDao.update(any(Member.class))).thenReturn(1);

    int result = memberService.updateMember(member);

    assertEquals(1, result);
    verify(memberDao, times(1)).update(any(Member.class));
  }

  @Test
  void 비밀번호가_맞으면_탈퇴한다() {
    Member stored = stored("user1", "1234", AppConstants.MEMBER_LEVEL_USER);
    when(memberDao.selectById("user1")).thenReturn(stored);
    when(memberDao.delete("user1")).thenReturn(1);

    int result = memberService.withdraw("user1", "1234");

    assertEquals(1, result);
    verify(memberDao).delete("user1");
  }

  @Test
  void 비밀번호가_틀리면_탈퇴하지_않는다() {
    Member stored = stored("user1", "1234", AppConstants.MEMBER_LEVEL_USER);
    when(memberDao.selectById("user1")).thenReturn(stored);

    int result = memberService.withdraw("user1", "wrong");

    assertEquals(0, result);
    verify(memberDao, never()).delete(anyString());
  }

  @Test
  void 마지막_관리자는_탈퇴하지_않는다() {
    Member stored = stored("admin", "1234", AppConstants.MEMBER_LEVEL_ADMIN);
    when(memberDao.selectById("admin")).thenReturn(stored);
    when(memberDao.countByLevel(AppConstants.MEMBER_LEVEL_ADMIN)).thenReturn(1);

    int result = memberService.withdraw("admin", "1234");

    assertEquals(0, result);
    verify(memberDao, never()).delete(anyString());
  }

  @Test
  void 회원_목록은_아이디_이름_이메일_키워드만_남긴다() {
    Member hit = listed("user1", "홍길동", "user1@test.com", AppConstants.MEMBER_LEVEL_USER);
    Member miss = listed("admin", "관리자", "admin@test.com", AppConstants.MEMBER_LEVEL_ADMIN);
    when(memberDao.selectList(any(MemberSearch.class))).thenReturn(List.of(hit, miss));
    MemberSearch search = new MemberSearch();
    search.setKeyword("user1");

    List<Member> list = memberService.selectList(search);

    assertEquals(1, list.size());
    assertEquals("user1", list.get(0).getMemberId());
  }

  @Test
  void 회원_목록_관리자_등급이면_관리자만_남긴다() {
    Member admin = listed("admin", "관리자", "admin@test.com", AppConstants.MEMBER_LEVEL_ADMIN);
    Member user = listed("user1", "홍길동", "user1@test.com", AppConstants.MEMBER_LEVEL_USER);
    when(memberDao.selectList(any(MemberSearch.class))).thenReturn(List.of(admin, user));
    MemberSearch search = new MemberSearch();
    search.setMemberLevel(AppConstants.MEMBER_LEVEL_ADMIN);

    List<Member> list = memberService.selectList(search);

    assertEquals(1, list.size());
    assertEquals("admin", list.get(0).getMemberId());
  }

  private Member listed(String id, String name, String email, int level) {
    Member member = new Member();
    member.setMemberId(id);
    member.setMemberName(name);
    member.setMemberEmail(email);
    member.setMemberLevel(level);
    return member;
  }

  private Member stored(String id, String rawPw, int level) {
    Member member = new Member();
    member.setMemberId(id);
    member.setMemberPw(BCrypt.hashpw(rawPw, BCrypt.gensalt()));
    member.setMemberLevel(level);
    return member;
  }

  private Member joinMember() {
    Member member = new Member();
    member.setMemberId("user1");
    member.setMemberPw("Test1234");
    member.setMemberName("홍길동");
    member.setMemberEmail("user1@test.com");
    return member;
  }
}
