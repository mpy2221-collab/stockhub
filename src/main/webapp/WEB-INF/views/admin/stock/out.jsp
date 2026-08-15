<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="form-page">
  <section class="page-head">
    <p class="eyebrow">Stock</p>
    <h1>출고</h1>
    <p class="form-lead">해당 창고 수량이 충분할 때만 빼고 출고 이력을 남깁니다.</p>
  </section>
  <section class="form-panel">
    <c:if test="${not empty msg}">
      <p class="error">${msg}</p>
    </c:if>
    <form class="form-grid" action="${pageContext.request.contextPath}/admin/stock/out" method="post">
      <label>창고
        <select name="warehouseNo" id="warehouseNo" required>
          <option value="">선택하세요</option>
          <c:forEach var="w" items="${warehouses}">
            <option value="${w.warehouseNo}">${w.warehouseName}</option>
          </c:forEach>
        </select>
      </label>
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
        <span class="field-note">현재고 <strong id="curQty">-</strong></span>
      </label>
      <label>메모
        <input type="text" name="memo" maxlength="500" placeholder="선택">
      </label>
      <div class="span-full form-foot">
        <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/stock/history">이력</a>
        <button class="btn" type="submit">출고</button>
      </div>
    </form>
  </section>
</div>
<script>
function loadQty() {
  var wh = $("#warehouseNo").val();
  var goods = $("#goodsNo").val();
  if (!wh || !goods) {
    $("#curQty").text("-");
    return;
  }
  $.get("${pageContext.request.contextPath}/admin/stock/qty", { warehouseNo: wh, goodsNo: goods })
    .done(function (data) {
      $("#curQty").text(data.qty);
    });
}
$("#warehouseNo, #goodsNo").on("change", loadQty);
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
