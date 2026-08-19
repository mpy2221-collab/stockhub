package kr.inventory.goods;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.FileUtil;
import kr.inventory.goods.dto.Goods;
import kr.inventory.goods.service.GoodsService;

/**
 * 품목 대표 이미지를 디스크에서 읽어 내려준다.
 */
@WebServlet("/goods/image")
public class GoodsImageServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    int goodsNo = 0;
    try {
      goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
    } catch (Exception e) {
      response.sendError(HttpServletResponse.SC_NOT_FOUND);
      return;
    }
    Goods goods = new GoodsService().selectOne(goodsNo);
    if (goods == null || goods.getImagePath() == null || goods.getImagePath().isEmpty()) {
      response.sendError(HttpServletResponse.SC_NOT_FOUND);
      return;
    }
    File file = FileUtil.resolve(goods.getImagePath());
    if (file == null || !file.isFile()) {
      response.sendError(HttpServletResponse.SC_NOT_FOUND);
      return;
    }
    response.setContentType(FileUtil.contentType(goods.getImagePath()));
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Last-Modified", file.lastModified());
    response.setContentLengthLong(file.length());
    try (FileInputStream in = new FileInputStream(file);
        OutputStream out = response.getOutputStream()) {
      byte[] buf = new byte[8192];
      int n;
      while ((n = in.read(buf)) != -1) {
        out.write(buf, 0, n);
      }
    }
  }
}
