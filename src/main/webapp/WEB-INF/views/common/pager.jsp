<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${totalCount gt 0}">
  <nav class="pager">
    <c:choose>
      <c:when test="${pageNo gt 1}">
        <a href="${pagerUrl}?page=${pageNo - 1}${pagerQuery}&size=${pageSize}">이전</a>
      </c:when>
      <c:otherwise>
        <span class="off">이전</span>
      </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="1" end="${totalPages}">
      <a class="${i eq pageNo ? 'on' : ''}"
        href="${pagerUrl}?page=${i}${pagerQuery}&size=${pageSize}">${i}</a>
    </c:forEach>
    <c:choose>
      <c:when test="${pageNo lt totalPages}">
        <a href="${pagerUrl}?page=${pageNo + 1}${pagerQuery}&size=${pageSize}">다음</a>
      </c:when>
      <c:otherwise>
        <span class="off">다음</span>
      </c:otherwise>
    </c:choose>
  </nav>
</c:if>
