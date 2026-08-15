package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.goods.service.CategoryService;

/**
 * 품목 등록 화면.
 */
@WebServlet("/admin/goods/insertFrm")
public class AdminGoodsInsertFrmServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setAttribute("categories", new CategoryService().selectActiveList());
    request.getRequestDispatcher("/WEB-INF/views/admin/goods/insert.jsp").forward(request, response);
  }
}
