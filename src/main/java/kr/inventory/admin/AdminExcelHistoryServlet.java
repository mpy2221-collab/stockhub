package kr.inventory.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.ExcelUtil;
import kr.inventory.stock.service.StockService;

/**
 * 기간별 입출고 이력 xlsx. from·to 없으면 이번 달 1일~오늘.
 */
@WebServlet("/admin/excel/history")
public class AdminExcelHistoryServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    LocalDate today = LocalDate.now();
    LocalDate from = parse(request.getParameter("from"), today.withDayOfMonth(1));
    LocalDate to = parse(request.getParameter("to"), today);
    DateTimeFormatter fileFmt = DateTimeFormatter.BASIC_ISO_DATE;
    String fileName = "history_" + from.format(fileFmt) + "_" + to.format(fileFmt) + ".xlsx";
    String period = "기간: " + from + " ~ " + to;
    ExcelUtil.write(response, fileName, period, StockService.HISTORY_EXCEL_HEADERS,
        new StockService().toHistoryExcelRows(toDate(from), toDate(to)));
  }

  private LocalDate parse(String v, LocalDate fallback) {
    if (v == null || v.isEmpty()) {
      return fallback;
    }
    try {
      return LocalDate.parse(v);
    } catch (DateTimeParseException e) {
      return fallback;
    }
  }

  private Date toDate(LocalDate d) {
    return java.sql.Date.valueOf(d);
  }
}
