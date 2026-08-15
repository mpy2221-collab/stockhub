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
 * 본인 WAIT 요청만 취소한다.
 */
@WebServlet("/stock/request/cancel")
public class StockRequestCancelServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    int requestNo = AdminStockFormSupport.parseInt(request.getParameter("requestNo"));
    int result = new StockService().cancelRequest(requestNo, login.getMemberId());
    if (result < 1) {
      request.getSession().setAttribute("msg", "취소할 수 없습니다. 본인 대기 요청인지 확인하세요.");
    }
    response.sendRedirect(request.getContextPath() + "/stock/request/list");
  }
}
