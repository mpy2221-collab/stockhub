package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.goods.dto.Category;
import kr.inventory.goods.service.CategoryService;

/**
 * 카테고리 수정 화면.
 */
@WebServlet("/admin/category/updateFrm")
public class AdminCategoryUpdateFrmServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
    Category c = new CategoryService().selectOne(categoryNo);
    if (c == null) {
      response.sendRedirect(request.getContextPath() + "/admin/category/list");
      return;
    }
    request.setAttribute("category", c);
    request.getRequestDispatcher("/WEB-INF/views/admin/category/update.jsp")
        .forward(request, response);
  }
}
