package kr.inventory.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import kr.inventory.common.AppConstants;

/**
 * 가입 인증번호를 확인하고 세션에 인증 완료 이메일을 남긴다.
 */
@WebServlet("/verifyEmailCode")
public class VerifyEmailCodeServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("application/json; charset=UTF-8");
    String email = request.getParameter("memberEmail");
    String code = request.getParameter("code");
    HttpSession session = request.getSession();
    String savedCode = (String) session.getAttribute(AppConstants.EMAIL_CODE);
    String savedEmail = (String) session.getAttribute(AppConstants.EMAIL_CODE_TARGET);
    Long expire = (Long) session.getAttribute(AppConstants.EMAIL_CODE_EXPIRE);
    boolean ok = email != null && code != null && email.equals(savedEmail) && code.equals(savedCode)
        && expire != null && expire >= System.currentTimeMillis();
    if (!ok) {
      response.getWriter().print(new Gson().toJson("fail"));
      return;
    }
    session.setAttribute(AppConstants.EMAIL_VERIFIED, email);
    response.getWriter().print(new Gson().toJson("ok"));
  }
}
