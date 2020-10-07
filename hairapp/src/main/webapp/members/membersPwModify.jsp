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
<body>
<div id="wrap">
	<form method="POST" name="searchFrm" action="membersPwModify.do">
	
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h3>비밀번호 수정</h3><br>
				<hr><br><br>
			</div>
			<div class="login-form">
				<div class="control-group">
					<div class="app-title2">
				<label class="login-field-icon fui-user">비밀번호 수정 :&nbsp;</label>
				<input type="password" class="login-field" name="mem_pw" maxlength="15" placeholder="15자 내로 적어주세요" required autofocus>
					</div>
				</div>
			</div>
			<br><br>
			<input type="submit" class="btn btn-primary btn-large btn-block" value="수정">
		</div>
	</div>
		
		
	</form>
</div>

<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>