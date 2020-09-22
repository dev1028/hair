<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm ">
				<div>
					<div class="btn-group btn-group-toggle" data-toggle="buttons">

						<label class="btn btn-secondary active"> <input
							type="radio" name="options" id="option1" checked> 미용실
						</label> <label class="btn btn-secondary"> <input type="radio"
							name="options" id="option3"> 디자이너
						</label>

					</div>
				</div>
				<form id="hairshopLoginFrm" action="${pageContext.request.contextPath}/admin/adminLogin.do">
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="hs_email"> <small id="emailHelp"
							class="form-text text-muted">We'll never share your email
							with anyone else.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1" name="hs_pw">
					</div>
					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">이메일 저장</label>
					</div>
					<div>
						<button type="submit" class="btn btn-primary">로그인</button>
						<button type="button" class="btn btn-primary">회원가입</button>
					</div>
				</form>
				<div>
					<br> <a href="#">아이디/비밀번호 찾기</a>
				</div>
			</div>
			<div class="col-sm"></div>
		</div>
	</div>
</body>
</html>