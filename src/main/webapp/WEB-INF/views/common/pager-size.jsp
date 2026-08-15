<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${totalCount gt 0}">
  <div class="pager-size-wrap">
    <div class="pager-size">
      <span>조회</span>
      <select id="pagerSize">
        <option value="10" ${pageSize eq 10 ? 'selected' : ''}>10개</option>
        <option value="20" ${pageSize eq 20 ? 'selected' : ''}>20개</option>
        <option value="30" ${pageSize eq 30 ? 'selected' : ''}>30개</option>
      </select>
    </div>
  </div>
  <script>
  $("#pagerSize").on("change", function () {
    location.href = "${pagerUrl}?page=1${pagerQuery}&size=" + this.value;
  });
  </script>
</c:if>
