package kr.inventory.common;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 * 목록을 페이지 단위로 자른다.
 */
public final class PageUtil {
  public static final int SIZE = 10;

  private PageUtil() {
  }

  public static int parsePage(String v) {
    if (v == null || v.isEmpty()) {
      return 1;
    }
    try {
      int p = Integer.parseInt(v);
      return p < 1 ? 1 : p;
    } catch (NumberFormatException e) {
      return 1;
    }
  }

  public static int parseSize(String v) {
    if ("20".equals(v)) {
      return 20;
    }
    if ("30".equals(v)) {
      return 30;
    }
    return SIZE;
  }

  public static <T> List<T> slice(List<T> all, HttpServletRequest request) {
    List<T> src = all == null ? Collections.emptyList() : all;
    int size = parseSize(request.getParameter("size"));
    int total = src.size();
    int pages = Math.max(1, (total + size - 1) / size);
    int page = Math.min(parsePage(request.getParameter("page")), pages);
    int from = (page - 1) * size;
    int to = Math.min(from + size, total);
    request.setAttribute("pageNo", page);
    request.setAttribute("pageSize", size);
    request.setAttribute("totalPages", pages);
    request.setAttribute("totalCount", total);
    int win = 5;
    int start = ((page - 1) / win) * win + 1;
    int end = Math.min(pages, start + win - 1);
    request.setAttribute("pageStart", start);
    request.setAttribute("pageEnd", end);
    request.setAttribute("pagePrev5", Math.max(1, start - win));
    request.setAttribute("pageNext5", Math.min(pages, start + win));
    if (total == 0) {
      return src;
    }
    return src.subList(from, to);
  }

  public static String enc(String v) {
    if (v == null || v.isEmpty()) {
      return "";
    }
    return URLEncoder.encode(v, StandardCharsets.UTF_8);
  }

  public static String query(String... kv) {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i + 1 < kv.length; i += 2) {
      String val = kv[i + 1];
      if (val != null && !val.isEmpty()) {
        sb.append('&').append(kv[i]).append('=').append(enc(val));
      }
    }
    return sb.toString();
  }
}
