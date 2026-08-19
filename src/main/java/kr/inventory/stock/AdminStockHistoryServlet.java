package kr.inventory.stock;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.PageUtil;
import kr.inventory.goods.service.WarehouseService;
import kr.inventory.stock.dto.HistorySearch;
import kr.inventory.stock.service.StockService;

/**
 * 입출고 이력 목록. 유형·기간·창고·품목 검색.
 */
@WebServlet("/admin/stock/history")
public class AdminStockHistoryServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HistorySearch search = new HistorySearch();
    String type = request.getParameter("type");
    search.setType(type == null || type.isEmpty() ? "ALL" : type);
    boolean first = request.getParameter("from") == null && request.getParameter("to") == null;
    if (first) {
      search.setFrom("2025-01-01");
      search.setTo("2026-08-31");
    } else {
      search.setFrom(trim(request.getParameter("from")));
      search.setTo(trim(request.getParameter("to")));
    }
    search.setWarehouseNo(parseWh(request.getParameter("warehouseNo")));
    search.setKeyword(trim(request.getParameter("keyword")));
    request.setAttribute("search", search);
    request.setAttribute("type", search.getType());
    request.setAttribute("from", search.getFrom());
    request.setAttribute("to", search.getTo());
    request.setAttribute("warehouses", new WarehouseService().selectActiveList());
    request.setAttribute("list",
        PageUtil.slice(new StockService().selectHistoryList(search), request));
    request.setAttribute("pagerUrl", request.getContextPath() + "/admin/stock/history");
    request.setAttribute("pagerQuery", histQuery(search));
    request.getRequestDispatcher("/WEB-INF/views/admin/stock/history.jsp")
        .forward(request, response);
  }

  private String histQuery(HistorySearch search) {
    String wh = search.getWarehouseNo() == null ? "" : String.valueOf(search.getWarehouseNo());
    return PageUtil.query("type", search.getType(), "from", search.getFrom(), "to", search.getTo(),
        "warehouseNo", wh, "keyword", search.getKeyword());
  }

  private String trim(String v) {
    return v == null ? "" : v.trim();
  }

  private Integer parseWh(String v) {
    if (v == null || v.isEmpty()) {
      return null;
    }
    try {
      int n = Integer.parseInt(v);
      return n > 0 ? n : null;
    } catch (NumberFormatException e) {
      return null;
    }
  }
}
