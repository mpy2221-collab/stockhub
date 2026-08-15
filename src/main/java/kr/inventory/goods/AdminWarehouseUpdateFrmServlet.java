package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.goods.dto.Warehouse;
import kr.inventory.goods.service.WarehouseService;

/**
 * 창고 수정 화면.
 */
@WebServlet("/admin/warehouse/updateFrm")
public class AdminWarehouseUpdateFrmServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    int warehouseNo = Integer.parseInt(request.getParameter("warehouseNo"));
    Warehouse w = new WarehouseService().selectOne(warehouseNo);
    if (w == null) {
      response.sendRedirect(request.getContextPath() + "/admin/warehouse/list");
      return;
    }
    request.setAttribute("warehouse", w);
    request.getRequestDispatcher("/WEB-INF/views/admin/warehouse/update.jsp")
        .forward(request, response);
  }
}
