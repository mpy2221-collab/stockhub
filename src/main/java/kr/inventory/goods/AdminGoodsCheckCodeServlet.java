package kr.inventory.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import kr.inventory.goods.service.GoodsService;

/**
 * 품목코드 중복 여부를 JSON으로 응답한다.
 */
@WebServlet("/admin/goods/checkCode")
public class AdminGoodsCheckCodeServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("application/json; charset=UTF-8");
    String code = request.getParameter("goodsCode");
    String no = request.getParameter("goodsNo");
    GoodsService service = new GoodsService();
    boolean dup;
    if (no != null && !no.isEmpty()) {
      dup = service.isDuplicatedCode(code, Integer.parseInt(no));
    } else {
      dup = service.isDuplicatedCode(code);
    }
    response.getWriter().print(new Gson().toJson(dup ? "duplication" : "ok"));
  }
}
