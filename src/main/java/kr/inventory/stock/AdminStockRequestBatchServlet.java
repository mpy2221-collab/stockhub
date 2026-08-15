package kr.inventory.stock;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import kr.inventory.common.AppConstants;
import kr.inventory.member.dto.Member;
import kr.inventory.stock.service.StockService;

/**
 * 입출고 요청 일괄 승인·거절. 건마다 기존 Service를 호출한다.
 */
@WebServlet(urlPatterns = {"/admin/stock/request/approveBatch", "/admin/stock/request/rejectBatch"})
public class AdminStockRequestBatchServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("application/json; charset=UTF-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    boolean approve = request.getServletPath().endsWith("/approveBatch");
    int[] nos = parseNos(request.getParameterValues("requestNo"));
    int[] result = new StockService().processRequestBatch(nos, login.getMemberId(), approve);
    Map<String, Integer> body = new LinkedHashMap<>();
    body.put("ok", result[0]);
    body.put("fail", result[1]);
    response.getWriter().print(new Gson().toJson(body));
  }

  private int[] parseNos(String[] values) {
    if (values == null || values.length == 0) {
      return new int[0];
    }
    int[] nos = new int[values.length];
    int n = 0;
    for (String v : values) {
      try {
        int no = Integer.parseInt(v);
        if (no > 0) {
          nos[n++] = no;
        }
      } catch (NumberFormatException e) {
        // 건너뛴다
      }
    }
    if (n == nos.length) {
      return nos;
    }
    int[] trimmed = new int[n];
    System.arraycopy(nos, 0, trimmed, 0, n);
    return trimmed;
  }
}
