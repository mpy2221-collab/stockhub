package kr.inventory.stock;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.AppConstants;
import kr.inventory.member.dto.Member;
import kr.inventory.stock.service.StockService;

/**
 * 본인 입출고 요청 이력.
 */
@WebServlet("/stock/request/list")
public class StockRequestListServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    request.setAttribute("list", new StockService().selectMyRequestList(login.getMemberId()));
    request.getRequestDispatcher("/WEB-INF/views/stock/requestList.jsp")
        .forward(request, response);
  }
}
