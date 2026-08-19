<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="page-head">
  <p class="eyebrow">${goods.category}</p>
  <h1>${goods.goodsName}</h1>
  <p class="lede">코드 ${goods.goodsCode} · 단위 ${goods.unit} · 전 창고 합계 ${goods.totalQty}</p>
</section>
<div class="split">
  <section class="card">
    <h2>품목 정보</h2>
    <c:choose>
      <c:when test="${not empty goods.imagePath}">
        <img class="goods-photo" alt="${goods.goodsName}"
          src="${pageContext.request.contextPath}/goods/image?goodsNo=${goods.goodsNo}&v=${initParam.assetVersion}"
          onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/img/goods-default.png'">
      </c:when>
      <c:otherwise>
        <img class="goods-photo" alt="${goods.goodsName}"
          src="${pageContext.request.contextPath}/resources/img/goods-default.png">
      </c:otherwise>
    </c:choose>
    <dl class="kv">
      <dt>안전재고</dt><dd>${goods.safetyQty}</dd>
      <dt>단가</dt><dd>${goods.unitPrice}</dd>
    </dl>
    <c:if test="${not empty goods.goodsCode}">
      <div class="barcode-box">
        <svg id="barcode"></svg>
      </div>
    </c:if>
  </section>
  <section class="card">
    <h2>창고별 현재고</h2>
    <div class="table-wrap">
    <table class="data" id="stockTable">
      <thead>
        <tr>
          <th>창고</th>
          <th>수량</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="s" items="${stocks}">
          <tr>
            <td>${s.warehouseName}</td>
            <td>${s.stockQty}</td>
          </tr>
        </c:forEach>
        <c:if test="${empty stocks}">
          <tr><td colspan="2">사용중인 창고가 없습니다.</td></tr>
        </c:if>
      </tbody>
    </table>
    </div>
  </section>
</div>
<p class="help"><a href="${pageContext.request.contextPath}/goods/list">목록으로</a></p>
<c:if test="${not empty goods.goodsCode}">
<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.6/dist/JsBarcode.all.min.js"></script>
<script>
JsBarcode("#barcode", "${goods.goodsCode}", {
  format: "CODE128",
  displayValue: true,
  fontSize: 14,
  height: 60,
  margin: 8
});
</script>
</c:if>
<script>
$.get("${pageContext.request.contextPath}/goods/stocks", { goodsNo: "${goods.goodsNo}" })
  .done(function (rows) {
    var $tb = $("#stockTable tbody");
    $tb.empty();
    if (!rows || rows.length === 0) {
      $tb.append("<tr><td colspan=\"2\">사용중인 창고가 없습니다.</td></tr>");
      return;
    }
    $.each(rows, function (i, s) {
      $tb.append("<tr><td>" + s.warehouseName + "</td><td>" + s.stockQty + "</td></tr>");
    });
  });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
