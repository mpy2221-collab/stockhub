package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.FileUtil;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.service.CategoryService;
import kr.inventory.goods.service.GoodsService;

/**
 * 품목 수정·사용중지 처리. 새 이미지가 있을 때만 경로를 바꾼다.
 */
@WebServlet("/admin/goods/update")
@MultipartConfig(maxFileSize = FileUtil.MAX_BYTES, maxRequestSize = FileUtil.MAX_BYTES + 1024 * 1024)
public class AdminGoodsUpdateServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Goods g = AdminGoodsInsertServlet.bind(request);
    String saved;
    try {
      saved = FileUtil.save(AdminGoodsInsertServlet.imagePart(request));
    } catch (IllegalStateException e) {
      fail(request, response, g, "이미지는 jpg, png, webp만 올리며 5MB를 넘을 수 없습니다.");
      return;
    }
    if ("".equals(saved)) {
      fail(request, response, g, "이미지는 jpg, png, webp만 올리며 5MB를 넘을 수 없습니다.");
      return;
    }
    g.setImagePath(saved);
    int result = new GoodsService().update(g);
    if (result < 1) {
      FileUtil.delete(saved);
      fail(request, response, g, "품목 수정에 실패했습니다. 품목코드 중복을 확인하세요.");
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/goods/list");
  }

  private void fail(HttpServletRequest request, HttpServletResponse response, Goods g, String msg)
      throws ServletException, IOException {
    request.setAttribute("goods", g);
    request.setAttribute("categories", new CategoryService().selectAll());
    request.setAttribute("msg", msg);
    request.getRequestDispatcher("/WEB-INF/views/admin/goods/update.jsp").forward(request, response);
  }
}
