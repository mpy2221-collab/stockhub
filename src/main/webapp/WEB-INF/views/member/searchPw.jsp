<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="modalMsg" value="${msg}" scope="request"/>
<section class="auth-panel">
  <div class="auth-card">
    <p class="eyebrow">Reset password</p>
    <h1>비밀번호 찾기</h1>
    <p class="auth-desc">가입한 아이디와 이메일로 임시 비밀번호를 받습니다.</p>
    <form class="auth-form" action="${pageContext.request.contextPath}/searchPw" method="post">
      <label>아이디
        <input type="text" name="memberId" required autocomplete="username"
          placeholder="아이디를 입력하세요" value="${fn:escapeXml(param.memberId)}">
      </label>
      <label>이메일
        <input type="email" name="memberEmail" required placeholder="가입한 이메일을 입력하세요"
          value="${fn:escapeXml(param.memberEmail)}">
      </label>
      <button class="btn btn-block" type="submit">임시 비밀번호 받기</button>
    </form>
    <p class="help">
      비밀번호가 기억났나요? <a href="${pageContext.request.contextPath}/loginFrm">로그인</a>
      · <a href="${pageContext.request.contextPath}/joinFrm">회원가입</a>
    </p>
  </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
