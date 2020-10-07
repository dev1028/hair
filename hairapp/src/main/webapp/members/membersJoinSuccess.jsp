<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<style>
#mypage {
	display: flex;
	position:absolute;
	top:100px;
	left:0px;
}

#wrap{
	top:100px;
	left:42%;
    position:absolute;
    margin:0 auto;
} 

/* css */
* {
box-sizing: border-box;
}

*:focus {
	outline: none;
}

.login {
width: 500px;
}
.login-screen {
background-color: #bfc5e0;
padding: 100px;
border-radius: 5px
}

.app-title {
text-align: center;
color: #fff;
}
.app-title2 {
text-align: center;
}

.login-form {
text-align: center;
}
.control-group {
margin-bottom: 10px;
}

input {
text-align: center;
border: 2px solid transparent;
border-radius: 3px;
font-size: 16px;
font-weight: 200;
padding: 10px 0;
width: 250px;
transition: border .5s;
}

input:focus {
border: 2px solid #3498DB;
box-shadow: none;
}

.btn {
  border: 2px solid transparent;
  background: #3498DB;
  color: #ffffff;
  font-size: 16px;
  line-height: 25px;
  padding: 10px 0;
  text-decoration: none;
  text-shadow: none;
  border-radius: 3px;
  box-shadow: none;
  transition: 0.25s;
  display: block;
  width: 250px;
  margin: 0 auto;
}

.btn:hover {
  background-color: #2980B9;
}

</style>
</head>
<script>
		//취소 버튼 클릭시 첫화면으로 이동
		function goLogin() {
    		location.href="membersLogin.do";
		}  
</script>
<body>
<div id="wrap">

	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h3>회원가입 완료</h3><br>
				<hr><br><br>
			</div>
			<div class="app-title2">
				<h5>회원가입이 완료되었습니다</h5><br>
				<h5>이메일에서 인증을 해주시면<br>가입이 최종 완료 됩니다</h5><br><br>
			</div>
			<button class="btn btn-primary btn-large btn-block" onclick="goLogin()">로그인</button>
		</div>
	</div>

</div>
<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>