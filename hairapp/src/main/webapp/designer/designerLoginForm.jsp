<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='../../css/join_style.css' rel='stylesheet' style='text/css' />
<script type="text/javascript">
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.designerInfo.email.value) {
			alert("Email을  입력하세요.");
			return false;
		}
		if (!document.designerInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.designerInfo.password.value != document.designerInfo.passwordcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
/* 	// 취소 버튼 클릭시 로그인 화면으로 이동
	function goLoginForm() {
		location.href = "LoginForm.jsp";
	} */
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "맑은 고딕";
	font-size: 0.75em;
	color: #333;
}

#login-form {
	width: 200px;
	margin: 100px auto;
	border: 1px solid gray;
	border-radius: 5px;
	padding: 15px;
}
/* inline이였던 요소들을 block으로 바꿈 */
#login-form input, #login-form label {
	display: block;
}

#login-form label {
	margin-top: 10px;
}

#login-form input {
	margin-top: 5px;
}
</style>
</head>
<body>
	<form id="login-form" method="post" name="designerInfo">
		<label class="legend">Email</label> <input name="userid" type="text">
		<label class="legend">패스워드</label> <input name="password"
			type="password">
		<button>로그인</button>
	</form>
</body>
</html>