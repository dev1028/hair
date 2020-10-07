<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
<script>
	function goLogin() {
		location.href="membersLogin.do";
	}
</script>
</head>
<body>
<div id="wrap" style="float:right;">
		<div class="row1">
		<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h3>ID(EMAIL) 찾기</h3><br>
				<hr><br><br>
			</div>
			<div class="app-title2">
				회원가입 시 사용한 ID(email)는<br><br>
			<h5>${members.mem_email}</h5><br>
				입니다.<br><br><br>
			</div>
		<input type="button" class="btn btn-primary btn-large btn-block" value="로그인하러 가기" onclick="goLogin()">
		</div>
		</div>
		</div>
</div>

<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>