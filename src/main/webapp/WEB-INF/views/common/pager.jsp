<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${totalCount gt 0}">
  <nav class="pager">
    <c:choose>
      <c:when test="${pageStart gt 1}">
        <a href="${pagerUrl}?page=${pagePrev5}${pagerQuery}&size=${pageSize}"
          title="5페이지 이전">≪</a>
      </c:when>
      <c:otherwise>
        <span class="off" title="5페이지 이전">≪</span>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${pageNo gt 1}">
        <a href="${pagerUrl}?page=${pageNo - 1}${pagerQuery}&size=${pageSize}"
          title="이전 페이지">이전</a>
      </c:when>
      <c:otherwise>
        <span class="off">이전</span>
      </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${pageStart}" end="${pageEnd}">
      <a class="${i eq pageNo ? 'on' : ''}"
        href="${pagerUrl}?page=${i}${pagerQuery}&size=${pageSize}">${i}</a>
    </c:forEach>
    <c:choose>
      <c:when test="${pageNo lt totalPages}">
        <a href="${pagerUrl}?page=${pageNo + 1}${pagerQuery}&size=${pageSize}"
          title="다음 페이지">다음</a>
      </c:when>
      <c:otherwise>
        <span class="off">다음</span>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${pageEnd lt totalPages}">
        <a href="${pagerUrl}?page=${pageNext5}${pagerQuery}&size=${pageSize}"
          title="5페이지 다음">≫</a>
      </c:when>
      <c:otherwise>
        <span class="off" title="5페이지 다음">≫</span>
      </c:otherwise>
    </c:choose>
  </nav>
</c:if>
