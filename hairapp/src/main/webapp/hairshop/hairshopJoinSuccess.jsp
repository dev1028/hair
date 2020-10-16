<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
		<br>
		<br>
		<br>
		<hr>
		</div>
		<div class="row">
			<div class="col">
				<h4>회원가입완료!</h4>
				<span>우동서비스를 가입해주셔서 진심으로 감사합니다.</span><br> <span>보다 나은
					서비스를 제공하기 위해 곧 관리자가 연락을 드릴것입니다.</span><br>
				<hr>
				<span>우동은 고객님들의 의견을 적극 반영해 불필요한 연락을 줄이고자 합니다.</span><br> <span>그러기
					위해 본인의 이메일이 맞는지 확인을 해야합니다.</span><br> <span>가입정보와 실제 사업자정보가
					불일치 할 경우 언제든 가입이 취소될 수 있습니다.</span>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<hr>
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/ajax/hairshopReturnToLogin.do">로그인</a>
			</div>
		</div>
	</div>
</body>
</html>