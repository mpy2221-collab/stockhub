<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="modalMsg" value="${msg}" scope="request"/>
<c:if test="${param.result eq 'join'}">
  <c:set var="modalMsg" value="회원가입이 완료되었습니다. 로그인해 주세요." scope="request"/>
</c:if>
<c:if test="${param.result eq 'withdraw'}">
  <c:set var="modalMsg" value="탈퇴가 완료되었습니다." scope="request"/>
</c:if>
<c:if test="${param.result eq 'tempPw'}">
  <c:set var="modalMsg" value="임시 비밀번호를 이메일로 보냈습니다. 로그인 후 비밀번호를 바꿔 주세요." scope="request"/>
</c:if>
<section class="auth-panel">
  <div class="auth-card">
    <p class="eyebrow">Sign in</p>
    <h1>로그인</h1>
    <p class="auth-desc">아이디와 비밀번호로 StockHub에 들어갑니다.</p>
    <form class="auth-form" action="${pageContext.request.contextPath}/login" method="post">
      <label>아이디
        <input type="text" name="memberId" autocomplete="username" required
          placeholder="아이디를 입력하세요" value="${fn:escapeXml(param.memberId)}">
      </label>
      <label>비밀번호
        <input type="password" name="memberPw" autocomplete="current-password" required
          placeholder="비밀번호를 입력하세요">
      </label>
      <button class="btn btn-block" type="submit">로그인</button>
    </form>
    <p class="help">
      계정이 없나요? <a href="${pageContext.request.contextPath}/joinFrm">회원가입</a>
      · <a href="${pageContext.request.contextPath}/searchPwFrm">비밀번호 찾기</a>
    </p>
  </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
