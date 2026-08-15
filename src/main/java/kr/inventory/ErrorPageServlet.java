package kr.inventory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 공통 오류 화면. 404·403·500.
 */
@WebServlet(urlPatterns = {"/error/404", "/error/403", "/error/500"})
public class ErrorPageServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String path = request.getServletPath();
    String view = "/WEB-INF/views/error/404.jsp";
    int status = 404;
    if (path.endsWith("/403")) {
      view = "/WEB-INF/views/error/403.jsp";
      status = 403;
    } else if (path.endsWith("/500")) {
      view = "/WEB-INF/views/error/500.jsp";
      status = 500;
    }
    response.setStatus(status);
    request.getRequestDispatcher(view).forward(request, response);
  }
}
