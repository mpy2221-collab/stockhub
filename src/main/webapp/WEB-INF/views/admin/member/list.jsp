<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="page-head">
  <p class="eyebrow">Admin</p>
  <h1>회원</h1>
  <p class="form-lead">등급만 바꿉니다. 본인과 마지막 관리자는 일반으로 내릴 수 없습니다.</p>
</section>
<form class="filter" method="get" action="${pageContext.request.contextPath}/admin/member">
  <label>검색
    <input type="text" name="keyword" value="${search.keyword}" placeholder="아이디·이름·이메일">
  </label>
  <label>등급
    <select name="memberLevel">
      <option value="">전체</option>
      <option value="1" ${search.memberLevel eq 1 ? 'selected' : ''}>관리자</option>
      <option value="3" ${search.memberLevel eq 3 ? 'selected' : ''}>일반</option>
    </select>
  </label>
  <div class="filter-side">
    <button class="btn" type="submit">조회</button>
  </div>
</form>
<c:if test="${not empty msg}">
  <p class="error">${msg}</p>
</c:if>
<div class="table-wrap">
<table class="data">
  <thead>
    <tr>
      <th>아이디</th>
      <th>이름</th>
      <th>이메일</th>
      <th>가입일</th>
      <th>등급</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="m" items="${list}">
      <tr>
        <td>${m.memberId}</td>
        <td>${m.memberName}</td>
        <td>${m.memberEmail}</td>
        <td><fmt:formatDate value="${m.enrollDate}" pattern="yyyy-MM-dd"/></td>
        <td>
          <c:choose>
            <c:when test="${m.memberId eq loginMember.memberId}">
              <c:choose>
                <c:when test="${m.memberLevel eq 1}">관리자 (본인)</c:when>
                <c:otherwise>일반 (본인)</c:otherwise>
              </c:choose>
            </c:when>
            <c:otherwise>
              <form class="level-form" method="post" action="${pageContext.request.contextPath}/admin/member/update">
                <input type="hidden" name="memberId" value="${m.memberId}">
                <select name="memberLevel">
                  <option value="1" ${m.memberLevel eq 1 ? 'selected' : ''}>관리자</option>
                  <option value="3" ${m.memberLevel eq 3 ? 'selected' : ''}>일반</option>
                </select>
                <button class="btn" type="submit">변경</button>
              </form>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty list}">
      <tr><td colspan="5">등록된 회원이 없습니다.</td></tr>
    </c:if>
  </tbody>
</table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
