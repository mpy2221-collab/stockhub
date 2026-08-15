<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="page-head">
  <p class="eyebrow">Admin</p>
  <h1>대시보드</h1>
  <p class="form-lead">재고 현황과 최근 입출고, 대기 요청을 한눈에 봅니다.</p>
</section>
<div class="stat-grid">
  <section class="stat-card">
    <p class="label">품목</p>
    <p class="num">${summary.goodsCount}</p>
  </section>
  <section class="stat-card">
    <p class="label">창고</p>
    <p class="num">${summary.warehouseCount}</p>
  </section>
  <section class="stat-card">
    <p class="label">카테고리</p>
    <p class="num">${summary.categoryCount}</p>
  </section>
  <section class="stat-card">
    <p class="label">회원</p>
    <p class="num">${summary.memberCount}</p>
  </section>
  <section class="stat-card">
    <p class="label">총 재고</p>
    <p class="num">${summary.totalStockQty}</p>
  </section>
  <section class="stat-card">
    <p class="label">안전재고 미달</p>
    <p class="num">${summary.lowStockCount}</p>
  </section>
  <section class="stat-card">
    <p class="label">오늘 입출고</p>
    <p class="num">${summary.todayInOutQty}</p>
  </section>
  <section class="stat-card">
    <p class="label">이번달 입출고</p>
    <p class="num">${summary.monthInOutQty}</p>
  </section>
  <section class="stat-card">
    <p class="label">대기 요청</p>
    <p class="num">${summary.waitRequestCount}</p>
  </section>
</div>

<div class="chart-grid">
  <section class="chart-card">
    <h2>월별 입출고 추이</h2>
    <canvas id="chartMonth"></canvas>
  </section>
  <section class="chart-card">
    <h2>창고별 재고</h2>
    <canvas id="chartWarehouse"></canvas>
  </section>
  <section class="chart-card">
    <h2>카테고리 비율</h2>
    <canvas id="chartCategory"></canvas>
  </section>
  <section class="chart-card">
    <h2>출고 상위 품목</h2>
    <canvas id="chartTopOut"></canvas>
  </section>
</div>

<section class="dash-block">
  <h2>안전재고 미달</h2>
  <div class="table-wrap">
  <table class="data">
    <thead>
      <tr>
        <th>코드</th>
        <th>품목명</th>
        <th>합계</th>
        <th>안전재고</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="g" items="${lowList}">
        <tr class="low">
          <td>
            <a href="${pageContext.request.contextPath}/goods/view?goodsNo=${g.goodsNo}">${g.goodsCode}</a>
          </td>
          <td>${g.goodsName}</td>
          <td>${g.totalQty}</td>
          <td>${g.safetyQty}</td>
        </tr>
      </c:forEach>
      <c:if test="${empty lowList}">
        <tr><td colspan="4">미달 품목이 없습니다.</td></tr>
      </c:if>
    </tbody>
  </table>
  </div>
</section>

<section class="dash-block">
  <h2>최근 이력</h2>
  <div class="table-wrap">
  <table class="data">
    <thead>
      <tr>
        <th>일시</th>
        <th>유형</th>
        <th>품목</th>
        <th>창고</th>
        <th>수량</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="h" items="${recentList}">
        <tr>
          <td><fmt:formatDate value="${h.historyDate}" pattern="yyyy-MM-dd HH:mm"/></td>
          <td>
            <c:choose>
              <c:when test="${h.historyType eq 'IN'}">입고</c:when>
              <c:when test="${h.historyType eq 'OUT'}">출고</c:when>
              <c:when test="${h.historyType eq 'ADJUST'}">조정</c:when>
              <c:otherwise>${h.historyType}</c:otherwise>
            </c:choose>
          </td>
          <td>${h.goodsCode} · ${h.goodsName}</td>
          <td>${h.warehouseName}</td>
          <td>${h.qty}</td>
        </tr>
      </c:forEach>
      <c:if test="${empty recentList}">
        <tr><td colspan="5">이력이 없습니다.</td></tr>
      </c:if>
    </tbody>
  </table>
  </div>
</section>

<section class="dash-block">
  <div class="row-head">
    <h2>대기 요청</h2>
    <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/stock/request?status=WAIT">더보기</a>
  </div>
  <div class="table-wrap">
  <table class="data">
    <thead>
      <tr>
        <th>요청자</th>
        <th>품목</th>
        <th>창고</th>
        <th>수량</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="r" items="${waitList}">
        <tr>
          <td>${r.memberId}</td>
          <td>${r.goodsCode} · ${r.goodsName}</td>
          <td>${r.warehouseName}</td>
          <td>${r.qty}</td>
        </tr>
      </c:forEach>
      <c:if test="${empty waitList}">
        <tr><td colspan="4">대기 요청이 없습니다.</td></tr>
      </c:if>
    </tbody>
  </table>
  </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
var ctx = "${pageContext.request.contextPath}";
var accent = "#0f766e";
var outColor = "#b42318";
var palette = ["#0f766e", "#0d9488", "#14b8a6", "#334155", "#64748b"];

function emptyChart(id) {
  $("#" + id).replaceWith('<p class="empty">데이터가 없습니다.</p>');
}

function hasValues(arr) {
  return arr && arr.length > 0;
}

$.getJSON(ctx + "/admin/dashboard/chart")
  .done(function (data) {
    if (hasValues(data.monthLabels)) {
      new Chart(document.getElementById("chartMonth"), {
        type: "line",
        data: {
          labels: data.monthLabels,
          datasets: [
            { label: "입고", data: data.monthIn, borderColor: accent, backgroundColor: "rgba(15,118,110,0.12)", tension: 0.25, fill: true },
            { label: "출고", data: data.monthOut, borderColor: outColor, backgroundColor: "rgba(180,35,24,0.08)", tension: 0.25, fill: true }
          ]
        },
        options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { position: "bottom" } } }
      });
    } else {
      emptyChart("chartMonth");
    }
    if (hasValues(data.warehouseLabels)) {
      new Chart(document.getElementById("chartWarehouse"), {
        type: "bar",
        data: {
          labels: data.warehouseLabels,
          datasets: [{ label: "재고", data: data.warehouseValues, backgroundColor: accent }]
        },
        options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { display: false } } }
      });
    } else {
      emptyChart("chartWarehouse");
    }
    if (hasValues(data.categoryLabels)) {
      new Chart(document.getElementById("chartCategory"), {
        type: "doughnut",
        data: {
          labels: data.categoryLabels,
          datasets: [{ data: data.categoryValues, backgroundColor: palette }]
        },
        options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { position: "bottom" } } }
      });
    } else {
      emptyChart("chartCategory");
    }
    if (hasValues(data.topOutLabels)) {
      new Chart(document.getElementById("chartTopOut"), {
        type: "bar",
        data: {
          labels: data.topOutLabels,
          datasets: [{ label: "출고", data: data.topOutValues, backgroundColor: "#0d9488" }]
        },
        options: {
          indexAxis: "y",
          responsive: true,
          maintainAspectRatio: false,
          plugins: { legend: { display: false } }
        }
      });
    } else {
      emptyChart("chartTopOut");
    }
  })
  .fail(function () {
    emptyChart("chartMonth");
    emptyChart("chartWarehouse");
    emptyChart("chartCategory");
    emptyChart("chartTopOut");
  });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
