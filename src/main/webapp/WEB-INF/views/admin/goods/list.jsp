<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="page-head row-head">
  <div>
    <p class="eyebrow">Admin</p>
    <h1>품목</h1>
  </div>
  <div class="hero-actions">
    <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/excel/goods">품목 내려받기</a>
    <a class="btn" href="${pageContext.request.contextPath}/admin/goods/insertFrm">품목 등록</a>
  </div>
</section>
<form class="filter" method="get" action="${pageContext.request.contextPath}/admin/goods/list">
  <label>검색
    <input type="text" name="keyword" value="${search.keyword}" placeholder="코드·품목명">
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
      <th>이미지</th>
      <th>코드</th>
      <th>이름</th>
      <th>카테고리</th>
      <th>안전재고</th>
      <th>합계</th>
      <th>사용</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="g" items="${list}">
      <tr class="row-link" data-href="${pageContext.request.contextPath}/admin/goods/updateFrm?goodsNo=${g.goodsNo}">
        <td>
          <c:choose>
            <c:when test="${not empty g.imagePath}">
              <img class="goods-thumb" alt="${g.goodsName}"
                src="${pageContext.request.contextPath}/goods/image?goodsNo=${g.goodsNo}&v=${initParam.assetVersion}"
                onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/img/goods-default.png'">
            </c:when>
            <c:otherwise>
              <img class="goods-thumb" alt="${g.goodsName}"
                src="${pageContext.request.contextPath}/resources/img/goods-default.png">
            </c:otherwise>
          </c:choose>
        </td>
        <td>${g.goodsCode}</td>
        <td>${g.goodsName}</td>
        <td>${g.category}</td>
        <td>${g.safetyQty}</td>
        <td>${g.stockQty}</td>
        <td>
          <c:choose>
            <c:when test="${g.useYn eq 'Y'}">사용</c:when>
            <c:otherwise>중지</c:otherwise>
          </c:choose>
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty list}">
      <tr><td colspan="7">등록된 품목이 없습니다.</td></tr>
    </c:if>
  </tbody>
</table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
