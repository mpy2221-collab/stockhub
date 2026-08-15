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
import kr.inventory.member.service.MemberService;

/**
 * 가입 이메일로 인증번호를 보내고 세션에 담는다.
 */
@WebServlet("/sendEmailCode")
public class SendEmailCodeServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("application/json; charset=UTF-8");
    String email = request.getParameter("memberEmail");
    MemberService service = new MemberService();
    if (service.isEmailDuplicated(email)) {
      response.getWriter().print(new Gson().toJson("duplication"));
      return;
    }
    String code = service.sendJoinCode(email);
    if (code == null) {
      response.getWriter().print(new Gson().toJson("fail"));
      return;
    }
    HttpSession session = request.getSession();
    session.setAttribute(AppConstants.EMAIL_CODE, code);
    session.setAttribute(AppConstants.EMAIL_CODE_TARGET, email);
    session.setAttribute(AppConstants.EMAIL_CODE_EXPIRE,
        System.currentTimeMillis() + AppConstants.EMAIL_CODE_TTL_MS);
    session.removeAttribute(AppConstants.EMAIL_VERIFIED);
    response.getWriter().print(new Gson().toJson("ok"));
  }
}
