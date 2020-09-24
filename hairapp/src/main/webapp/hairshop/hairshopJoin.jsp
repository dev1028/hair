<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hairshopJoin</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="hairshopJoin-font.min.css">
<link rel="stylesheet" href="hairshopJoin.css">
</head>
<body>
	<div class="main">

		<!-- Sign up form -->
		<div class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">헤어샵 회원가입</h2>
						<form method="POST" class="register-form" id="register-form" action="${pageContext.request.contextPath}/ajax/hairshopJoinPre.do">
							<div class="form-group">
								<label for="hs_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="hs_name" id="hs_name"
									placeholder="헤어샵 이름을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="hs_comp_no"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name=hs_comp_no id="hs_comp_no"
									placeholder="사업자번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="hs_owner"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="hs_owner" id="hs_owner"
									placeholder="대표자명을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="hs_tel"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="hs_tel" id="hs_tel"
									placeholder="전화번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="hs_email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="hs_email" id="hs_email"
									placeholder="이메일을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="hs_pw"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="hs_pw" id="hs_pw"
									placeholder="비밀번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" id="re_pass" placeholder="비밀번호 확인" />
							</div>
							<!--   <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div> -->
							
							<div>
								<button class="btn btn-primary">회원가입</button>
							</div>
						</form>
					</div>
					<br>
					<div class="signup-image">
						<figure>
							<img src="../images/hairshop/signin-image.jpg"
								alt="sing in image">
						</figure>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script src="hairshopJoin.js"></script>
</body>
</html>