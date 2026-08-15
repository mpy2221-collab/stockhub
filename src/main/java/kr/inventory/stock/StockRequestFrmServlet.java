package kr.inventory.stock;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 입고·출고 요청 화면.
 */
@WebServlet("/stock/requestFrm")
public class StockRequestFrmServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    AdminStockFormSupport.fill(request);
    String goodsNo = request.getParameter("goodsNo");
    if (goodsNo != null && !goodsNo.isEmpty()) {
      try {
        request.setAttribute("selectedGoodsNo", Integer.parseInt(goodsNo));
      } catch (NumberFormatException e) {
        request.setAttribute("selectedGoodsNo", 0);
      }
    }
    request.getRequestDispatcher("/WEB-INF/views/stock/requestFrm.jsp")
        .forward(request, response);
  }
}
