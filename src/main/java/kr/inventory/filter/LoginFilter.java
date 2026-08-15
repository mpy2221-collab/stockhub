package kr.inventory.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.AppConstants;
import kr.inventory.member.dto.Member;

/**
 * 메인·재고·요청·마이페이지·관리자 화면은 로그인 후에만 연다.
 */
@WebFilter(urlPatterns = {"/home", "/mypage", "/updateMember", "/updatePw", "/withdraw",
    "/goods/*", "/stock/*", "/admin/*"})
public class LoginFilter implements Filter {
  @Override
  public void init(FilterConfig filterConfig) {
  }

  @Override
  public void destroy() {
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;
    Member m = (Member) req.getSession().getAttribute(AppConstants.LOGIN_MEMBER);
    if (m == null) {
      res.sendRedirect(req.getContextPath() + "/loginFrm");
      return;
    }
    chain.doFilter(request, response);
  }
}
