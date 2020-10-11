<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어시술목록</title>
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
			<div class="col-4">
				<h3>헤어목록 리스트</h3>
			</div>
			<div class="col-6">
				<form id="searchCustomerFrm"
					action="${pageContext.request.contextPath}/hairshop/hairInfoList.do"
					method="post">
					<div class="input-group flex-nowrap">
						<div class="input-group-prepend">
							<select name="divisionSearch">
								<option value="hhi_name">시술명</option>
								<option value="tmac_name">시술분류</option>
							</select>
						</div>
						<input type="text" class="form-control"
							placeholder="시술분류나 시술명을 입력하세요." id="inputSearch"
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
		<c:if test="${empty hairList && empty hairNotFound}">
			<div class="alert alert-warning alert-dismissible fade show"
				role="alert">
				<strong>시술명을 검색하세요.</strong> 시술명이나 시술분류를 통해  시술정보를 조회 할 수 있습니다.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<c:if test="${empty hairList && hairNotFound == 0}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<strong>존재하지 않는 시술입니다.</strong> 시술명이나 시술분류를 정확하게 입력하세요.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">헤어번호</th>
							<th scope="col">시술분류명</th>
							<th scope="col">시술명</th>
							<th scope="col">가격</th>
							<th scope="col">시간</th>
							<th scope="col">사용여부</th>
							<th scope="col">상세정보</th>
						</tr>
					</thead>
					<tbody>
				<c:if test="${!empty hairList && hairNotFound != 0}">
						<c:forEach items="${hairList}" var="hair">
							<tr>
								<th scope="row">#${hair.hhi_no}</th>
								<td>${hair.tmac_name}</td>
								<td>${hair.hhi_name}</td>
								<td>${hair.hhi_price}</td>
								<td>${hair.hhi_time}</td>
								<td><c:if test="${hair.hhi_status == '1'}"><span class="badge badge-pill badge-success">사용</span></c:if>
									<c:if test="${hair.hhi_status == '0'}"><span class="badge badge-pill badge-danger">미사용</span></c:if>
								</td>
								<td><a
									href="${pageContext.request.contextPath}/hairshop/hairInfoDetail.do?hhi_no=${hair.hhi_no}"
									class="btn btn-secondary btn-sm">상세보기</a></td>
							</tr>
						</c:forEach>
				</c:if>
				<c:if test="${empty hairList && hairNotFound == 0}">
					<tr><td colspan="7" class="text-center">시술정보가 없습니다.</td></tr>
				</c:if>
				<c:if test="${empty hairList && hairNotFound == 1}">
					<tr><td colspan="7" class="text-center">시술정보가 아직 없습니다. 등록이 필요합니다.</td></tr>
				</c:if>
					</tbody>
				</table>
			</div>
	</div>
</body>
</html>