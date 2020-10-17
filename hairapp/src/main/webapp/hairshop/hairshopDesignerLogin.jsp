<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>우동 미용실/디자이너</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/cover/">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/locales-all.min.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

#toptop {
  width: 100%;
  height: 100%;
  text-align: center;
  position: relative;
  z-index: 1;
}
#toptop::after {
  width: 100%;
  height: 100%;
  content: "";
  background: url("${pageContext.request.contextPath}/images/hairshop/hairshopmain2.png");
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.9;
}

#hairshopCol, #desCol{
	background-color: rgba(108, 122, 137, 0.8);
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	
}
#rounddivforbtn{
background-color: rgba(108, 122, 137, 0.8);
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	
}
#realcover{
	background-color: rgba(108, 122, 137, 0.8);
	border-radius: 10px;
	padding-bottom: 10px;
	padding-top: 10px;
	padding-left: 20px;
	padding-right: 20px
}
</style>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/hairshop/hairshopDesignerLogin.css" rel="stylesheet">
<script>
$(function() {
	$("#designerLogin").on("change",function(){
		if(this.checked){
			$("#loginHairshop").attr("hidden", "hidden");
			$("#loginDesigner").attr("hidden", false);
		}
	});
	$("#hairshopLogin").on("change",function(){
		if(this.checked){
		$("#loginDesigner").attr("hidden", "hidden");
		$("#loginHairshop").attr("hidden", false);
		}
	});
});
</script>
</head>
<body class="text-center" id="toptop">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column"  >
		<header class="masthead mb-auto" id="realcover">
			<nav class="site-header sticky-top py-1">
		<div
			class="container d-flex flex-column flex-md-row justify-content-between">
			<a class="py-2" href="#" aria-label="Product"><svg
					xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="none" stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2" class="d-block mx-auto"
					role="img" viewBox="0 0 24 24" focusable="false">
					<title>Member</title><circle cx="12" cy="12" r="10" />
					<path
						d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94" /></svg>
			</a> <a class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/hairshopReturnToLogin.do">Home</a> <a
				class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/aboutUs.do">Among Us</a> <a
				class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/hairshopNotice.do">공지사항</a> <a
				class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/hairshopQna.do">QnA</a>
		</div>
	</nav>
		</header>

		<main role="main" class="inner cover" id="innercover">

			<div class="container">
				<div class="row justify-content-sm-center" >
					<div class="col-md-auto">
					</div>
				</div>
				<div class="row justify-content-sm-center">
					<div class="col-6" id="rounddivforbtn">
							
							<hr>
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							
							<label class="btn btn-secondary active"> <input
								type="radio" name="options" id="hairshopLogin" checked>
								미용실
							</label> <label class="btn btn-secondary"> <input type="radio"
								name="options" id="designerLogin"> 디자이너
							</label>

						</div>
					</div>
				</div>
				<div id="loginHairshop" class="row justify-content-sm-center">
					<div class="col-6" id="hairshopCol">
					<br>
						<h4>미용실</h4>
						<form id="hairshopLoginFrm"
							action="${pageContext.request.contextPath}/hairshop/hairshopDesignerLogin.do"
							method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="hs_email"> <small
									id="emailHelp" class="form-text text-warning">이메일을 입력해주세요.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="hs_pw">
							</div>
							<div>
								<button type="submit" class="btn btn-primary">	&nbsp; 로그인  &nbsp;</button>
								<a
									href="${pageContext.request.contextPath}/ajax/hairshopJoin.do"><button
										type="button" class="btn btn-secondary" id="btnForHairshopJoin">회원가입</button></a>
							</div>
						</form>
						<br> <a href="#">아이디/비밀번호 찾기</a><br>
						<hr>
					</div>
				</div>

				<div id="loginDesigner" class="row justify-content-sm-center"
					hidden="hidden">
					<div class="col-6" id="desCol">
					<br>
						<h4>디자이너</h4>
						<form id="hairshopLoginFrm1"
							action="${pageContext.request.contextPath}/designer/designerLogin.do"
							method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="text" class="form-control" id="exampleInputEmail12"
									aria-describedby="emailHelp" name="email"> <small
									id="emailHelp" class="form-text text-warning">이메일을 입력해주세요.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword12"
									name="pw">
							</div>
							<div>
								<button type="submit" class="btn btn-primary">	&nbsp; 로그인  &nbsp;</button>
							</div>
						</form>
						<br> <a href="#">아이디/비밀번호 찾기</a><br><hr>
					</div>
				</div>
			</div>
		</main>

		<footer class="mastfoot mt-auto">
			<div class="inner">
				<p>
					Create by <a href="#">한국의대표성씨조</a>,
					by <a href="#">@Sungyoun Kim</a>.
				</p>
			</div>
		</footer>
	</div>
</body>
</html>
