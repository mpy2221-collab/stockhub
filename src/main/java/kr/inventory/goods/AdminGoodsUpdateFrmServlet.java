package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.service.CategoryService;
import kr.inventory.goods.service.GoodsService;

/**
 * 품목 수정 화면.
 */
@WebServlet("/admin/goods/updateFrm")
public class AdminGoodsUpdateFrmServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
    Goods g = new GoodsService().selectOne(goodsNo);
    if (g == null) {
      response.sendRedirect(request.getContextPath() + "/admin/goods/list");
      return;
    }
    request.setAttribute("goods", g);
    request.setAttribute("categories", new CategoryService().selectAll());
    request.getRequestDispatcher("/WEB-INF/views/admin/goods/update.jsp").forward(request, response);
  }
}
