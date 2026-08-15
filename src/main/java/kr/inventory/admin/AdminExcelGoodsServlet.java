package kr.inventory.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.ExcelUtil;
import kr.inventory.goods.service.GoodsService;

/**
 * 관리자 품목 목록 xlsx 다운로드.
 */
@WebServlet("/admin/excel/goods")
public class AdminExcelGoodsServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String fileName = "goods_" + LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE) + ".xlsx";
    ExcelUtil.write(response, fileName, GoodsService.EXCEL_HEADERS, new GoodsService().toExcelRows());
  }
}
