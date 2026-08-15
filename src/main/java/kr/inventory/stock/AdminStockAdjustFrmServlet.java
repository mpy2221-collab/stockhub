package kr.inventory.stock;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 재고 조정 화면.
 */
@WebServlet("/admin/stock/adjustFrm")
public class AdminStockAdjustFrmServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    AdminStockFormSupport.fill(request);
    request.getRequestDispatcher("/WEB-INF/views/admin/stock/adjust.jsp").forward(request, response);
  }
}
