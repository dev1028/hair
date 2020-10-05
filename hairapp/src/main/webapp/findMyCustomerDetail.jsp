<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					action="${pageContext.request.contextPath}/designer/findMyCustomer.do"
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

		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<strong>예약자를 검색하세요.</strong> 이름이나 전화번호를 통해 예약자 정보를 조회 할 수 있습니다.
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>


		<div class="row justify-content-md-center">
			<div class="col-6">
				<h4>
					예약정보 <span class="badge badge-pill badge-primary">예약중</span>
				</h4>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"></li>
					<li class="list-group-item"></li>
					<li class="list-group-item"></li>
					<li class="list-group-item"></li>
					<li class="list-group-item"></li>
				</ul>
			</div>
		</div>
		<hr>
		<div class="row justify-content-md-center">
			<div class="card" style="width: 18rem;">
				<img src="../images/hairshop/san.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>

		</div>
		<hr>
		<div class="row justify-content-md-center">
			<div class="col-6">
				<h4>매출정보</h4>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">Cras justo odio</li>
					<li class="list-group-item">Dapibus ac facilisis in</li>
					<li class="list-group-item">Morbi leo risus</li>
					<li class="list-group-item">Porta ac consectetur ac</li>
					<li class="list-group-item">Vestibulum at eros</li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>