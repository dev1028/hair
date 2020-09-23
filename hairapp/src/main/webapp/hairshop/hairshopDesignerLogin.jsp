<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<meta charset="UTF-8">
<title>hairshopDesignerLogin</title>
<script>
	$(function() {

	});
</script>
</head>
<body>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-auto">
				<h3>헤어샵/디자이너 로그인</h3>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-md-auto ">

				<div class="btn-group btn-group-toggle" data-toggle="buttons">

					<label class="btn btn-secondary active"> <input
						type="radio" name="options" id="option1" checked> 미용실
					</label> <label class="btn btn-secondary"> <input type="radio"
						name="options" id="option3"> 디자이너
					</label>

				</div>

			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-md-auto">
				<form id="hairshopLoginFrm"
					action="${pageContext.request.contextPath}/hairshop/hairshopDesignerLogin.do">
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="hs_email"> <small
							id="emailHelp" class="form-text text-muted">We'll never
							share your email with anyone else.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							name="hs_pw">
					</div>
					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">이메일 저장</label>
					</div>
					<div>
						<button type="submit" class="btn btn-primary">로그인</button>
						<a href="${pageContext.request.contextPath}/ajax/hairshopJoin.do"><button
								type="button" class="btn btn-primary" id="btnForHairshopJoin">회원가입</button></a>
					</div>
				</form>
				<br> <a href="#">아이디/비밀번호 찾기</a>
			</div>
		</div>

	</div>

</body>
</html>