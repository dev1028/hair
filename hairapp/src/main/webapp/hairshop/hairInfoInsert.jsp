<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<br> <br> <br>
		</div>
		<div class="row justify-content-between">
			<div class="col-4">
				<h3>헤어정보등록</h3>
			</div>
			<div class="col-6">
				<form id="searchCustomerFrm"
					action="${pageContext.request.contextPath}/hairshop/hsFindMyCustomer.do"
					method="post">
					<div class="input-group flex-nowrap">
						<div class="input-group-prepend">
							<select name="divisionSearch">
								<option value="name">시술분류</option>
								<option value="tel">시술명</option>
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

		<div class="row justify-content-md-center">
			<div class="col-6">
				
				<ul class="list-group list-group-flush">
					<li class="list-group-item">시술분류명: <input type="text"></li>
					<li class="list-group-item">시술선택명: <strong>${hair.tmic_name}</strong></li>
					<li class="list-group-item">시술표기명: <input type="text"></li>
					<li class="list-group-item">가격: <input type="text">원</li>
					<li class="list-group-item">기본시술시간: <select><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select>시간</li>
				</ul>
				<c:if test="${hair.hhi_status == '0'}">
					<button class="btn btn-success btn-block" id="btnstatus"
						data-no="${hair.hhi_no}" data-status="1" type="button">사용하기</button>
				</c:if>
				<c:if test="${hair.hhi_status == '1'}">
					<button class="btn btn-danger btn-block" type="button"
						id="btnstatus" data-status="0" data-no="${hair.hhi_no}">사용중단</button>
				</c:if>
			</div>
		</div>
		<hr>
		<div class="row justify-content-md-center">
			<div class="bxslider" id="imgList">
				<div>
					<img src="../images/hairshop/san.jpg">
				</div>
			</div>
		</div>
		<hr>
		<div class="row justify-content-md-center">
			<div class="col-2">
				<h5>헤어사진 업로드</h5>
			</div>
			<div class="col-sm">
				<form>
					<div class="input-group">
						<div class="custom-file">
							<input type="file" class="custom-file-input"
								id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">
							<label class="custom-file-label" for="inputGroupFile04">Choose
								file</label>
						</div>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="inputGroupFileAddon04">업로드</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>