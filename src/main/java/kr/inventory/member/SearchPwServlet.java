package kr.inventory.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.member.service.MemberService;

/**
 * 아이디·이메일이 맞으면 임시 비밀번호를 메일로 보낸다.
 */
@WebServlet("/searchPw")
public class SearchPwServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    int result = new MemberService().resetPassword(
        request.getParameter("memberId"), request.getParameter("memberEmail"));
    if (result < 1) {
      request.setAttribute("msg", "아이디와 이메일이 일치하지 않습니다.");
      request.getRequestDispatcher("/WEB-INF/views/member/searchPw.jsp").forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/loginFrm?result=tempPw");
  }
}
