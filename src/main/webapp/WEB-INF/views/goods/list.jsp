<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="page-head">
  <p class="eyebrow">Stock</p>
  <h1>재고 조회</h1>
</section>
<form class="filter" method="get" action="${pageContext.request.contextPath}/goods/list">
  <label>창고
    <select name="warehouseNo">
      <option value="">전체</option>
      <c:forEach var="w" items="${warehouses}">
        <option value="${w.warehouseNo}" ${search.warehouseNo eq w.warehouseNo ? 'selected' : ''}>${w.warehouseName}</option>
      </c:forEach>
    </select>
  </label>
  <label>카테고리
    <select name="categoryNo">
      <option value="">전체</option>
      <c:forEach var="cat" items="${categories}">
        <option value="${cat.categoryNo}" ${search.categoryNo eq cat.categoryNo ? 'selected' : ''}>${cat.categoryName}</option>
      </c:forEach>
    </select>
  </label>
  <label>검색
    <input type="text" name="keyword" value="${search.keyword}" placeholder="코드·품목명">
  </label>
  <div class="filter-side">
    <label class="filter-chip">
      <input type="checkbox" name="lowStock" value="Y" ${search.lowStock ? 'checked' : ''}>
      <span>부족만</span>
    </label>
    <button class="btn" type="submit">조회</button>
  </div>
</form>
<div class="table-wrap">
<table class="data">
  <thead>
    <tr>
      <th>이미지</th>
      <th>코드</th>
      <th>품목명</th>
      <th>카테고리</th>
      <th>단위</th>
      <th>현재고</th>
      <th>안전재고</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="g" items="${list}">
      <tr class="${g.totalQty lt g.safetyQty ? 'low' : ''}">
        <td>
          <a class="goods-thumb-link" href="${pageContext.request.contextPath}/goods/view?goodsNo=${g.goodsNo}">
            <c:choose>
              <c:when test="${not empty g.imagePath}">
                <img class="goods-thumb" alt="${g.goodsName}"
                  src="${pageContext.request.contextPath}/goods/image?goodsNo=${g.goodsNo}"
                  onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/img/goods-default.png'">
              </c:when>
              <c:otherwise>
                <img class="goods-thumb" alt="${g.goodsName}"
                  src="${pageContext.request.contextPath}/resources/img/goods-default.png">
              </c:otherwise>
            </c:choose>
          </a>
        </td>
        <td>
          <a href="${pageContext.request.contextPath}/goods/view?goodsNo=${g.goodsNo}">${g.goodsCode}</a>
        </td>
        <td>${g.goodsName}</td>
        <td>${g.category}</td>
        <td>${g.unit}</td>
        <td>${g.stockQty}</td>
        <td>${g.safetyQty}</td>
      </tr>
    </c:forEach>
    <c:if test="${empty list}">
      <tr><td colspan="7">조회된 품목이 없습니다.</td></tr>
    </c:if>
  </tbody>
</table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
