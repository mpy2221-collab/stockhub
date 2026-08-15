package kr.inventory.stock;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.AppConstants;
import kr.inventory.common.PageUtil;
import kr.inventory.stock.dto.RequestSearch;
import kr.inventory.stock.service.StockService;

/**
 * 관리자 입출고 요청 목록. 상태·유형·키워드 검색.
 */
@WebServlet("/admin/stock/request")
public class AdminStockRequestServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    RequestSearch search = new RequestSearch();
    String status = request.getParameter("status");
    if (status == null || status.trim().isEmpty()) {
      status = AppConstants.REQUEST_WAIT;
    }
    search.setStatus(status);
    search.setRequestType(trim(request.getParameter("requestType")));
    search.setKeyword(trim(request.getParameter("keyword")));
    request.setAttribute("search", search);
    request.setAttribute("list",
        PageUtil.slice(new StockService().selectRequestList(search), request));
    request.setAttribute("pagerUrl", request.getContextPath() + "/admin/stock/request");
    request.setAttribute("pagerQuery", PageUtil.query("status", search.getStatus(),
        "requestType", search.getRequestType(), "keyword", search.getKeyword()));
    request.getRequestDispatcher("/WEB-INF/views/admin/stock/request.jsp")
        .forward(request, response);
  }

  private String trim(String v) {
    return v == null ? "" : v.trim();
  }
}
