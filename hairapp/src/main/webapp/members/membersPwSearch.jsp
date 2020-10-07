<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
</script>
</head>
<body>
<div id="wrap">
	<form method="POST" name="searchFrm" action="membersPwSearchS.do">
	
	<!-- <h3>비밀번호 찾기</h3><br>
		<div class="row1">
			<label for="email">이메일:&nbsp;</label><input type="email" name="pwemail" id="email" placeholder="ID(email) 입력" required autofocus>
			<br>
			<label for="name">이름:&nbsp;</label><input type="text" name="pwname" id="name" placeholder="이름" required>
			<br>
			<label for="phone">전화번호:&nbsp;</label><input type="text" name="pwphone" id="phone" placeholder="ex) 010-0000-0000" required>
		</div>
			<input type="submit" value="해당버튼을 누르면 이메일 인증이 보내집니다"> -->
			
			
<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h3>비밀번호 찾기</h3><br>
				<hr><br><br>
			</div>
			
			<div class="login-form">
				<div class="control-group">
				<input type="email" class="login-field" id="email" name="pwemail" placeholder="ID(email) 입력" required autofocus>
				<label class="login-field-icon fui-user" for="pwemail"></label>
				</div>

				<div class="control-group">
				<input type="text" class="login-field" placeholder="이름" id="name" name="pwname" required>
				<label class="login-field-icon fui-user" for="pwname"></label>
				</div>
				
				<div class="control-group">
				<input type="text" class="login-field" placeholder="전화번호 ex) 010-0000-0000" id="phone" name="pwphone" required>
				<label class="login-field-icon fui-user" for="pwphone"></label>
				</div><br>

				<input type="submit" class="btn btn-primary btn-large btn-block" value="이메일 인증 보내기">
			</div>
		</div>
	</div>
	
	
	
	
	</form>
</div>
<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>