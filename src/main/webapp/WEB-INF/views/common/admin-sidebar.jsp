<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="adminPath" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<c:if test="${empty adminPath}">
  <c:set var="adminPath" value="${pageContext.request.servletPath}" />
</c:if>
<aside class="admin-side" id="navDrawer">
  <p class="admin-side-title">관리</p>
  <nav class="admin-nav">
    <p class="nav-group-label">현황</p>
    <a class="${adminPath eq '/admin/dashboard' ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/dashboard">재고 현황</a>
    <p class="nav-group-label">기준 정보</p>
    <a class="${fn:startsWith(adminPath, '/admin/goods') ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/goods/list">품목 관리</a>
    <a class="${fn:startsWith(adminPath, '/admin/warehouse') ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/warehouse/list">창고 관리</a>
    <a class="${fn:startsWith(adminPath, '/admin/category') ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/category/list">카테고리 관리</a>
    <a class="${fn:startsWith(adminPath, '/admin/member') ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/member">회원 관리</a>
    <p class="nav-group-label">재고 처리</p>
    <a class="${fn:contains(adminPath, '/admin/stock/in') ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/stock/inFrm">입고 처리</a>
    <a class="${fn:contains(adminPath, '/admin/stock/out') ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/stock/outFrm">출고 처리</a>
    <a class="${fn:contains(adminPath, '/admin/stock/move') ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/stock/moveFrm">창고 이동</a>
    <a class="${fn:contains(adminPath, '/admin/stock/adjust') ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/stock/adjustFrm">재고 조정</a>
    <a class="${adminPath eq '/admin/stock/history' ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/stock/history">입출고 이력</a>
    <p class="nav-group-label">요청</p>
    <a class="${fn:startsWith(adminPath, '/admin/stock/request') ? 'on' : ''}"
      href="${pageContext.request.contextPath}/admin/stock/request?status=WAIT">요청 승인
      <c:if test="${waitRequestCount gt 0}">
        <span class="nav-badge">${waitRequestCount}</span>
      </c:if>
    </a>
    <jsp:include page="/WEB-INF/views/common/drawer-account.jsp"/>
  </nav>
</aside>
