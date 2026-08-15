<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="form-page">
  <section class="page-head">
    <p class="eyebrow">Stock</p>
    <h1>창고 이동</h1>
    <p class="form-lead">화면에서는 한 건입니다. DB에는 출발 출고와 도착 입고가 같은 묶음으로 남습니다.</p>
  </section>
  <section class="form-panel">
    <c:if test="${not empty msg}">
      <p class="error">${msg}</p>
    </c:if>
    <form class="form-grid" action="${pageContext.request.contextPath}/admin/stock/move" method="post">
      <label>품목
        <select name="goodsNo" id="goodsNo" required>
          <option value="">선택하세요</option>
          <c:forEach var="g" items="${goodsList}">
            <option value="${g.goodsNo}">${g.goodsCode} · ${g.goodsName}</option>
          </c:forEach>
        </select>
      </label>
      <label>수량
        <input type="number" name="qty" min="1" required>
      </label>
      <label>출발 창고
        <select name="fromWarehouseNo" id="fromWarehouseNo" required>
          <option value="">선택하세요</option>
          <c:forEach var="w" items="${warehouses}">
            <option value="${w.warehouseNo}">${w.warehouseName}</option>
          </c:forEach>
        </select>
        <span class="field-note">출발 현재고 <strong id="fromQty">-</strong></span>
      </label>
      <label>도착 창고
        <select name="toWarehouseNo" id="toWarehouseNo" required>
          <option value="">선택하세요</option>
          <c:forEach var="w" items="${warehouses}">
            <option value="${w.warehouseNo}">${w.warehouseName}</option>
          </c:forEach>
        </select>
        <span class="field-note">도착 현재고 <strong id="toQty">-</strong></span>
      </label>
      <label class="span-full">메모
        <input type="text" name="memo" maxlength="500" placeholder="선택">
      </label>
      <div class="span-full form-foot">
        <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/stock/history">이력</a>
        <button class="btn" type="submit">이동</button>
      </div>
    </form>
  </section>
</div>
<script>
function loadMoveQty() {
  var goods = $("#goodsNo").val();
  var fromWh = $("#fromWarehouseNo").val();
  var toWh = $("#toWarehouseNo").val();
  if (goods && fromWh) {
    $.get("${pageContext.request.contextPath}/admin/stock/qty", { warehouseNo: fromWh, goodsNo: goods })
      .done(function (data) { $("#fromQty").text(data.qty); });
  } else {
    $("#fromQty").text("-");
  }
  if (goods && toWh) {
    $.get("${pageContext.request.contextPath}/admin/stock/qty", { warehouseNo: toWh, goodsNo: goods })
      .done(function (data) { $("#toQty").text(data.qty); });
  } else {
    $("#toQty").text("-");
  }
}
$("#goodsNo, #fromWarehouseNo, #toWarehouseNo").on("change", loadMoveQty);
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
