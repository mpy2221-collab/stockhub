<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="modalMsg" value="${msg}" scope="request"/>
<c:set var="modalFocus" value="${errorField}" scope="request"/>
<c:set var="verifiedEmail" value="${sessionScope.emailVerified}"/>
<section class="auth-panel">
  <div class="auth-card auth-card-wide">
    <p class="eyebrow">Create account</p>
    <h1>회원가입</h1>
    <p class="auth-desc">이메일 인증을 마친 뒤 가입합니다. 기본 등급은 일반 회원입니다.</p>
    <%-- 검증은 common.js가 맡고 결과는 모달로 알린다 --%>
    <form class="auth-form auth-grid" data-validate="member" novalidate
      action="${pageContext.request.contextPath}/join" method="post">
      <label>아이디
        <input type="text" name="memberId" id="memberId" required maxlength="20"
          autocomplete="username" placeholder="아이디를 입력하세요"
          pattern="[a-z][a-z0-9_]{3,19}" title="영문 소문자로 시작하는 4~20자"
          value="${fn:escapeXml(param.memberId)}">
        <span id="idMsg" class="hint"></span>
      </label>
      <label>비밀번호
        <input type="password" name="memberPw" required autocomplete="new-password"
          placeholder="4~20자" title="비밀번호 4~20자">
      </label>
      <label>이름
        <input type="text" name="memberName" required placeholder="이름을 입력하세요"
          pattern="[가-힣a-zA-Z]{2,20}" title="한글 또는 영문 2~20자"
          value="${fn:escapeXml(param.memberName)}">
      </label>
      <label>전화
        <input type="text" name="memberPhone" placeholder="010-0000-0000"
          pattern="01[016789]-?[0-9]{3,4}-?[0-9]{4}" title="010-0000-0000 형식"
          value="${fn:escapeXml(param.memberPhone)}">
      </label>
      <label class="span-2">주소
        <input type="text" name="memberAddr" placeholder="주소를 입력하세요" maxlength="100"
          value="${fn:escapeXml(param.memberAddr)}">
      </label>
      <label class="span-2">이메일
        <div class="field-row">
          <input type="email" name="memberEmail" id="memberEmail" required
            placeholder="이메일을 입력하세요" value="${fn:escapeXml(param.memberEmail)}">
          <button class="btn btn-code" type="button" id="btnSendCode">인증번호 보내기</button>
        </div>
        <c:choose>
          <c:when test="${not empty verifiedEmail and verifiedEmail eq param.memberEmail}">
            <span id="emailMsg" class="hint ok">인증을 마친 이메일입니다.</span>
          </c:when>
          <c:otherwise>
            <span id="emailMsg" class="hint"></span>
          </c:otherwise>
        </c:choose>
      </label>
      <label class="span-2">인증번호
        <div class="field-row">
          <input type="text" id="emailCode" maxlength="6" inputmode="numeric" placeholder="인증번호 6자리">
          <button class="btn btn-code" type="button" id="btnVerifyCode">확인</button>
        </div>
        <span id="codeMsg" class="hint"></span>
      </label>
      <div class="span-2">
        <button class="btn btn-block" type="submit">가입하기</button>
      </div>
    </form>
    <p class="help">이미 계정이 있나요? <a href="${pageContext.request.contextPath}/loginFrm">로그인</a></p>
  </div>
</section>
<script>
$("#memberId").on("blur", function () {
  var id = $(this).val();
  if (!id) {
    $("#idMsg").text("").removeClass("ok err");
    return;
  }
  $.get("${pageContext.request.contextPath}/checkId", { memberId: id })
    .done(function (msg) {
      if (msg === "duplication") {
        $("#idMsg").text("이미 사용 중인 아이디입니다.").removeClass("ok").addClass("err");
      } else {
        $("#idMsg").text("사용 가능한 아이디입니다.").removeClass("err").addClass("ok");
      }
    });
});
$("#memberEmail").on("blur", function () {
  var email = $(this).val();
  if (!email) {
    $("#emailMsg").text("").removeClass("ok err");
    return;
  }
  $.get("${pageContext.request.contextPath}/checkEmail", { memberEmail: email })
    .done(function (msg) {
      if (msg === "duplication") {
        $("#emailMsg").text("이미 사용 중인 이메일입니다.").removeClass("ok").addClass("err");
      } else {
        $("#emailMsg").text("사용 가능한 이메일입니다.").removeClass("err").addClass("ok");
      }
    });
});
$("#btnSendCode").on("click", function () {
  var email = $("#memberEmail").val();
  if (!email) {
    $("#emailMsg").text("이메일을 입력하세요.").removeClass("ok").addClass("err");
    return;
  }
  $.post("${pageContext.request.contextPath}/sendEmailCode", { memberEmail: email })
    .done(function (msg) {
      if (msg === "ok") {
        $("#emailMsg").text("인증번호를 보냈습니다. 5분 안에 입력하세요.").removeClass("err").addClass("ok");
        $("#codeMsg").text("").removeClass("ok err");
        StockModal.open("입력하신 메일로 인증번호를 보냈습니다.");
      } else if (msg === "duplication") {
        $("#emailMsg").text("이미 사용 중인 이메일입니다.").removeClass("ok").addClass("err");
      } else {
        $("#emailMsg").text("인증번호를 보내지 못했습니다. 이메일을 확인하세요.").removeClass("ok").addClass("err");
      }
    });
});
$("#btnVerifyCode").on("click", function () {
  $.post("${pageContext.request.contextPath}/verifyEmailCode", {
    memberEmail: $("#memberEmail").val(),
    code: $("#emailCode").val()
  }).done(function (msg) {
    if (msg === "ok") {
      $("#codeMsg").text("인증되었습니다.").removeClass("err").addClass("ok");
      StockModal.open("이메일 인증이 완료되었습니다.");
    } else {
      $("#codeMsg").text("인증번호가 올바르지 않거나 만료되었습니다.").removeClass("ok").addClass("err");
    }
  });
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
