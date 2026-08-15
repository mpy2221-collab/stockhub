package kr.inventory.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.admin.dto.DashboardPage;
import kr.inventory.admin.service.DashboardService;

/**
 * 관리자 홈. 카드·표.
 */
@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    DashboardPage page = new DashboardService().loadPage();
    request.setAttribute("summary", page.getSummary());
    request.setAttribute("lowList", page.getLowList());
    request.setAttribute("recentList", page.getRecentList());
    request.setAttribute("waitList", page.getWaitList());
    request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
  }
}
