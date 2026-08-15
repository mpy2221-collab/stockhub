<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="error-panel">
  <p class="eyebrow">Error 500</p>
  <h1>처리 중 오류가 났습니다</h1>
  <p class="form-lead">잠시 후 다시 시도해 주세요.</p>
  <p class="hero-actions">
    <c:choose>
      <c:when test="${not empty loginMember}">
        <a class="btn" href="${pageContext.request.contextPath}/home">홈으로</a>
      </c:when>
      <c:otherwise>
        <a class="btn" href="${pageContext.request.contextPath}/loginFrm">로그인</a>
      </c:otherwise>
    </c:choose>
  </p>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
