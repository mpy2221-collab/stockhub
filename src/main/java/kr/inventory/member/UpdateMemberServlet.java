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
 * 회원 정보 수정. 이메일은 가입 인증값이라 폼 값을 받지 않는다.
 */
@WebServlet("/updateMember")
public class UpdateMemberServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    Member form = new Member();
    form.setMemberId(login.getMemberId());
    form.setMemberName(request.getParameter("memberName"));
    form.setMemberPhone(request.getParameter("memberPhone"));
    form.setMemberAddr(request.getParameter("memberAddr"));
    form.setMemberEmail(login.getMemberEmail());

    String invalid = MemberValidator.validateProfile(form);
    if (invalid != null) {
      fail(request, response, invalid, MemberValidator.message(invalid));
      return;
    }
    if (new MemberService().updateMember(form) < 1) {
      fail(request, response, "memberName", "정보 수정에 실패했습니다.");
      return;
    }
    login.setMemberName(form.getMemberName());
    login.setMemberPhone(form.getMemberPhone());
    login.setMemberAddr(form.getMemberAddr());
    request.getSession().setAttribute(AppConstants.LOGIN_MEMBER, login);
    response.sendRedirect(request.getContextPath() + "/mypage?result=info");
  }

  private void fail(HttpServletRequest request, HttpServletResponse response,
      String errorField, String msg) throws ServletException, IOException {
    request.setAttribute("errorField", errorField);
    request.setAttribute("msg", msg);
    request.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(request, response);
  }
}
