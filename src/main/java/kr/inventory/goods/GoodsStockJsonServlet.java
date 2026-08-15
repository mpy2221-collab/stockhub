package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import kr.inventory.goods.service.GoodsService;

/**
 * 품목의 창고별 재고를 JSON으로 응답한다.
 */
@WebServlet("/goods/stocks")
public class GoodsStockJsonServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("application/json; charset=UTF-8");
    int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
    response.getWriter().print(new Gson().toJson(new GoodsService().selectWarehouseStocks(goodsNo)));
  }
}
