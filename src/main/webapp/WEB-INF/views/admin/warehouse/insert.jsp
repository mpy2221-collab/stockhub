<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="form-page form-page-sm">
  <section class="page-head">
    <p class="eyebrow">Admin</p>
    <h1>창고 등록</h1>
    <p class="form-lead">재고는 창고 단위로 쌓입니다. 본사·매장처럼 구분이 되는 이름으로 적어 주세요.</p>
  </section>
  <section class="form-panel">
    <c:if test="${not empty msg}">
      <p class="error">${msg}</p>
    </c:if>
    <form class="form-grid form-grid-1" action="${pageContext.request.contextPath}/admin/warehouse/insert" method="post">
      <label>창고명
        <input type="text" name="warehouseName" required maxlength="100" placeholder="예: 본사창고">
        <span class="field-note">등록하면 바로 사용 상태가 되고, 수정 화면에서 중지할 수 있습니다.</span>
      </label>
      <div class="form-foot">
        <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/warehouse/list">취소</a>
        <button class="btn" type="submit">등록</button>
      </div>
    </form>
  </section>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
