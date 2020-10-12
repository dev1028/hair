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
<style>
</style>
<script>
	$(function() {
		$("#btn").on("click", function() {
			if ($("#search").val() == "") {
				alert("디자이너를 입력하세요");
			} else {
				$("#frm").submit();
			}
		});
	});
</script>
<body>
	<div class="container">
		<div class="row">
			<br> <br> <br>
		</div>
		<div class="row">
			<h3>시술완료고객</h3>
		</div>

		<form id="frm"
			action="${pageContext.request.contextPath}/hairshop/hairshopProcedureFinishSD.do"
			method="post">
			<div align="right">
				<input type="text" id="search" name="search" placeholder="디자이너명 입력">
				<button type="button" id="btn" class="btn btn-primary">검색</button>
			</div>
		</form>
		<br>
		<table>
			<thead>
				<tr>
					<td>예약일자</td>
					<td>예약번호</td>
					<td>회원이름</td>
					<td>헤어번호</td>
					<td>시술이름</td>
					<td>디자이너번호</td>
					<td>디자이너이름</td>
					<td>헤어가격</td>
					<td>상세정보</td>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="f">
					<tr>
						<td>${f.mdr_date}</td>
						<td>${f.mdr_no}</td>
						<td>${f.mem_name }</td>
						<td>${f.hhi_no }</td>
						<td>${f.hhi_name }</td>
						<td>${f.designer_no }</td>
						<td>${f.designer_name }</td>
						<td>${f.hhi_price }원</td>
						<td><a href="${pageContext.request.contextPath}/hairshop/hairInfoDetail.do?hhi_no=${f.hhi_no}"
								 class="btn btn-secondary btn-sm">상세보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <br>
		<div align="center">
			<button id="btn" onclick="${pageContext.request.contextPath}/hairshop/hairshopMain.do'" type="button" class="btn btn-primary">Home</button>
		</div>
	</div>
</body>
</html>