<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="home-banner">
  <div>
    <p class="eyebrow">Home</p>
    <h1>안녕하세요, ${loginMember.memberName} 님! 오늘도 안전하게 재고를 관리해보세요.</h1>
    <p class="home-meta">
      <c:choose>
        <c:when test="${loginMember.memberLevel eq 1}">
          <span class="grade-tag grade-admin">시스템 관리자</span>
        </c:when>
        <c:otherwise>
          <span class="grade-tag">일반 회원</span>
        </c:otherwise>
      </c:choose>
      <span class="home-date">${todayLabel}</span>
    </p>
  </div>
</section>

<div class="stat-grid">
  <a class="stat-card" href="${pageContext.request.contextPath}/goods/list">
    <p class="label">전체 품목 수</p>
    <p class="num">${totalGoodsCount}</p>
  </a>
  <c:if test="${loginMember.memberLevel ne 1}">
    <a class="stat-card" href="${pageContext.request.contextPath}/stock/request/list">
      <p class="label">내 대기 중인 요청</p>
      <p class="num">${myWaitRequestCount}</p>
    </a>
  </c:if>
  <a class="stat-card warn" href="${pageContext.request.contextPath}/goods/list?lowStock=Y">
    <p class="label">안전재고 미달 품목</p>
    <p class="num">${lowStockCount}</p>
  </a>
  <c:if test="${loginMember.memberLevel ne 1}">
    <a class="stat-card" href="${pageContext.request.contextPath}/stock/request/list">
      <p class="label">이번 달 승인 완료</p>
      <p class="num">${myMonthApprovedCount}</p>
    </a>
  </c:if>
</div>

<section class="home-actions">
  <a class="home-action" href="${pageContext.request.contextPath}/goods/list">
    <strong>재고 조회하기</strong>
    <span>전체 품목 수량과 위치를 확인합니다.</span>
  </a>
  <c:if test="${loginMember.memberLevel ne 1}">
    <a class="home-action" href="${pageContext.request.contextPath}/stock/requestFrm">
      <strong>입/출고 요청 작성</strong>
      <span>신규 입고 또는 출고를 신청합니다.</span>
    </a>
    <a class="home-action" href="${pageContext.request.contextPath}/stock/request/list">
      <strong>내 요청 이력 확인</strong>
      <span>신청 내역의 처리 상태를 봅니다.</span>
    </a>
  </c:if>
  <c:if test="${loginMember.memberLevel eq 1}">
    <a class="home-action" href="${pageContext.request.contextPath}/admin/dashboard">
      <strong>관리자 센터</strong>
      <span>재고 현황과 승인 업무로 이동합니다.</span>
    </a>
  </c:if>
</section>

<div class="home-split ${loginMember.memberLevel eq 1 ? 'home-split-one' : ''}">
  <c:if test="${loginMember.memberLevel ne 1}">
  <section class="dash-block">
    <div class="row-head">
      <h2>최근 내 입/출고 요청</h2>
      <a href="${pageContext.request.contextPath}/stock/request/list">더보기</a>
    </div>
    <div class="table-wrap">
    <table class="data">
      <thead>
        <tr>
          <th>요청일시</th>
          <th>유형</th>
          <th>품목명</th>
          <th>수량</th>
          <th>상태</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="r" items="${recentMyRequests}">
          <tr>
            <td><fmt:formatDate value="${r.requestDate}" pattern="yyyy-MM-dd HH:mm"/></td>
            <td>
              <c:choose>
                <c:when test="${r.requestType eq 'IN'}">입고</c:when>
                <c:otherwise>출고</c:otherwise>
              </c:choose>
            </td>
            <td>${r.goodsName}</td>
            <td>${r.qty}</td>
            <td>
              <c:choose>
                <c:when test="${r.status eq 'WAIT'}"><span class="tag tag-wait">대기</span></c:when>
                <c:when test="${r.status eq 'APPROVE'}"><span class="tag tag-ok">승인</span></c:when>
                <c:when test="${r.status eq 'REJECT'}"><span class="tag tag-no">거절</span></c:when>
                <c:when test="${r.status eq 'CANCEL'}"><span class="tag tag-off">취소</span></c:when>
                <c:otherwise>${r.status}</c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty recentMyRequests}">
          <tr><td colspan="5">최근 요청이 없습니다.</td></tr>
        </c:if>
      </tbody>
    </table>
    </div>
  </section>
  </c:if>

  <section class="dash-block">
    <div class="row-head">
      <h2>안전재고 부족 품목</h2>
      <a href="${pageContext.request.contextPath}/goods/list?lowStock=Y">부족 품목 전체보기</a>
    </div>
    <div class="table-wrap">
    <table class="data">
      <thead>
        <tr>
          <th>품목코드</th>
          <th>품목명</th>
          <th>현재고</th>
          <th>안전재고</th>
          <c:if test="${loginMember.memberLevel ne 1}">
            <th>바로가기</th>
          </c:if>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="g" items="${lowStockList}">
          <tr class="low">
            <td>${g.goodsCode}</td>
            <td>${g.goodsName}</td>
            <td>${g.totalQty}</td>
            <td>${g.safetyQty}</td>
            <c:if test="${loginMember.memberLevel ne 1}">
              <td>
                <a class="btn-edit" href="${pageContext.request.contextPath}/stock/requestFrm?goodsNo=${g.goodsNo}">요청하기</a>
              </td>
            </c:if>
          </tr>
        </c:forEach>
        <c:if test="${empty lowStockList}">
          <tr><td colspan="${loginMember.memberLevel ne 1 ? 5 : 4}">미달 품목이 없습니다.</td></tr>
        </c:if>
      </tbody>
    </table>
    </div>
  </section>
</div>

<c:if test="${loginMember.memberLevel eq 1}">
  <section class="admin-home-bar">
    <p>현재 <strong>${waitRequestCount}</strong>개의 미처리 입출고 승인 요청이 대기 중입니다.</p>
    <div class="hero-actions">
      <a class="btn" href="${pageContext.request.contextPath}/admin/stock/request?status=WAIT">요청 승인하러 가기</a>
      <a class="btn btn-ghost" href="${pageContext.request.contextPath}/admin/dashboard">관리자 대시보드</a>
    </div>
  </section>
</c:if>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
