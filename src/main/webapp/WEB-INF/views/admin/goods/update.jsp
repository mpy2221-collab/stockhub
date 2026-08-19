<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="form-page">
  <section class="page-head">
    <p class="eyebrow">Admin</p>
    <h1>품목 수정</h1>
    <p class="form-lead">사용을 중지하면 재고 조회 목록과 입출고 요청 대상에서 빠집니다.</p>
  </section>
  <section class="form-panel">
    <c:if test="${not empty msg}">
      <p class="error">${msg}</p>
    </c:if>
    <form class="form-grid" action="${pageContext.request.contextPath}/admin/goods/update"
      method="post" enctype="multipart/form-data">
      <input type="hidden" name="goodsNo" id="goodsNo" value="${goods.goodsNo}">
      <label>품목코드
        <input type="text" name="goodsCode" id="goodsCode" value="${goods.goodsCode}" required maxlength="30">
        <span id="codeMsg" class="hint"></span>
      </label>
      <label>품목명
        <input type="text" name="goodsName" value="${goods.goodsName}" required>
        <span class="hint"></span>
      </label>
      <label>카테고리
        <select name="categoryNo" required>
          <option value="">선택하세요</option>
          <c:forEach var="cat" items="${categories}">
            <option value="${cat.categoryNo}" ${goods.categoryNo eq cat.categoryNo ? 'selected' : ''}>${cat.categoryName}</option>
          </c:forEach>
        </select>
      </label>
      <label>단위
        <input type="text" name="unit" value="${goods.unit}" list="unitOptions">
        <datalist id="unitOptions">
          <option value="개"></option>
          <option value="박스"></option>
          <option value="대"></option>
          <option value="롤"></option>
          <option value="세트"></option>
        </datalist>
      </label>
      <label>안전재고
        <input type="number" name="safetyQty" min="0" value="${goods.safetyQty}">
        <span class="field-note">전 창고 합계 기준입니다.</span>
      </label>
      <label>단가
        <input type="number" name="unitPrice" min="0" value="${goods.unitPrice}">
        <span class="field-note">원 단위로 입력합니다.</span>
      </label>
      <label class="span-full">사용 여부
        <select name="useYn">
          <option value="Y" ${goods.useYn eq 'Y' ? 'selected' : ''}>사용</option>
          <option value="N" ${goods.useYn eq 'N' ? 'selected' : ''}>중지</option>
        </select>
      </label>
      <label class="span-full">대표 이미지
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
        <input type="file" name="image" accept=".jpg,.jpeg,.png,.webp">
        <span class="field-note">새 파일을 올리면 바뀝니다. 비워 두면 지금 이미지를 유지합니다.</span>
      </label>
      <div class="span-full form-foot">
        <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/goods/list">취소</a>
        <button class="btn" type="submit">저장</button>
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
  $.get("${pageContext.request.contextPath}/admin/goods/checkCode", {
    goodsCode: code,
    goodsNo: $("#goodsNo").val()
  }).done(function (msg) {
    if (msg === "duplication") {
      $("#codeMsg").text("이미 사용 중인 코드입니다.").removeClass("ok").addClass("err");
    } else {
      $("#codeMsg").text("사용 가능한 코드입니다.").removeClass("err").addClass("ok");
    }
  });
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
