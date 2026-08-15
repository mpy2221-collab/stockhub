package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import kr.inventory.common.AppConstants;
import kr.inventory.common.FileUtil;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.service.CategoryService;
import kr.inventory.goods.service.GoodsService;

/**
 * 품목 등록. 코드 중복이면 실패. 이미지는 선택.
 */
@WebServlet("/admin/goods/insert")
@MultipartConfig(maxFileSize = FileUtil.MAX_BYTES, maxRequestSize = FileUtil.MAX_BYTES + 1024 * 1024)
public class AdminGoodsInsertServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Goods g = bind(request);
    g.setUseYn(AppConstants.USE_Y);
    String saved;
    try {
      saved = FileUtil.save(imagePart(request));
    } catch (IllegalStateException e) {
      fail(request, response, g, "이미지는 jpg, png, webp만 올리며 5MB를 넘을 수 없습니다.");
      return;
    }
    if ("".equals(saved)) {
      fail(request, response, g, "이미지는 jpg, png, webp만 올리며 5MB를 넘을 수 없습니다.");
      return;
    }
    g.setImagePath(saved);
    int result = new GoodsService().insert(g);
    if (result < 1) {
      FileUtil.delete(saved);
      fail(request, response, g, "품목 등록에 실패했습니다. 품목코드와 카테고리를 확인하세요.");
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/goods/list");
  }

  static void fail(HttpServletRequest request, HttpServletResponse response, Goods g, String msg)
      throws ServletException, IOException {
    request.setAttribute("goods", g);
    request.setAttribute("categories", new CategoryService().selectActiveList());
    request.setAttribute("msg", msg);
    request.getRequestDispatcher("/WEB-INF/views/admin/goods/insert.jsp").forward(request, response);
  }

  static Goods bind(HttpServletRequest request) {
    Goods g = new Goods();
    String no = request.getParameter("goodsNo");
    if (no != null && !no.isEmpty()) {
      g.setGoodsNo(Integer.parseInt(no));
    }
    g.setGoodsCode(request.getParameter("goodsCode"));
    g.setGoodsName(request.getParameter("goodsName"));
    g.setCategoryNo(parseInt(request.getParameter("categoryNo")));
    g.setUnit(request.getParameter("unit"));
    g.setSafetyQty(parseInt(request.getParameter("safetyQty")));
    g.setUnitPrice(parseInt(request.getParameter("unitPrice")));
    g.setUseYn(request.getParameter("useYn"));
    return g;
  }

  static Part imagePart(HttpServletRequest request) throws IOException, ServletException {
    return request.getPart("image");
  }

  static int parseInt(String v) {
    if (v == null || v.isEmpty()) {
      return 0;
    }
    return Integer.parseInt(v);
  }
}
