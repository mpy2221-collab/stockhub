<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="page-head">
  <p class="eyebrow">Stock</p>
  <h1>내 입출고 요청</h1>
</section>
<c:if test="${not empty msg}">
  <p class="error">${msg}</p>
  <c:remove var="msg" scope="session"/>
</c:if>
<div class="table-wrap">
<table class="data">
  <thead>
    <tr>
      <th>일시</th>
      <th>유형</th>
      <th>품목</th>
      <th>창고</th>
      <th>수량</th>
      <th>상태</th>
      <th>메모</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="r" items="${list}">
      <tr>
        <td><fmt:formatDate value="${r.requestDate}" pattern="yyyy-MM-dd HH:mm"/></td>
        <td>
          <c:choose>
            <c:when test="${r.requestType eq 'IN'}">입고</c:when>
            <c:when test="${r.requestType eq 'OUT'}">출고</c:when>
            <c:otherwise>${r.requestType}</c:otherwise>
          </c:choose>
        </td>
        <td>${r.goodsCode} · ${r.goodsName}</td>
        <td>${r.warehouseName}</td>
        <td>${r.qty}</td>
        <td>
          <c:choose>
            <c:when test="${r.status eq 'WAIT'}">대기</c:when>
            <c:when test="${r.status eq 'APPROVE'}">승인</c:when>
            <c:when test="${r.status eq 'REJECT'}">거절</c:when>
            <c:when test="${r.status eq 'CANCEL'}">취소</c:when>
            <c:otherwise>${r.status}</c:otherwise>
          </c:choose>
        </td>
        <td>${r.memo}</td>
        <td>
          <c:if test="${r.status eq 'WAIT'}">
            <form class="row-actions" method="post" action="${pageContext.request.contextPath}/stock/request/cancel">
              <input type="hidden" name="requestNo" value="${r.requestNo}">
              <button class="btn btn-ghost" type="submit">취소</button>
            </form>
          </c:if>
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty list}">
      <tr><td colspan="8">요청 이력이 없습니다.</td></tr>
    </c:if>
  </tbody>
</table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
