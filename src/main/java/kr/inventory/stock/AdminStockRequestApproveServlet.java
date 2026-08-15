package kr.inventory.stock;

import java.io.IOException;
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
 * 입출고 요청 Ajax 승인.
 */
@WebServlet("/admin/stock/request/approve")
public class AdminStockRequestApproveServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("application/json; charset=UTF-8");
    Member login = (Member) request.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    int requestNo = AdminStockFormSupport.parseInt(request.getParameter("requestNo"));
    int result = new StockService().approveRequest(requestNo, login.getMemberId());
    response.getWriter().print(new Gson().toJson(result > 0 ? "ok" : "fail"));
  }
}
