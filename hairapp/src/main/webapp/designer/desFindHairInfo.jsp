<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어시술 검색</title>
<script type="text/javascript">
$(function(){
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
					action="${pageContext.request.contextPath}/designer/desHairInfoList.do"
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
				<strong>시술명을 검색하세요.</strong> 시술명이나 시술분류를 통해 시술정보를 조회 할 수 있습니다.
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
</div>
</body>
</html>