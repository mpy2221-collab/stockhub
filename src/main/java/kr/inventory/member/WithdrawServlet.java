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
 * 본인 탈퇴. 성공하면 세션을 지우고 로그인으로 보낸다.
 */
@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    MemberService service = new MemberService();
    if (service.isSoleAdmin(login.getMemberId())) {
      fail(request, response, "마지막 관리자는 탈퇴할 수 없습니다.");
      return;
    }
    int result = service.withdraw(login.getMemberId(), request.getParameter("currentPw"));
    if (result < 1) {
      fail(request, response, "현재 비밀번호가 올바르지 않습니다.");
      return;
    }
    request.getSession().invalidate();
    response.sendRedirect(request.getContextPath() + "/loginFrm?result=withdraw");
  }

  private void fail(HttpServletRequest request, HttpServletResponse response, String msg)
      throws ServletException, IOException {
    request.setAttribute("msg", msg);
    request.setAttribute("errorField", "withdrawPw");
    request.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(request, response);
  }
}
