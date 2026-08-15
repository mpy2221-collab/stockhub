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
 * 출고 처리. 재고가 부족하면 실패.
 */
@WebServlet("/admin/stock/out")
public class AdminStockOutServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    int warehouseNo = AdminStockFormSupport.parseInt(request.getParameter("warehouseNo"));
    int goodsNo = AdminStockFormSupport.parseInt(request.getParameter("goodsNo"));
    int qty = AdminStockFormSupport.parseInt(request.getParameter("qty"));
    int result = new StockService().stockOut(warehouseNo, goodsNo, qty, login.getMemberId(), null,
        AdminStockFormSupport.memo(request));
    if (result < 1) {
      AdminStockFormSupport.fill(request);
      request.setAttribute("msg", "출고에 실패했습니다. 해당 창고 재고가 부족한지 확인하세요.");
      request.getRequestDispatcher("/WEB-INF/views/admin/stock/out.jsp").forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/stock/history");
  }
}
