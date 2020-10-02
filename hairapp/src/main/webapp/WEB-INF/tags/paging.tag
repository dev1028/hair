<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.yedam.hairshop.common.Paging" %>
<%@ attribute name="jsfunc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagination">

<c:if test="${paging.page != paging.startPage}">
<a href="javascript:${jsfunc}(${paging.page-1})">이전</a>
</c:if>
<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<a href="javascript:${jsfunc}(${i})">${i}</a>
	</c:if>
	<c:if test="${i == paging.page}">
		<a class="active">${i}</a>
	</c:if>
</c:forEach>

<c:if test="${paging.page != paging.endPage}">
<a href="javascript:${jsfunc}(${paging.page+1})">다음</a>
</c:if>

</div>