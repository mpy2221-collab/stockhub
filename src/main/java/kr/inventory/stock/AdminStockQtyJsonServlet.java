package kr.inventory.stock;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import kr.inventory.stock.service.StockService;

/**
 * 창고×품목 현재고 JSON.
 */
@WebServlet("/admin/stock/qty")
public class AdminStockQtyJsonServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("application/json; charset=UTF-8");
    int warehouseNo = AdminStockFormSupport.parseInt(request.getParameter("warehouseNo"));
    int goodsNo = AdminStockFormSupport.parseInt(request.getParameter("goodsNo"));
    Map<String, Integer> body = new LinkedHashMap<>();
    body.put("qty", new StockService().currentQty(warehouseNo, goodsNo));
    response.getWriter().print(new Gson().toJson(body));
  }
}
