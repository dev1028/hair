<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<br><br><br>
		</div>
		<div class="row">
			<h3>Coupon List</h3>
		</div>
		<table>
			<thead>
				<tr>
					<th scope="col">쿠폰번호</th>
					<th scope="col">쿠폰발급생성일</th>
					<th scope="col">쿠폰발급만료일</th>
					<th scope="col">쿠폰개수</th>
					<th scope="col">할인율</th>
					<th scope="col">최대할인금액</th>
					<th scope="col">쿠폰명</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td data-label="Account">Visa - 3412</td>
					<td data-label="Due Date">04/01/2016</td>
					<td data-label="Amount">$1,190</td>
					<td data-label="Period">03/01/2016 - 03/31/2016</td>
				</tr>
				<tr>
					<td scope="row" data-label="Account">Visa - 6076</td>
					<td data-label="Due Date">03/01/2016</td>
					<td data-label="Amount">$2,443</td>
					<td data-label="Period">02/01/2016 - 02/29/2016</td>
				</tr>
				<tr>
					<td scope="row" data-label="Account">Corporate AMEX</td>
					<td data-label="Due Date">03/01/2016</td>
					<td data-label="Amount">$1,181</td>
					<td data-label="Period">02/01/2016 - 02/29/2016</td>
				</tr>
				<tr>
					<td scope="row" data-label="Acount">Visa - 3412</td>
					<td data-label="Due Date">02/01/2016</td>
					<td data-label="Amount">$842</td>
					<td data-label="Period">01/01/2016 - 01/31/2016</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>