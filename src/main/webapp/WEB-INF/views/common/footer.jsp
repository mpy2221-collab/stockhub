<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <jsp:include page="/WEB-INF/views/common/pager.jsp"/>
        </div>
      </div>
</main>
<footer class="foot">
  <div class="wrap foot-inner">
    <span>StockHub</span>
    <span class="foot-sep">·</span>
    <span>사내·매장 창고 재고 관리</span>
  </div>
</footer>
<%-- 화면에서 modalMsg를 request scope에 넣으면 열린다 --%>
<div class="modal" id="appModal" hidden
  data-msg="${fn:escapeXml(modalMsg)}" data-focus="${fn:escapeXml(modalFocus)}">
  <div class="modal-back"></div>
  <div class="modal-box" role="dialog" aria-modal="true">
    <p class="modal-text" id="appModalText"></p>
    <div class="modal-actions">
      <button class="btn btn-ghost" type="button" id="appModalCancel" hidden>취소</button>
      <button class="btn" type="button" id="appModalOk">확인</button>
    </div>
  </div>
</div>
<%-- 공통 알림 모달과 입력 형식 검사. 정적 js로 빼면 한글이 깨져 JSP에 둔다 --%>
<script>
var StockModal = (function () {
  var afterClose = null;
  var afterConfirm = null;

  function box() {
    return document.getElementById("appModal");
  }

  function open(text, options) {
    var opt = options || {};
    var el = box();
    if (!el) {
      window.alert(text);
      return;
    }
    afterClose = typeof opt.onClose === "function" ? opt.onClose : null;
    afterConfirm = typeof opt.onConfirm === "function" ? opt.onConfirm : null;
    document.getElementById("appModalText").textContent = text;
    document.getElementById("appModalOk").hidden = opt.busy === true;
    var cancel = document.getElementById("appModalCancel");
    if (cancel) {
      cancel.hidden = afterConfirm == null || opt.busy === true;
    }
    el.hidden = false;
  }

  function close() {
    var el = box();
    if (el) {
      el.hidden = true;
    }
    afterConfirm = null;
    var run = afterClose;
    afterClose = null;
    if (run) {
      run();
    }
  }

  function confirmOk() {
    var run = afterConfirm;
    afterConfirm = null;
    afterClose = null;
    var el = box();
    if (el) {
      el.hidden = true;
    }
    if (run) {
      run();
    }
  }

  function focusField(name) {
    if (!name) {
      return;
    }
    var el = document.getElementsByName(name)[0] || document.getElementById(name);
    if (el) {
      el.classList.add("is-error");
      el.focus();
    }
  }

  return { open: open, close: close, confirmOk: confirmOk, focusField: focusField };
})();

// 서버의 MemberValidator와 같은 규칙
var MEMBER_RULES = {
  memberId: {
    re: /^[a-z][a-z0-9_]{3,19}$/,
    msg: "아이디는 영문 소문자로 시작하는 4~20자입니다. 영문 소문자, 숫자, _만 쓸 수 있습니다."
  },
  memberPw: { re: /^(?=.*[A-Za-z])(?=.*[0-9]).{8,20}$/, msg: "비밀번호는 영문과 숫자를 함께 쓴 8~20자입니다." },
  newPw: { re: /^(?=.*[A-Za-z])(?=.*[0-9]).{8,20}$/, msg: "새 비밀번호는 영문과 숫자를 함께 쓴 8~20자입니다." },
  memberName: { re: /^[가-힣a-zA-Z]{2,20}$/, msg: "이름은 한글 또는 영문 2~20자입니다." },
  memberPhone: {
    re: /^01[016789]-?[0-9]{3,4}-?[0-9]{4}$/,
    msg: "전화번호는 010-0000-0000 형식으로 입력하세요."
  },
  memberAddr: { re: /^.{2,100}$/, msg: "주소는 2~100자로 입력하세요." },
  memberEmail: { re: /^[^@\s]+@[^@\s]+\.[a-zA-Z]{2,}$/, msg: "이메일 형식이 올바르지 않습니다." }
};

$(function () {
  var modalBox = document.getElementById("appModal");
  if (modalBox && modalBox.getAttribute("data-msg")) {
    var focusName = modalBox.getAttribute("data-focus");
    StockModal.open(modalBox.getAttribute("data-msg"), {
      onClose: function () {
        StockModal.focusField(focusName);
      }
    });
  }

  $("#appModalOk").on("click", function () {
    if (document.getElementById("appModalCancel")
        && !document.getElementById("appModalCancel").hidden) {
      StockModal.confirmOk();
      return;
    }
    StockModal.close();
  });
  $("#appModalCancel, #appModal .modal-back").on("click", function () {
    StockModal.close();
  });

  function setNavOpen(open) {
    document.body.classList.toggle("nav-open", open);
    var btn = document.getElementById("navToggle");
    var mask = document.getElementById("navMask");
    if (btn) {
      btn.setAttribute("aria-expanded", open ? "true" : "false");
    }
    if (mask) {
      mask.hidden = !open;
    }
  }

  $("#navToggle").on("click", function () {
    setNavOpen(!document.body.classList.contains("nav-open"));
  });
  $("#navMask").on("click", function () {
    setNavOpen(false);
  });

  $(document).on("keydown", function (e) {
    if (e.key === "Escape") {
      StockModal.close();
      setNavOpen(false);
    }
  });

  $(document).on("click", "tr.row-link[data-href]", function () {
    location.href = $(this).attr("data-href");
  });

  $("input").on("input", function () {
    $(this).removeClass("is-error");
  });

  $("form[data-validate]").on("submit", function (e) {
    var invalid = null;
    $(this).find("input[name]").each(function () {
      if (invalid) {
        return;
      }
      var value = $.trim(this.value);
      if (this.required && value === "") {
        invalid = { el: this, msg: "필수 입력 항목입니다." };
        return;
      }
      var rule = MEMBER_RULES[this.name];
      if (!rule || value === "") {
        return;
      }
      if (!rule.re.test(value)) {
        invalid = { el: this, msg: rule.msg };
      }
    });
    if (invalid) {
      e.preventDefault();
      StockModal.open(invalid.msg, {
        onClose: function () {
          StockModal.focusField(invalid.el.name);
        }
      });
      return;
    }
    $(this).find("button[type=submit]").prop("disabled", true);
    StockModal.open("처리 중입니다. 잠시만 기다려 주세요.", { busy: true });
  });
});
</script>
</body>
</html>
