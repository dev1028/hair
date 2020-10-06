<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약자찾기</title>
<script>
	$(function() {
		$("#searchCustomerBtn").on("click", function() {
			if ($("#inputSearch").val() == "") {
				alert("값을 입력해주세요");
			} else {
				$("#searchCustomerFrm").submit();
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<br> <br> <br>
		</div>
		<div class="row justify-content-between">
			<div class="col-2">
				<h3>예약자 찾기</h3>
			</div>
			<div class="col-5">
				<form id="searchCustomerFrm"
					action="${pageContext.request.contextPath}/hairshop/hsFindMyCustomer.do"
					method="post">
					<div class="input-group flex-nowrap">
						<div class="input-group-prepend">
							<select name="divisionSearch">
								<option value="name">이름</option>
								<option value="tel">전화번호</option>
							</select>
						</div>
						<input type="text" class="form-control"
							placeholder="이름 또는 전화번호를 입력하세요" id="inputSearch"
							name="inputSearch" aria-label="Username"
							aria-describedby="addon-wrapping">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="searchCustomerBtn">Search</button>
						</div>
					</div>
				</form>
			</div>

		</div>
		<hr>
		<c:if test="${empty customerList && empty customerNotFound}">
			<div class="alert alert-warning alert-dismissible fade show"
				role="alert">
				<strong>예약자를 검색하세요.</strong> 이름이나 전화번호를 통해 예약자 정보를 조회 할 수 있습니다.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<c:if test="${empty customerList && customerNotFound == 0}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<strong>존재하지 않는 예약자입니다.</strong> 이름이나 전화번호를 정확하게 입력하세요.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<c:if test="${!empty customerList}">
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">예약번호</th>
							<th scope="col">상태</th>
							<th scope="col">담당디자이너</th>
							<th scope="col">예약일자</th>
							<th scope="col">이름</th>
							<th scope="col">성별</th>
							<th scope="col">전화번호</th>
							<th scope="col">상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customerList}" var="cus">
							<tr>
								<th scope="row">${cus.mdr_no}</th>
								<td><c:if test="${cus.mdr_status eq 'i1'}">
										<span class="badge badge-pill badge-danger">예약취소</span>
									</c:if> <c:if test="${cus.mdr_status eq 'i2'}">
										<span class="badge badge-pill badge-success">예약중</span>
									</c:if> <c:if test="${cus.mdr_status eq 'i3'}">
										<span class="badge badge-pill badge-info">시술중</span>
									</c:if> <c:if test="${cus.mdr_status eq 'i4'}">
										<span class="badge badge-pill badge-secondary">시술완료</span>
									</c:if></td>
								<td>${cus.designer_name}</td>
								<td>${cus.mdr_date}</td>
								<td>${cus.mem_name}</td>
								<td><c:if test="${cus.mem_sex eq 'male'}">남자</c:if> <c:if
										test="${cus.mem_sex eq 'female'}">여자</c:if></td>
								<td>${cus.mem_phone}</td>
								<td><a
									href="${pageContext.request.contextPath}/hairshop/hsFindMyCustomerDetail.do?mdr_no=${cus.mdr_no}"
									class="btn btn-secondary btn-sm">상세보기</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>
</body>
</html>