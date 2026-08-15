package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.PageUtil;
import kr.inventory.goods.dto.AdminSearch;
import kr.inventory.goods.service.WarehouseService;

/**
 * 관리자 창고 목록. 키워드·사용여부 검색.
 */
@WebServlet("/admin/warehouse/list")
public class AdminWarehouseListServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    AdminSearch search = new AdminSearch();
    search.setKeyword(trim(request.getParameter("keyword")));
    search.setUseYn(trim(request.getParameter("useYn")));
    request.setAttribute("search", search);
    request.setAttribute("list",
        PageUtil.slice(new WarehouseService().selectList(search), request));
    request.setAttribute("pagerUrl", request.getContextPath() + "/admin/warehouse/list");
    request.setAttribute("pagerQuery",
        PageUtil.query("keyword", search.getKeyword(), "useYn", search.getUseYn()));
    request.getRequestDispatcher("/WEB-INF/views/admin/warehouse/list.jsp")
        .forward(request, response);
  }

  private String trim(String v) {
    return v == null ? "" : v.trim();
  }
}
