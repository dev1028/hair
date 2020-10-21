<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시술선택명 신청</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<br>
			<br>
			<br>
		</div>
		<div class="py-5 text-center">
			<h2>시술선택명 신청</h2>
			<p class="lead">
				시술선택명을 신청합니다.
			</p>
		</div>

		<div class="row">
			<div class="col-md justify-content-md-center">
				<form class="needs-validation" id="hairinfoInsertFrm" 
				action="${pageContext.request.contextPath}/hairshop/hairNameRequest.do" method="post"
				enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="tmac_no">시술분류 <span class="badge badge-pill badge-danger">필수</span></label> 
							<select class="custom-select d-block w-100" id="tmac_no" name="tmac_no" required>
								<option value="">선택하세요.</option>
								<c:forEach items="${tmacList}" var="tmac">
									<option value="${tmac.tmac_no}">${tmac.tmac_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-3 mb-3">
							<label for="tmic_no">시술선택명<span class="badge badge-pill badge-danger">필수</span></label> 
							<input type='text' class="custom d-block w-100" id="tmic_name" name="tmic_name" required>
						</div>
						
						<div class="col-md-6 mb-3">
							<label for="tmic_explication">설명<span class="badge badge-pill badge-danger">필수</span></label> 
							<input type='text' class="custom d-block w-100" id="tmic_explication" name="tmic_explication" required>
						</div>
					</div>
				
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">등록 요청</button>
				</form>
			</div>
		</div>

		<div class="py-5 text-center">
			<h2>시술선택명 신청현황</h2>
		</div>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">시술분류</th>
					<th scope="col">시술선택명</th>
					<th scope="col">설명</th>
					<th scope="col">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reqList}" var="item" >
					<tr>
						<td>${item.tmac_name }</td>
						<td>${item.tmic_name}</td>
						<td>${item.tmic_explication}</td>
						<td>${item.tmic_status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">상호 : UDONG#  |  만든이 : 김린아, 김강산, 김승연, 이상민, 이송현<br>
			주소 : 대구 중구 국채보상로 537  |  git주소 : <a href="https://github.com/dev1028/hair" target="_blank">https://github.com/dev1028/hair</a><br>
			서비스 이용문의 및 서비스 제휴문의 : udong1023@gmail.com<br>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="${pageContext.request.contextPath}/admin/adminLogin.jsp">Admin</a></li>
				<li class="list-inline-item"><a href="${pageContext.request.contextPath}/ajax/hairshopReturnToLogin.do">Hairshop</a></li>
				<li class="list-inline-item"><a href="${pageContext.request.contextPath}/members/membersMain.do">Members</a></li>
			</ul>
					Copyright © UDONG#. All Rights Reserved.
		</footer>
	</div>
	
	
	
</body>
</html>