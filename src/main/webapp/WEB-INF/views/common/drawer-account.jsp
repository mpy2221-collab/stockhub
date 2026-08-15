<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="side-account">
  <p class="nav-group-label">계정</p>
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
      <a href="${pageContext.request.contextPath}/joinFrm">회원가입</a>
    </c:otherwise>
  </c:choose>
</div>
