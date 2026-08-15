<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="modalMsg" value="${msg}" scope="request"/>
<c:set var="modalFocus" value="${errorField}" scope="request"/>
<c:if test="${param.result eq 'info'}">
  <c:set var="modalMsg" value="회원 정보를 저장했습니다." scope="request"/>
</c:if>
<c:if test="${param.result eq 'pw'}">
  <c:set var="modalMsg" value="비밀번호를 변경했습니다." scope="request"/>
</c:if>
<section class="page-head">
  <p class="eyebrow">Account</p>
  <h1>마이페이지</h1>
</section>
<div class="split">
  <section class="card">
    <h2>회원 정보</h2>
    <%-- 검증은 common.js가 맡고 결과는 모달로 알린다 --%>
    <form class="auth-form" data-validate="member" novalidate
      action="${pageContext.request.contextPath}/updateMember" method="post">
      <label>아이디
        <input type="text" value="${loginMember.memberId}" disabled>
      </label>
      <label>이름
        <input type="text" name="memberName" value="${loginMember.memberName}" required
          pattern="[가-힣a-zA-Z]{2,20}" title="한글 또는 영문 2~20자">
      </label>
      <label>전화
        <input type="text" name="memberPhone" value="${loginMember.memberPhone}"
          placeholder="010-0000-0000" pattern="01[016789]-?[0-9]{3,4}-?[0-9]{4}"
          title="010-0000-0000 형식">
      </label>
      <label>주소
        <input type="text" name="memberAddr" value="${loginMember.memberAddr}"
          placeholder="주소를 입력하세요" maxlength="100">
      </label>
      <label>이메일
        <input type="email" value="${loginMember.memberEmail}" disabled>
        <span class="hint">가입할 때 인증한 이메일이라 바꿀 수 없습니다.</span>
      </label>
      <button class="btn" type="submit">정보 수정</button>
    </form>
  </section>
  <section class="card">
    <h2>비밀번호 변경</h2>
    <form class="auth-form" data-validate="password" novalidate
      action="${pageContext.request.contextPath}/updatePw" method="post">
      <label>현재 비밀번호
        <input type="password" name="currentPw" required autocomplete="current-password">
      </label>
      <label>새 비밀번호
        <input type="password" name="newPw" required autocomplete="new-password"
          title="영문과 숫자를 함께 쓴 8~20자">
      </label>
      <button class="btn" type="submit">비밀번호 변경</button>
    </form>
  </section>
</div>
<section class="card withdraw-card">
  <h2>회원 탈퇴</h2>
  <p class="help">탈퇴하면 계정은 삭제됩니다. 입출고 이력은 그대로 남습니다.</p>
  <form class="auth-form" id="withdrawForm" action="${pageContext.request.contextPath}/withdraw" method="post">
    <label>현재 비밀번호
      <input type="password" name="currentPw" id="withdrawPw" required autocomplete="current-password">
    </label>
    <button class="btn" type="submit">탈퇴</button>
  </form>
</section>
<script>
$("#withdrawForm").on("submit", function (e) {
  if (this.getAttribute("data-ok") === "1") {
    return;
  }
  e.preventDefault();
  var form = this;
  StockModal.open("정말 탈퇴할까요? 계정은 삭제되고 입출고 이력은 남습니다.", {
    onConfirm: function () {
      form.setAttribute("data-ok", "1");
      form.submit();
    }
  });
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
