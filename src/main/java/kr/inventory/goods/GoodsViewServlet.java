package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.service.GoodsService;

/**
 * 품목 상세. 사용중인 품목만, 창고별 현재고를 같이 보여 준다.
 */
@WebServlet("/goods/view")
public class GoodsViewServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
    GoodsService service = new GoodsService();
    Goods goods = service.selectOneActive(goodsNo);
    if (goods == null) {
      response.sendRedirect(request.getContextPath() + "/goods/list");
      return;
    }
    request.setAttribute("goods", goods);
    request.setAttribute("stocks", service.selectWarehouseStocks(goodsNo));
    request.getRequestDispatcher("/WEB-INF/views/goods/view.jsp").forward(request, response);
  }
}
