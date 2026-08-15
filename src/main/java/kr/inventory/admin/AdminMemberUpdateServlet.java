package kr.inventory.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.AppConstants;
import kr.inventory.common.PageUtil;
import kr.inventory.member.dto.Member;
import kr.inventory.member.service.MemberService;

/**
 * 회원 등급 변경. 본인·마지막 관리자는 실패.
 */
@WebServlet("/admin/member/update")
public class AdminMemberUpdateServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    String targetId = request.getParameter("memberId");
    int level = Integer.parseInt(request.getParameter("memberLevel"));
    int result = new MemberService().updateLevel(targetId, level, login.getMemberId());
    if (result < 1) {
      request.setAttribute("list", PageUtil.slice(new MemberService().selectAll(), request));
      request.setAttribute("pagerUrl", request.getContextPath() + "/admin/member");
      request.setAttribute("pagerQuery", "");
      request.setAttribute("msg", "등급을 바꿀 수 없습니다. 본인이거나 마지막 관리자인지 확인하세요.");
      request.getRequestDispatcher("/WEB-INF/views/admin/member/list.jsp").forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/member");
  }
}
