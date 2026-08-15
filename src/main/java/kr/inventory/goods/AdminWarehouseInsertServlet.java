package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.AppConstants;
import kr.inventory.goods.dto.Warehouse;
import kr.inventory.goods.service.WarehouseService;

/**
 * 창고 등록 처리.
 */
@WebServlet("/admin/warehouse/insert")
public class AdminWarehouseInsertServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Warehouse w = new Warehouse();
    w.setWarehouseName(request.getParameter("warehouseName"));
    String useYn = request.getParameter("useYn");
    w.setUseYn(useYn == null || useYn.isEmpty() ? AppConstants.USE_Y : useYn);
    int result = new WarehouseService().insert(w);
    if (result < 1) {
      request.setAttribute("msg", "창고 등록에 실패했습니다.");
      request.getRequestDispatcher("/WEB-INF/views/admin/warehouse/insert.jsp")
          .forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/warehouse/list");
  }
}
