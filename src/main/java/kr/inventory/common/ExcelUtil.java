package kr.inventory.common;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * xlsx 쓰기. Spring Excel이 아니다.
 */
public final class ExcelUtil {
  private static final int WIDTH_PADDING = 4;
  private static final int MAX_WIDTH_CHARS = 255;

  private ExcelUtil() {
  }

  public static void write(HttpServletResponse response, String fileName,
      String[] headers, List<List<String>> rows) throws IOException {
    write(response, fileName, null, headers, rows);
  }

  public static void write(HttpServletResponse response, String fileName, String title,
      String[] headers, List<List<String>> rows) throws IOException {
    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    String encoded = URLEncoder.encode(fileName, StandardCharsets.UTF_8.name()).replace("+", "%20");
    response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encoded);
    try (Workbook wb = new XSSFWorkbook(); OutputStream out = response.getOutputStream()) {
      Sheet sheet = wb.createSheet("sheet");
      int start = 0;
      if (title != null && !title.isEmpty()) {
        Row titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue(title);
        if (headers.length > 1) {
          sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, headers.length - 1));
        }
        start = 1;
      }
      Row head = sheet.createRow(start);
      for (int i = 0; i < headers.length; i++) {
        head.createCell(i).setCellValue(headers[i]);
      }
      int r = start + 1;
      for (List<String> row : rows) {
        Row excelRow = sheet.createRow(r++);
        for (int i = 0; i < row.size(); i++) {
          excelRow.createCell(i).setCellValue(row.get(i) == null ? "" : row.get(i));
        }
      }
      fitColumns(sheet, headers, rows);
      wrapOverflow(wb, sheet, headers.length, rows, start + 1);
      wb.write(out);
    }
  }

  /**
   * 열마다 헤더·데이터 중 가장 긴 글자 폭으로 맞춘다. 한글·한자는 영문 2칸으로 친다.
   */
  private static void fitColumns(Sheet sheet, String[] headers, List<List<String>> rows) {
    int cols = headers.length;
    int[] max = new int[cols];
    for (int i = 0; i < cols; i++) {
      max[i] = displayWidth(headers[i]);
    }
    for (List<String> row : rows) {
      int n = Math.min(cols, row.size());
      for (int i = 0; i < n; i++) {
        max[i] = Math.max(max[i], displayWidth(row.get(i)));
      }
    }
    for (int i = 0; i < cols; i++) {
      int chars = Math.min(MAX_WIDTH_CHARS, max[i] + WIDTH_PADDING);
      sheet.setColumnWidth(i, chars * 256);
    }
  }

  private static void wrapOverflow(Workbook wb, Sheet sheet, int cols, List<List<String>> rows,
      int dataStart) {
    boolean needWrap = false;
    for (List<String> row : rows) {
      int n = Math.min(cols, row.size());
      for (int i = 0; i < n; i++) {
        if (displayWidth(row.get(i)) + WIDTH_PADDING > MAX_WIDTH_CHARS) {
          needWrap = true;
          break;
        }
      }
    }
    if (!needWrap) {
      return;
    }
    CellStyle wrap = wb.createCellStyle();
    wrap.setWrapText(true);
    for (int r = dataStart; r < dataStart + rows.size(); r++) {
      Row excelRow = sheet.getRow(r);
      if (excelRow == null) {
        continue;
      }
      for (int i = 0; i < cols; i++) {
        Cell cell = excelRow.getCell(i);
        if (cell != null) {
          cell.setCellStyle(wrap);
        }
      }
    }
  }

  private static int displayWidth(String s) {
    if (s == null || s.isEmpty()) {
      return 0;
    }
    int w = 0;
    for (int i = 0; i < s.length(); i++) {
      w += isWide(s.charAt(i)) ? 2 : 1;
    }
    return w;
  }

  private static boolean isWide(char c) {
    Character.UnicodeScript script = Character.UnicodeScript.of(c);
    return script == Character.UnicodeScript.HANGUL
        || script == Character.UnicodeScript.HAN
        || script == Character.UnicodeScript.HIRAGANA
        || script == Character.UnicodeScript.KATAKANA
        || (c >= 0xFF00 && c <= 0xFFEF)
        || (c >= 0x3000 && c <= 0x303F);
  }
}
