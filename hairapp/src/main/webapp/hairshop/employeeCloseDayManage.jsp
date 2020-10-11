<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="hairshopCoupon.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

	<div class="container">
		<div class="row">
			<br> <br> <br>
		</div>
		<button class="button button1">미용실</button>
		<button class="button button2">디자이너</button>
		<div class="row">
			<h3>디자이너 관리</h3>
		</div>
		<br>


		<table>
			<thead>
				<tr>
					<th scope="row">직원번호</th>
					<th scope="row">직급</th>
					<th scope="row">성명</th>
					<th scope="row">전화번호</th>
					<th scope="row">입사일</th>
					<th scope="row">휴무일</th>
				</tr>
			</thead>
			<tbody id="tbody" class="tbody">
				<c:forEach items="${emplist }" var="e">
					<tr id="${e.designer_no }">
						<td>${e.designer_no }</td>
						<td>${e.position }</td>
						<td>${e.designer_name }</td>
						<td>${e.designer_phone }</td>
						<td>${e.hire_date }</td>
						<td>${e.designer_dayoff }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<div>
		
	</div>
</body>
</html>