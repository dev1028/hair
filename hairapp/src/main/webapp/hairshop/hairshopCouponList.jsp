<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="hairshopCoupon.css">
<style>

</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<br> <br> <br> <br>
		</div>
		<div class="row">
			<h3>Coupon List</h3>
		</div>
	
		<hr>
		<table>
			<thead>
				<tr>
					<th scope="col">쿠폰번호</th>
					<th scope="col">미용실번호</th>
					<th scope="col">쿠폰발급생성일</th>
					<th scope="col">쿠폰발급만료일</th>
					<th scope="col">쿠폰개수</th>
					<th scope="col">할인율(%)</th>
					<th scope="col">최대할인금액</th>
					<th scope="col">쿠폰명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="coupon">
					<tr>
						<td data-label="Account">${coupon.hsc_no }</td>
						<td data-label="Due Date">${coupon.hs_no }</td>
						<td data-label="Amount">${coupon.hsc_issuedate }</td>
						<td data-label="Period">${coupon.hsc_expiredate }</td>
						<td>${coupon.hsc_coupon_quantity }</td>
						<td>${coupon.hsc_discount_rate }</td>
						<td>${coupon.hsc_maxdiscount_pay }</td>
						<td>${coupon.hsc_name}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<!-- 페이징 -->
		<br><br>
		<form method="post" name="frm" id="frm">
			<input type="hidden" name="p" value="1">
			<!-- value에는 페이지번호 적었음 -->
			<div class ="row justify-content-md-center" id="paging">
				<my:paging paging="${paging}" jsfunc="gopage" />
			</div>
		</form>
		<!-- 페이징끝 -->
	
			<script>
				function gopage(p) {
					frm.p.value = p;
					frm.submit();
					//location.href="deptSelectAll?p=" + p;
				}
			</script>
	
		<!-- <div class="row justify-content-md-center">
		
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item "><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
			</div> -->
</body>
</html>