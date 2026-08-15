package kr.inventory.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import kr.inventory.member.service.MemberService;

/**
 * 아이디 중복 여부를 JSON으로 응답한다.
 */
@WebServlet("/checkId")
public class CheckIdServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("application/json; charset=UTF-8");
    boolean dup = new MemberService().isDuplicated(request.getParameter("memberId"));
    response.getWriter().print(new Gson().toJson(dup ? "duplication" : "ok"));
  }
}
