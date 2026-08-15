package kr.inventory.stock;

import javax.servlet.http.HttpServletRequest;
import kr.inventory.goods.service.GoodsService;
import kr.inventory.goods.service.WarehouseService;

/**
 * 입출고 폼에 품목·창고 목록을 넣는다.
 */
final class AdminStockFormSupport {
  private AdminStockFormSupport() {
  }

  static void fill(HttpServletRequest request) {
    request.setAttribute("warehouses", new WarehouseService().selectActiveList());
    request.setAttribute("goodsList", new GoodsService().selectAll());
  }

  static int parseInt(String v) {
    if (v == null || v.isEmpty()) {
      return 0;
    }
    return Integer.parseInt(v);
  }

  static String memo(HttpServletRequest request) {
    String memo = request.getParameter("memo");
    if (memo == null || memo.trim().isEmpty()) {
      return null;
    }
    return memo.trim();
  }
}
