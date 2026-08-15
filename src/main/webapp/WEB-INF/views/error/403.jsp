<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="error-panel">
  <p class="eyebrow">Error 403</p>
  <h1>접근 권한이 없습니다</h1>
  <p class="form-lead">이 화면은 관리자만 볼 수 있습니다.</p>
  <p class="hero-actions">
    <a class="btn" href="${pageContext.request.contextPath}/home">홈으로</a>
  </p>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
