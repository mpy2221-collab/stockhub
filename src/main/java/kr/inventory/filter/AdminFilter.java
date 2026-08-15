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
import kr.inventory.stock.service.StockService;

/**
 * 관리자 화면은 등급 1만 들어간다.
 */
@WebFilter(urlPatterns = "/admin/*")
public class AdminFilter implements Filter {
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
    if (m.getMemberLevel() != AppConstants.MEMBER_LEVEL_ADMIN) {
      res.setStatus(HttpServletResponse.SC_FORBIDDEN);
      req.getRequestDispatcher("/WEB-INF/views/error/403.jsp").forward(req, res);
      return;
    }
    try {
      req.setAttribute("waitRequestCount", new StockService().countWaitRequest());
    } catch (Exception e) {
      req.setAttribute("waitRequestCount", 0);
    }
    chain.doFilter(request, response);
  }
}
