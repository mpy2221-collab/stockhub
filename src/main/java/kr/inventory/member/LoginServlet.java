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

/**
 * 로그인 처리. 세션에 넣기 전 비밀번호는 비운다.
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    String memberId = request.getParameter("memberId");
    String memberPw = request.getParameter("memberPw");
    Member login = new MemberService().login(memberId, memberPw);
    if (login == null) {
      request.setAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
      request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
      return;
    }
    request.getSession().setAttribute(AppConstants.LOGIN_MEMBER, login);
    response.sendRedirect(request.getContextPath() + "/home");
  }
}
