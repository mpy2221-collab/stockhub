package kr.inventory;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.AppConstants;
import kr.inventory.dto.HomePage;
import kr.inventory.member.dto.Member;
import kr.inventory.service.HomeService;

/**
 * 로그인 회원 메인 포털. 비로그인이면 로그인으로 보낸다.
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    if (login == null) {
      response.sendRedirect(request.getContextPath() + "/loginFrm");
      return;
    }
    HomePage page = new HomeService().load(login.getMemberId());
    request.setAttribute("totalGoodsCount", page.getTotalGoodsCount());
    request.setAttribute("myWaitRequestCount", page.getMyWaitRequestCount());
    request.setAttribute("lowStockCount", page.getLowStockCount());
    request.setAttribute("myMonthApprovedCount", page.getMyMonthApprovedCount());
    request.setAttribute("recentMyRequests", page.getRecentMyRequests());
    request.setAttribute("lowStockList", page.getLowStockList());
    request.setAttribute("waitRequestCount", page.getWaitRequestCount());
    request.setAttribute("todayLabel",
        LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy년 M월 d일 (E)", Locale.KOREAN)));
    request.getRequestDispatcher("/WEB-INF/views/common/main.jsp").forward(request, response);
  }
}
