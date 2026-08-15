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
 * 재고 조정. 한 창고 수량을 목표값으로 맞춘다.
 */
@WebServlet("/admin/stock/adjust")
public class AdminStockAdjustServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    int warehouseNo = AdminStockFormSupport.parseInt(request.getParameter("warehouseNo"));
    int goodsNo = AdminStockFormSupport.parseInt(request.getParameter("goodsNo"));
    int targetQty = AdminStockFormSupport.parseInt(request.getParameter("targetQty"));
    int result = new StockService().adjust(warehouseNo, goodsNo, targetQty, login.getMemberId(),
        AdminStockFormSupport.memo(request));
    if (result < 1) {
      AdminStockFormSupport.fill(request);
      request.setAttribute("msg", "조정에 실패했습니다. 창고·품목·목표 수량을 확인하세요.");
      request.getRequestDispatcher("/WEB-INF/views/admin/stock/adjust.jsp")
          .forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/stock/history");
  }
}
