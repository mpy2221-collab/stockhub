<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="form-page form-page-sm">
  <section class="page-head">
    <p class="eyebrow">Admin</p>
    <h1>창고 수정</h1>
    <p class="form-lead">중지하면 재고 조회 필터와 입출고 대상에서 빠집니다.</p>
  </section>
  <section class="form-panel">
    <c:if test="${not empty msg}">
      <p class="error">${msg}</p>
    </c:if>
    <form class="form-grid form-grid-1" action="${pageContext.request.contextPath}/admin/warehouse/update" method="post">
      <input type="hidden" name="warehouseNo" value="${warehouse.warehouseNo}">
      <label>창고명
        <input type="text" name="warehouseName" value="${warehouse.warehouseName}" required maxlength="100">
      </label>
      <label>사용 여부
        <select name="useYn">
          <option value="Y" ${warehouse.useYn eq 'Y' ? 'selected' : ''}>사용</option>
          <option value="N" ${warehouse.useYn eq 'N' ? 'selected' : ''}>중지</option>
        </select>
      </label>
      <div class="form-foot">
        <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/warehouse/list">취소</a>
        <button class="btn" type="submit">저장</button>
      </div>
    </form>
  </section>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
