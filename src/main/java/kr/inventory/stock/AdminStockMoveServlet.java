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
 * 창고 이동. 출발 부족이면 전체 롤백.
 */
@WebServlet("/admin/stock/move")
public class AdminStockMoveServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    int goodsNo = AdminStockFormSupport.parseInt(request.getParameter("goodsNo"));
    int fromWh = AdminStockFormSupport.parseInt(request.getParameter("fromWarehouseNo"));
    int toWh = AdminStockFormSupport.parseInt(request.getParameter("toWarehouseNo"));
    int qty = AdminStockFormSupport.parseInt(request.getParameter("qty"));
    int result = new StockService().move(goodsNo, fromWh, toWh, qty, login.getMemberId(),
        AdminStockFormSupport.memo(request));
    if (result < 1) {
      AdminStockFormSupport.fill(request);
      request.setAttribute("msg", "이동에 실패했습니다. 출발 창고 재고와 출발·도착이 다른지 확인하세요.");
      request.getRequestDispatcher("/WEB-INF/views/admin/stock/move.jsp").forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/stock/history");
  }
}
