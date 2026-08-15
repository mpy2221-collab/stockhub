<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="form-page form-page-sm">
  <section class="page-head">
    <p class="eyebrow">Admin</p>
    <h1>카테고리 등록</h1>
    <p class="form-lead">품목 등록 화면의 분류 목록에 바로 반영됩니다.</p>
  </section>
  <section class="form-panel">
    <c:if test="${not empty msg}">
      <p class="error">${msg}</p>
    </c:if>
    <form class="form-grid form-grid-1" action="${pageContext.request.contextPath}/admin/category/insert" method="post">
      <label>카테고리명
        <input type="text" name="categoryName" value="${category.categoryName}" required maxlength="50"
          placeholder="예: 전자기기">
        <span class="field-note">이미 있는 이름은 등록할 수 없습니다.</span>
      </label>
      <div class="form-foot">
        <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/category/list">취소</a>
        <button class="btn" type="submit">등록</button>
      </div>
    </form>
  </section>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
