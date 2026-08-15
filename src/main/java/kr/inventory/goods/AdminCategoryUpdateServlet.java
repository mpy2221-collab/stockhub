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
 * 카테고리 수정·사용중지 처리.
 */
@WebServlet("/admin/category/update")
public class AdminCategoryUpdateServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Category c = AdminCategoryInsertServlet.bind(request);
    int result = new CategoryService().update(c);
    if (result < 1) {
      request.setAttribute("category", c);
      request.setAttribute("msg", "카테고리 수정에 실패했습니다. 이름 중복을 확인하세요.");
      request.getRequestDispatcher("/WEB-INF/views/admin/category/update.jsp")
          .forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/category/list");
  }
}
