<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<br>
			<br>
			<br>
		</div>
		<div class="py-5 text-center">
			<h2>시술명 신청</h2>
			<p class="lead">
				중분류 시술명을 신청합니다.
			</p>
		</div>

		<div class="row">

			<div class="col-md justify-content-md-center">
				<form class="needs-validation" id="hairinfoInsertFrm" 
				action="${pageContext.request.contextPath}/hairshop/hairNameRequest.do" method="post"
				enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="tmac_no">대분류 <span class="badge badge-pill badge-danger">필수</span></label> 
							<select class="custom-select d-block w-100" id="tmac_no" name="tmac_no" required>
								<option value="">선택하세요.</option>
								<c:forEach items="${tmacList}" var="tmac">
									<option value="${tmac.tmac_no}">${tmac.tmac_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-3 mb-3">
							<label for="tmic_no">중분류<span class="badge badge-pill badge-danger">필수</span></label> 
							<input type='text' class="custom-select d-block w-100" id="tmic_name" name="tmic_name" required>
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="tmic_explication">설명<span class="badge badge-pill badge-danger">필수</span></label> 
							<input type='text' class="custom-select d-block w-100" id="tmic_explication" name="tmic_explication" required>
						</div>
					</div>
				
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">등록 요청</button>
				</form>
			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2017-{{ site.time | date: "%Y" }} Company
				Name</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">Support</a></li>
			</ul>
		</footer>
	</div>
	<hr>
</body>
</html>