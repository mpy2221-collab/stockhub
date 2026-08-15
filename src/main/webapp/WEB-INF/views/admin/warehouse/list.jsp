<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="page-head row-head">
  <div>
    <p class="eyebrow">Admin</p>
    <h1>창고</h1>
  </div>
  <a class="btn" href="${pageContext.request.contextPath}/admin/warehouse/insertFrm">창고 등록</a>
</section>
<form class="filter" method="get" action="${pageContext.request.contextPath}/admin/warehouse/list">
  <label>검색
    <input type="text" name="keyword" value="${search.keyword}" placeholder="창고명">
  </label>
  <label>사용여부
    <select name="useYn">
      <option value="">전체</option>
      <option value="Y" ${search.useYn eq 'Y' ? 'selected' : ''}>사용</option>
      <option value="N" ${search.useYn eq 'N' ? 'selected' : ''}>중지</option>
    </select>
  </label>
  <div class="filter-side">
    <button class="btn" type="submit">조회</button>
  </div>
</form>
<div class="table-wrap">
<table class="data">
  <thead>
    <tr>
      <th>번호</th>
      <th>이름</th>
      <th>사용</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="w" items="${list}">
      <tr class="row-link" data-href="${pageContext.request.contextPath}/admin/warehouse/updateFrm?warehouseNo=${w.warehouseNo}">
        <td>${w.warehouseNo}</td>
        <td>${w.warehouseName}</td>
        <td>
          <c:choose>
            <c:when test="${w.useYn eq 'Y'}">사용</c:when>
            <c:otherwise>중지</c:otherwise>
          </c:choose>
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty list}">
      <tr><td colspan="3">등록된 창고가 없습니다.</td></tr>
    </c:if>
  </tbody>
</table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
