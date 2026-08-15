package kr.inventory.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.AppConstants;
import kr.inventory.member.dto.Member;
import kr.inventory.member.service.MemberService;
import kr.inventory.member.service.MemberValidator;

/**
 * 회원가입 처리. 기본 등급은 일반(3).
 * 실패하면 입력값을 그대로 둔 채 틀린 입력으로 돌려보낸다.
 */
@WebServlet("/join")
public class JoinServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member member = new Member();
    member.setMemberId(request.getParameter("memberId"));
    member.setMemberPw(request.getParameter("memberPw"));
    member.setMemberName(request.getParameter("memberName"));
    member.setMemberPhone(request.getParameter("memberPhone"));
    member.setMemberAddr(request.getParameter("memberAddr"));
    member.setMemberEmail(request.getParameter("memberEmail"));

    String invalid = MemberValidator.validateJoin(member);
    if (invalid != null) {
      fail(request, response, invalid, MemberValidator.message(invalid));
      return;
    }
    String verified = (String) request.getSession().getAttribute(AppConstants.EMAIL_VERIFIED);
    if (!member.getMemberEmail().equals(verified)) {
      fail(request, response, "memberEmail", "이메일 인증을 먼저 완료해 주세요.");
      return;
    }
    MemberService service = new MemberService();
    if (service.join(member, verified) < 1) {
      if (service.isDuplicated(request.getParameter("memberId"))) {
        fail(request, response, "memberId", "이미 사용 중인 아이디입니다.");
        return;
      }
      if (service.isEmailDuplicated(request.getParameter("memberEmail"))) {
        fail(request, response, "memberEmail", "이미 사용 중인 이메일입니다.");
        return;
      }
      fail(request, response, "memberId", "회원가입에 실패했습니다. 잠시 후 다시 시도해 주세요.");
      return;
    }
    request.getSession().removeAttribute(AppConstants.EMAIL_CODE);
    request.getSession().removeAttribute(AppConstants.EMAIL_CODE_TARGET);
    request.getSession().removeAttribute(AppConstants.EMAIL_CODE_EXPIRE);
    request.getSession().removeAttribute(AppConstants.EMAIL_VERIFIED);
    response.sendRedirect(request.getContextPath() + "/loginFrm?result=join");
  }

  private void fail(HttpServletRequest request, HttpServletResponse response,
      String errorField, String msg) throws ServletException, IOException {
    request.setAttribute("errorField", errorField);
    request.setAttribute("msg", msg);
    request.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(request, response);
  }
}
