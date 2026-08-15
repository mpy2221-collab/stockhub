<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:url var="reqWait" value="/admin/stock/request">
  <c:param name="status" value="WAIT"/>
  <c:param name="requestType" value="${search.requestType}"/>
  <c:param name="keyword" value="${search.keyword}"/>
</c:url>
<c:url var="reqAll" value="/admin/stock/request">
  <c:param name="status" value="ALL"/>
  <c:param name="requestType" value="${search.requestType}"/>
  <c:param name="keyword" value="${search.keyword}"/>
</c:url>
<c:url var="reqApprove" value="/admin/stock/request">
  <c:param name="status" value="APPROVE"/>
  <c:param name="requestType" value="${search.requestType}"/>
  <c:param name="keyword" value="${search.keyword}"/>
</c:url>
<c:url var="reqReject" value="/admin/stock/request">
  <c:param name="status" value="REJECT"/>
  <c:param name="requestType" value="${search.requestType}"/>
  <c:param name="keyword" value="${search.keyword}"/>
</c:url>
<section class="page-head">
  <p class="eyebrow">Stock</p>
  <h1>입출고 요청</h1>
  <p class="form-lead">대기 요청만 승인하거나 거절합니다. 행을 누르면 요청 전체를 봅니다.</p>
  <div class="hero-actions">
    <a class="btn ${search.status eq 'WAIT' ? '' : 'btn-ghost'}" href="${reqWait}">대기</a>
    <a class="btn ${search.status eq 'ALL' ? '' : 'btn-ghost'}" href="${reqAll}">전체</a>
    <a class="btn ${search.status eq 'APPROVE' ? '' : 'btn-ghost'}" href="${reqApprove}">승인</a>
    <a class="btn ${search.status eq 'REJECT' ? '' : 'btn-ghost'}" href="${reqReject}">거절</a>
  </div>
</section>
<form class="filter" method="get" action="${pageContext.request.contextPath}/admin/stock/request">
  <input type="hidden" name="status" value="${search.status}">
  <label>유형
    <select name="requestType">
      <option value="">전체</option>
      <option value="IN" ${search.requestType eq 'IN' ? 'selected' : ''}>입고</option>
      <option value="OUT" ${search.requestType eq 'OUT' ? 'selected' : ''}>출고</option>
    </select>
  </label>
  <label>검색
    <input type="text" name="keyword" value="${search.keyword}" placeholder="요청자·코드·품목명">
  </label>
  <div class="filter-side">
    <button class="btn" type="submit">조회</button>
  </div>
</form>
<div class="batch-bar">
  <button class="btn" type="button" id="batchApprove">선택 승인</button>
  <button class="btn btn-ghost" type="button" id="batchReject">선택 거절</button>
</div>
<div class="table-wrap">
<table class="data data-request">
  <thead>
    <tr>
      <th class="col-check"><input type="checkbox" id="checkAll"></th>
      <th class="col-date nowrap">일시</th>
      <th class="col-member nowrap">요청자</th>
      <th class="col-type nowrap">유형</th>
      <th class="col-goods">품목</th>
      <th class="col-wh nowrap">창고</th>
      <th class="col-qty nowrap">수량</th>
      <th class="col-status nowrap">상태</th>
      <th class="col-act nowrap"></th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="r" items="${list}">
      <c:choose>
        <c:when test="${r.requestType eq 'IN'}"><c:set var="typeLabel" value="입고"/></c:when>
        <c:when test="${r.requestType eq 'OUT'}"><c:set var="typeLabel" value="출고"/></c:when>
        <c:otherwise><c:set var="typeLabel" value="${r.requestType}"/></c:otherwise>
      </c:choose>
      <c:choose>
        <c:when test="${r.status eq 'WAIT'}"><c:set var="statusLabel" value="대기"/></c:when>
        <c:when test="${r.status eq 'APPROVE'}"><c:set var="statusLabel" value="승인"/></c:when>
        <c:when test="${r.status eq 'REJECT'}"><c:set var="statusLabel" value="거절"/></c:when>
        <c:when test="${r.status eq 'CANCEL'}"><c:set var="statusLabel" value="취소"/></c:when>
        <c:otherwise><c:set var="statusLabel" value="${r.status}"/></c:otherwise>
      </c:choose>
      <fmt:formatDate value="${r.requestDate}" pattern="yyyy-MM-dd HH:mm" var="reqDate"/>
      <fmt:formatDate value="${r.requestDate}" pattern="MM-dd HH:mm" var="reqDateShort"/>
      <fmt:formatDate value="${r.processDate}" pattern="yyyy-MM-dd HH:mm" var="procDate"/>
      <c:set var="goodsLabel" value="${r.goodsCode} · ${r.goodsName}"/>
      <tr class="req-row ${r.requestType eq 'OUT' and r.status eq 'WAIT' and r.stockQty lt r.qty ? 'low' : ''}"
        data-date="${fn:escapeXml(reqDate)}"
        data-member="${fn:escapeXml(r.memberId)}"
        data-type="${fn:escapeXml(typeLabel)}"
        data-goods="${fn:escapeXml(goodsLabel)}"
        data-warehouse="${fn:escapeXml(r.warehouseName)}"
        data-qty="${r.qty}"
        data-status="${fn:escapeXml(statusLabel)}"
        data-memo="${fn:escapeXml(r.memo)}"
        data-stock="${r.requestType eq 'OUT' and r.status eq 'WAIT' ? r.stockQty : ''}"
        data-process="${fn:escapeXml(procDate)}"
        data-admin="${fn:escapeXml(r.processMemberId)}">
        <td class="col-check">
          <c:if test="${r.status eq 'WAIT'}">
            <input type="checkbox" class="req-check" value="${r.requestNo}">
          </c:if>
        </td>
        <td class="col-date nowrap">${reqDateShort}</td>
        <td class="col-member nowrap">${r.memberId}</td>
        <td class="col-type nowrap">${typeLabel}</td>
        <td class="col-goods" title="${fn:escapeXml(goodsLabel)}">${goodsLabel}</td>
        <td class="col-wh nowrap">${r.warehouseName}</td>
        <td class="col-qty nowrap">${r.qty}</td>
        <td class="col-status nowrap">${statusLabel}</td>
        <td class="col-act nowrap">
          <c:if test="${r.status eq 'WAIT'}">
            <div class="row-actions">
              <button class="btn" type="button" data-act="approve" data-no="${r.requestNo}">승인</button>
              <button class="btn btn-ghost" type="button" data-act="reject" data-no="${r.requestNo}">거절</button>
            </div>
          </c:if>
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty list}">
      <tr><td colspan="9">요청이 없습니다.</td></tr>
    </c:if>
  </tbody>
</table>
</div>
<div class="modal" id="reqDetailModal" hidden>
  <div class="modal-back"></div>
  <div class="modal-box modal-box-wide" role="dialog" aria-modal="true">
    <h2 class="modal-title">요청 상세</h2>
    <dl class="detail-list">
      <div><dt>일시</dt><dd id="rdDate"></dd></div>
      <div><dt>요청자</dt><dd id="rdMember"></dd></div>
      <div><dt>유형</dt><dd id="rdType"></dd></div>
      <div><dt>품목</dt><dd id="rdGoods"></dd></div>
      <div><dt>창고</dt><dd id="rdWarehouse"></dd></div>
      <div id="rdStockRow" hidden><dt>현재고</dt><dd id="rdStock"></dd></div>
      <div><dt>수량</dt><dd id="rdQty"></dd></div>
      <div><dt>상태</dt><dd id="rdStatus"></dd></div>
      <div><dt>메모</dt><dd id="rdMemo"></dd></div>
      <div id="rdProcessRow" hidden><dt>처리</dt><dd id="rdProcess"></dd></div>
    </dl>
    <button class="btn" type="button" id="reqDetailOk">확인</button>
  </div>
</div>
<script>
var ctx = "${pageContext.request.contextPath}";

function selectedNos() {
  return $(".req-check:checked").map(function () {
    return this.value;
  }).get();
}

$("#checkAll").on("change", function () {
  $(".req-check").prop("checked", this.checked);
});

$(".row-actions .btn").on("click", function () {
  var $btn = $(this);
  var no = $btn.data("no");
  var act = $btn.data("act");
  var url = act === "approve" ? ctx + "/admin/stock/request/approve" : ctx + "/admin/stock/request/reject";
  $.post(url, { requestNo: no })
    .done(function (msg) {
      if (msg === "ok") {
        location.reload();
        return;
      }
      StockModal.open(act === "approve"
        ? "승인에 실패했습니다. 출고 요청이면 해당 창고 재고가 부족한지 확인하세요."
        : "거절에 실패했습니다.");
    });
});

function runBatch(url) {
  var nos = selectedNos();
  if (nos.length === 0) {
    StockModal.open("처리할 요청을 선택하세요.");
    return;
  }
  $.ajax({
    url: url,
    type: "POST",
    traditional: true,
    data: { requestNo: nos }
  }).done(function (body) {
      var ok = body && body.ok ? body.ok : 0;
      var fail = body && body.fail ? body.fail : 0;
      StockModal.open(ok + "건 처리, " + fail + "건 실패", {
        onClose: function () {
          location.reload();
        }
      });
    });
}

$("#batchApprove").on("click", function () {
  runBatch(ctx + "/admin/stock/request/approveBatch");
});
$("#batchReject").on("click", function () {
  runBatch(ctx + "/admin/stock/request/rejectBatch");
});

function closeReqDetail() {
  $("#reqDetailModal").prop("hidden", true);
}

$(".data-request tbody").on("click", "tr.req-row", function (e) {
  if ($(e.target).closest("input, button, .row-actions").length) {
    return;
  }
  var $tr = $(this);
  $("#rdDate").text($tr.attr("data-date") || "-");
  $("#rdMember").text($tr.attr("data-member") || "-");
  $("#rdType").text($tr.attr("data-type") || "-");
  $("#rdGoods").text($tr.attr("data-goods") || "-");
  $("#rdWarehouse").text($tr.attr("data-warehouse") || "-");
  $("#rdQty").text($tr.attr("data-qty") || "-");
  $("#rdStatus").text($tr.attr("data-status") || "-");
  $("#rdMemo").text($tr.attr("data-memo") || "-");
  var stock = $tr.attr("data-stock");
  if (stock !== "") {
    $("#rdStock").text(stock);
    $("#rdStockRow").prop("hidden", false);
  } else {
    $("#rdStockRow").prop("hidden", true);
  }
  var process = $tr.attr("data-process");
  var admin = $tr.attr("data-admin");
  if (process || admin) {
    $("#rdProcess").text((process || "") + (admin ? " · " + admin : ""));
    $("#rdProcessRow").prop("hidden", false);
  } else {
    $("#rdProcessRow").prop("hidden", true);
  }
  $("#reqDetailModal").prop("hidden", false);
});

$("#reqDetailOk, #reqDetailModal .modal-back").on("click", closeReqDetail);
$(document).on("keydown", function (e) {
  if (e.key === "Escape") {
    closeReqDetail();
  }
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
