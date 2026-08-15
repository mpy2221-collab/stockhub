<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="sidePath" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:if test="${empty sidePath}">
  <c:set var="sidePath" value="${pageContext.request.servletPath}" />
</c:if>
<aside class="admin-side" id="navDrawer">
  <p class="admin-side-title">메뉴</p>
  <nav class="admin-nav">
    <c:if test="${not empty loginMember}">
    <a class="${sidePath eq '/home' or sidePath eq '/' or empty sidePath ? 'on' : ''}"
      href="${pageContext.request.contextPath}/home">홈</a>
      <a class="${fn:startsWith(sidePath, '/goods') ? 'on' : ''}"
        href="${pageContext.request.contextPath}/goods/list">재고 조회</a>
      <c:if test="${loginMember.memberLevel ne 1}">
        <a class="${sidePath eq '/stock/requestFrm' or sidePath eq '/stock/request' ? 'on' : ''}"
          href="${pageContext.request.contextPath}/stock/requestFrm">입출고 요청</a>
        <a class="${fn:startsWith(sidePath, '/stock/request/list') or sidePath eq '/stock/request/cancel' ? 'on' : ''}"
          href="${pageContext.request.contextPath}/stock/request/list">내 요청</a>
      </c:if>
    </c:if>
    <jsp:include page="/WEB-INF/views/common/drawer-account.jsp"/>
  </nav>
</aside>
