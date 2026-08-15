package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.PageUtil;
import kr.inventory.goods.dto.GoodsSearch;
import kr.inventory.goods.service.CategoryService;
import kr.inventory.goods.service.GoodsService;
import kr.inventory.goods.service.WarehouseService;

/**
 * 재고 목록. 창고·카테고리·키워드·부족 필터.
 */
@WebServlet("/goods/list")
public class GoodsListServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    GoodsSearch search = new GoodsSearch();
    String wh = request.getParameter("warehouseNo");
    if (wh != null && !wh.isEmpty()) {
      search.setWarehouseNo(Integer.parseInt(wh));
    }
    String cat = request.getParameter("categoryNo");
    if (cat != null && !cat.isEmpty()) {
      search.setCategoryNo(Integer.parseInt(cat));
    }
    search.setKeyword(request.getParameter("keyword"));
    search.setLowStock("Y".equals(request.getParameter("lowStock")));
    GoodsService goodsService = new GoodsService();
    request.setAttribute("search", search);
    request.setAttribute("list", PageUtil.slice(goodsService.selectStockList(search), request));
    request.setAttribute("pagerUrl", request.getContextPath() + "/goods/list");
    StringBuilder q = new StringBuilder();
    if (wh != null && !wh.isEmpty()) {
      q.append("&warehouseNo=").append(PageUtil.enc(wh));
    }
    if (cat != null && !cat.isEmpty()) {
      q.append("&categoryNo=").append(PageUtil.enc(cat));
    }
    if (search.getKeyword() != null && !search.getKeyword().isEmpty()) {
      q.append("&keyword=").append(PageUtil.enc(search.getKeyword()));
    }
    if (search.isLowStock()) {
      q.append("&lowStock=Y");
    }
    request.setAttribute("pagerQuery", q.toString());
    request.setAttribute("warehouses", new WarehouseService().selectActiveList());
    request.setAttribute("categories", new CategoryService().selectActiveList());
    request.getRequestDispatcher("/WEB-INF/views/goods/list.jsp").forward(request, response);
  }
}
