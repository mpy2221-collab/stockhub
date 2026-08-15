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
 * 입고·출고 요청 처리. 재고는 바꾸지 않고 WAIT만 남긴다.
 */
@WebServlet("/stock/request")
public class StockRequestServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    int warehouseNo = AdminStockFormSupport.parseInt(request.getParameter("warehouseNo"));
    int goodsNo = AdminStockFormSupport.parseInt(request.getParameter("goodsNo"));
    int qty = AdminStockFormSupport.parseInt(request.getParameter("qty"));
    String requestType = request.getParameter("requestType");
    int result = new StockService().insertRequest(warehouseNo, goodsNo, qty, login.getMemberId(),
        requestType, AdminStockFormSupport.memo(request));
    if (result < 1) {
      AdminStockFormSupport.fill(request);
      request.setAttribute("msg", "요청에 실패했습니다. 유형·창고·품목·수량을 확인하세요.");
      request.getRequestDispatcher("/WEB-INF/views/stock/requestFrm.jsp")
          .forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/stock/request/list");
  }
}
