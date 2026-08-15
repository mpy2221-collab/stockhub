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
 * 창고 수정 처리. 사용중지는 use_yn만 바꾼다.
 */
@WebServlet("/admin/warehouse/update")
public class AdminWarehouseUpdateServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Warehouse w = new Warehouse();
    w.setWarehouseNo(Integer.parseInt(request.getParameter("warehouseNo")));
    w.setWarehouseName(request.getParameter("warehouseName"));
    w.setUseYn(request.getParameter("useYn"));
    int result = new WarehouseService().update(w);
    if (result < 1) {
      request.setAttribute("warehouse", w);
      request.setAttribute("msg", "창고 수정에 실패했습니다.");
      request.getRequestDispatcher("/WEB-INF/views/admin/warehouse/update.jsp")
          .forward(request, response);
      return;
    }
    response.sendRedirect(request.getContextPath() + "/admin/warehouse/list");
  }
}
