package kr.inventory.stock;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 입고 화면.
 */
@WebServlet("/admin/stock/inFrm")
public class AdminStockInFrmServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    AdminStockFormSupport.fill(request);
    request.getRequestDispatcher("/WEB-INF/views/admin/stock/in.jsp").forward(request, response);
  }
}
