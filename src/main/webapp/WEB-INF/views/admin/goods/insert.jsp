<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="form-page">
  <section class="page-head">
    <p class="eyebrow">Admin</p>
    <h1>품목 등록</h1>
    <p class="form-lead">품목코드는 바코드와 검색에 쓰이므로 중복 없이 정하세요. 분류는 등록된 카테고리에서 고릅니다.</p>
  </section>
  <section class="form-panel">
    <c:if test="${not empty msg}">
      <p class="error">${msg}</p>
    </c:if>
    <form class="form-grid" action="${pageContext.request.contextPath}/admin/goods/insert"
      method="post" enctype="multipart/form-data">
      <label>품목코드
        <input type="text" name="goodsCode" id="goodsCode" value="${goods.goodsCode}" required maxlength="30"
          placeholder="예: NB-001">
        <span id="codeMsg" class="hint"></span>
      </label>
      <label>품목명
        <input type="text" name="goodsName" value="${goods.goodsName}" required placeholder="예: 노트북">
        <span class="hint"></span>
      </label>
      <label>카테고리
        <select name="categoryNo" required>
          <option value="">선택하세요</option>
          <c:forEach var="cat" items="${categories}">
            <option value="${cat.categoryNo}" ${goods.categoryNo eq cat.categoryNo ? 'selected' : ''}>${cat.categoryName}</option>
          </c:forEach>
        </select>
        <span class="field-note">없으면
          <a href="${pageContext.request.contextPath}/admin/category/insertFrm">카테고리를 먼저 등록</a>하세요.
        </span>
      </label>
      <label>단위
        <input type="text" name="unit" value="${goods.unit}" list="unitOptions" placeholder="예: 개, 박스, 대">
        <datalist id="unitOptions">
          <option value="개"></option>
          <option value="박스"></option>
          <option value="대"></option>
          <option value="롤"></option>
          <option value="세트"></option>
        </datalist>
        <span class="field-note">재고를 세는 단위입니다.</span>
      </label>
      <label>안전재고
        <input type="number" name="safetyQty" min="0" value="${empty goods.safetyQty ? 0 : goods.safetyQty}">
        <span class="field-note">전 창고 합계가 이 값보다 적으면 부족으로 표시됩니다.</span>
      </label>
      <label>단가
        <input type="number" name="unitPrice" min="0" value="${empty goods.unitPrice ? 0 : goods.unitPrice}">
        <span class="field-note">원 단위로 입력합니다.</span>
      </label>
      <label class="span-full">대표 이미지
        <input type="file" name="image" accept=".jpg,.jpeg,.png,.webp">
        <span class="field-note">jpg, png, webp / 5MB까지. 없어도 등록할 수 있습니다.</span>
      </label>
      <div class="span-full form-foot">
        <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/goods/list">취소</a>
        <button class="btn" type="submit">등록</button>
      </div>
    </form>
  </section>
</div>
<script>
$("#goodsCode").on("blur", function () {
  var code = $(this).val();
  if (!code) {
    $("#codeMsg").text("").removeClass("ok err");
    return;
  }
  $.get("${pageContext.request.contextPath}/admin/goods/checkCode", { goodsCode: code })
    .done(function (msg) {
      if (msg === "duplication") {
        $("#codeMsg").text("이미 사용 중인 코드입니다.").removeClass("ok").addClass("err");
      } else {
        $("#codeMsg").text("사용 가능한 코드입니다.").removeClass("err").addClass("ok");
      }
    });
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
