<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="reqUri" value="${pageContext.request.requestURI}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StockHub</title>
<link rel="stylesheet"
  href="${pageContext.request.contextPath}/resources/css/style.css?v=${initParam.assetVersion}">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<header class="top">
  <div class="wrap top-inner">
    <div class="logo-brand">
      <a class="logo" href="${pageContext.request.contextPath}${empty loginMember ? '/loginFrm' : '/home'}">StockHub</a>
      <button type="button" class="nav-help" id="helpOpen">
        <span class="nav-help-mark" aria-hidden="true">?</span>
        안내+
      </button>
    </div>
    <div class="top-actions">
      <button type="button" class="nav-toggle" id="navToggle"
        aria-expanded="false" aria-controls="navDrawer" aria-label="메뉴">
        <span class="nav-toggle-bar"></span>
        <span class="nav-toggle-bar"></span>
        <span class="nav-toggle-bar"></span>
      </button>
      <nav class="top-nav">
      <c:choose>
        <c:when test="${not empty loginMember}">
          <a href="${pageContext.request.contextPath}/mypage">마이페이지</a>
          <c:if test="${loginMember.memberLevel eq 1}">
            <a href="${pageContext.request.contextPath}/admin/dashboard">관리자페이지</a>
          </c:if>
          <span class="nav-user">${loginMember.memberName}</span>
          <a class="nav-ghost" href="${pageContext.request.contextPath}/logout">로그아웃</a>
        </c:when>
        <c:otherwise>
          <a href="${pageContext.request.contextPath}/loginFrm">로그인</a>
          <a class="nav-cta" href="${pageContext.request.contextPath}/joinFrm">회원가입</a>
        </c:otherwise>
      </c:choose>
    </nav>
    </div>
  </div>
</header>
<div class="nav-mask" id="navMask" hidden></div>
<main class="page page-admin">
    <%-- c:set으로 넣은 false는 문자열이 되어 c:if가 참으로 본다. 조건은 여기서 바로 쓴다 --%>
    <c:choose>
      <c:when test="${fn:contains(reqUri, '/views/admin/')}">
        <div class="admin-shell">
        <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp"/>
      </c:when>
      <c:when test="${empty loginMember
          or fn:contains(reqUri, '/member/login')
          or fn:contains(reqUri, '/member/join')
          or fn:contains(reqUri, '/member/searchPw')}">
        <div class="admin-shell no-side">
        <jsp:include page="/WEB-INF/views/common/drawer-account-side.jsp"/>
      </c:when>
      <c:otherwise>
        <div class="admin-shell">
        <jsp:include page="/WEB-INF/views/common/member-sidebar.jsp"/>
      </c:otherwise>
    </c:choose>
    <div class="admin-main">
      <jsp:include page="/WEB-INF/views/common/pager-size.jsp"/>
