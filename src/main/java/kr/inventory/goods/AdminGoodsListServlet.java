package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.PageUtil;
import kr.inventory.goods.dto.GoodsSearch;
import kr.inventory.goods.service.GoodsService;

/**
 * 관리자 품목 목록. 사용중지 포함. 키워드·사용여부 검색.
 */
@WebServlet("/admin/goods/list")
public class AdminGoodsListServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    GoodsSearch search = new GoodsSearch();
    search.setKeyword(trim(request.getParameter("keyword")));
    search.setUseYn(trim(request.getParameter("useYn")));
    request.setAttribute("search", search);
    request.setAttribute("list", PageUtil.slice(new GoodsService().selectAdminList(search), request));
    request.setAttribute("pagerUrl", request.getContextPath() + "/admin/goods/list");
    request.setAttribute("pagerQuery",
        PageUtil.query("keyword", search.getKeyword(), "useYn", search.getUseYn()));
    request.getRequestDispatcher("/WEB-INF/views/admin/goods/list.jsp").forward(request, response);
  }

  private String trim(String v) {
    return v == null ? "" : v.trim();
  }
}
