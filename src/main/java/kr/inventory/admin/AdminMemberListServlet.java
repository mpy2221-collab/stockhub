package kr.inventory.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.inventory.common.PageUtil;
import kr.inventory.member.dto.MemberSearch;
import kr.inventory.member.service.MemberService;

/**
 * 관리자 회원 목록. 키워드·등급 검색.
 */
@WebServlet("/admin/member")
public class AdminMemberListServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    MemberSearch search = new MemberSearch();
    search.setKeyword(trim(request.getParameter("keyword")));
    search.setMemberLevel(parseLevel(request.getParameter("memberLevel")));
    request.setAttribute("search", search);
    request.setAttribute("list", PageUtil.slice(new MemberService().selectList(search), request));
    request.setAttribute("pagerUrl", request.getContextPath() + "/admin/member");
    String level = search.getMemberLevel() == null ? "" : String.valueOf(search.getMemberLevel());
    request.setAttribute("pagerQuery",
        PageUtil.query("keyword", search.getKeyword(), "memberLevel", level));
    request.getRequestDispatcher("/WEB-INF/views/admin/member/list.jsp").forward(request, response);
  }

  private String trim(String v) {
    return v == null ? "" : v.trim();
  }

  private Integer parseLevel(String v) {
    if ("1".equals(v) || "3".equals(v)) {
      return Integer.valueOf(v);
    }
    return null;
  }
}
