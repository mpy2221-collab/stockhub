<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:url var="histAll" value="/admin/stock/history">
  <c:param name="type" value="ALL"/>
  <c:param name="from" value="${from}"/>
  <c:param name="to" value="${to}"/>
  <c:param name="warehouseNo" value="${search.warehouseNo}"/>
  <c:param name="keyword" value="${search.keyword}"/>
</c:url>
<c:url var="histIn" value="/admin/stock/history">
  <c:param name="type" value="IN"/>
  <c:param name="from" value="${from}"/>
  <c:param name="to" value="${to}"/>
  <c:param name="warehouseNo" value="${search.warehouseNo}"/>
  <c:param name="keyword" value="${search.keyword}"/>
</c:url>
<c:url var="histOut" value="/admin/stock/history">
  <c:param name="type" value="OUT"/>
  <c:param name="from" value="${from}"/>
  <c:param name="to" value="${to}"/>
  <c:param name="warehouseNo" value="${search.warehouseNo}"/>
  <c:param name="keyword" value="${search.keyword}"/>
</c:url>
<c:url var="histMove" value="/admin/stock/history">
  <c:param name="type" value="MOVE"/>
  <c:param name="from" value="${from}"/>
  <c:param name="to" value="${to}"/>
  <c:param name="warehouseNo" value="${search.warehouseNo}"/>
  <c:param name="keyword" value="${search.keyword}"/>
</c:url>
<c:url var="histAdjust" value="/admin/stock/history">
  <c:param name="type" value="ADJUST"/>
  <c:param name="from" value="${from}"/>
  <c:param name="to" value="${to}"/>
  <c:param name="warehouseNo" value="${search.warehouseNo}"/>
  <c:param name="keyword" value="${search.keyword}"/>
</c:url>
<section class="page-head">
  <p class="eyebrow">Stock</p>
  <h1>입출고 이력</h1>
  <div class="hero-actions">
    <a class="btn ${type eq 'ALL' ? '' : 'btn-ghost'}" href="${histAll}">전체</a>
    <a class="btn ${type eq 'IN' ? '' : 'btn-ghost'}" href="${histIn}">입고</a>
    <a class="btn ${type eq 'OUT' ? '' : 'btn-ghost'}" href="${histOut}">출고</a>
    <a class="btn ${type eq 'MOVE' ? '' : 'btn-ghost'}" href="${histMove}">이동</a>
    <a class="btn ${type eq 'ADJUST' ? '' : 'btn-ghost'}" href="${histAdjust}">조정</a>
    <form class="excel-history" method="get"
      action="${pageContext.request.contextPath}/admin/excel/history">
      <label>시작일
        <input type="date" name="from" value="${from}">
      </label>
      <label>종료일
        <input type="date" name="to" value="${to}">
      </label>
      <button type="submit" class="btn">이력 내려받기</button>
    </form>
  </div>
</section>
<form class="filter" method="get" action="${pageContext.request.contextPath}/admin/stock/history">
  <input type="hidden" name="type" value="${type}">
  <label>시작일
    <input type="date" name="from" value="${from}">
  </label>
  <label>종료일
    <input type="date" name="to" value="${to}">
  </label>
  <label>창고
    <select name="warehouseNo">
      <option value="">전체</option>
      <c:forEach var="w" items="${warehouses}">
        <option value="${w.warehouseNo}" ${search.warehouseNo eq w.warehouseNo ? 'selected' : ''}>${w.warehouseName}</option>
      </c:forEach>
    </select>
  </label>
  <label>검색
    <input type="text" name="keyword" value="${search.keyword}" placeholder="코드·품목명">
  </label>
  <div class="filter-side">
    <button class="btn" type="submit">조회</button>
  </div>
</form>
<div class="table-wrap">
<table class="data">
  <thead>
    <tr>
      <th>일시</th>
      <th>유형</th>
      <th>품목</th>
      <th>창고</th>
      <th>수량</th>
      <th>변동</th>
      <th>처리자</th>
      <th>메모</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="h" items="${list}">
      <tr class="${not empty prevGroup and prevGroup eq h.groupNo ? 'hist-pair' : ''}">
        <td><fmt:formatDate value="${h.historyDate}" pattern="yyyy-MM-dd HH:mm"/></td>
        <td>
          <c:choose>
            <c:when test="${type eq 'MOVE'}">이동</c:when>
            <c:when test="${h.historyType eq 'IN'}">입고</c:when>
            <c:when test="${h.historyType eq 'OUT'}">출고</c:when>
            <c:when test="${h.historyType eq 'ADJUST'}">조정</c:when>
            <c:otherwise>${h.historyType}</c:otherwise>
          </c:choose>
        </td>
        <td>${h.goodsCode} · ${h.goodsName}</td>
        <td>${h.warehouseName}</td>
        <td>${h.qty}</td>
        <td>${h.beforeQty} → ${h.afterQty}</td>
        <td>${h.memberId}</td>
        <td>${h.memo}</td>
      </tr>
      <c:set var="prevGroup" value="${h.groupNo}"/>
    </c:forEach>
    <c:if test="${empty list}">
      <tr><td colspan="8">이력이 없습니다.</td></tr>
    </c:if>
  </tbody>
</table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
