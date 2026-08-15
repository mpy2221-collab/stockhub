package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.AppConstants;
import kr.inventory.goods.dto.Category;
import kr.inventory.goods.service.CategoryService;

/**
 * 카테고리 등록. 이름 중복이면 실패.
 */
@WebServlet("/admin/category/insert")
public class AdminCategoryInsertServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Category c = bind(request);
    c.setUseYn(AppConstants.USE_Y);
    int result = new CategoryService().insert(c);
    if (result < 1) {
      request.setAttribute("category", c);
      request.setAttribute("msg", "카테고리 등록에 실패했습니다. 이름을 확인하세요.");
      request.getRequestDispatcher("/WEB-INF/views/admin/category/insert.jsp")
          .forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/category/list");
  }

  static Category bind(HttpServletRequest request) {
    Category c = new Category();
    String no = request.getParameter("categoryNo");
    if (no != null && !no.isEmpty()) {
      c.setCategoryNo(Integer.parseInt(no));
    }
    String name = request.getParameter("categoryName");
    c.setCategoryName(name == null ? null : name.trim());
    c.setUseYn(request.getParameter("useYn"));
    return c;
  }
}
