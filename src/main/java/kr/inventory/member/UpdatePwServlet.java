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
 * 비밀번호 변경. 현재 비밀번호가 맞을 때만 갱신한다.
 */
@WebServlet("/updatePw")
public class UpdatePwServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    String currentPw = request.getParameter("currentPw");
    String newPw = request.getParameter("newPw");
    if (newPw == null || !newPw.matches(MemberValidator.PW_REGEX)) {
      forwardFail(request, response, "newPw", MemberValidator.message("memberPw"));
      return;
    }
    int result = new MemberService().updatePw(login.getMemberId(), currentPw, newPw);
    if (result < 1) {
      forwardFail(request, response, "currentPw", "현재 비밀번호가 올바르지 않습니다.");
      return;
    }
    response.sendRedirect(request.getContextPath() + "/mypage?result=pw");
  }

  private void forwardFail(HttpServletRequest request, HttpServletResponse response,
      String errorField, String msg) throws ServletException, IOException {
    request.setAttribute("errorField", errorField);
    request.setAttribute("msg", msg);
    request.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(request, response);
  }
}
