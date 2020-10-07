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
	<form method="POST" name="searchFrm" action="membersIdSearchS.do">
	
	
	<!-- <h3>ID(email) 찾기</h3>
	<hr><br>
		<div class="row1">
			<label for="name">이름:&nbsp;</label><input type="text" name="idname" id="name" placeholder="이름" required autofocus>
			<br>
			<label for="phone">전화번호:&nbsp;</label><input type="text" name="idphone" id="phone" placeholder="ex) 010-0000-0000" required>
			<br>
			<label for="birth">생일:&nbsp;</label><input type="date" name="idbirth" id="birth" placeholder="생일" required>
		</div>
			<input type="submit" value="찾기"> -->

<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h3>ID(EMAIL) 찾기</h3><br>
				<hr><br><br>
			</div>

			<div class="login-form">
				<div class="control-group">
				<input type="text" class="login-field" placeholder="이름" id="name" name="idname" required autofocus>
				<label class="login-field-icon fui-user" for="idname"></label>
				</div>
				
				<div class="control-group">
				<input type="text" class="login-field" placeholder="전화번호 ex) 010-0000-0000" id="idphone" name="idphone" required>
				<label class="login-field-icon fui-user" for="idphone"></label>
				</div>
				
				<div class="control-group">
				<input type="date" class="login-field" id="idbirth" name="idbirth" required>
				<label class="login-field-icon fui-user" for="idbirth"></label>
				</div><br>

				<input type="submit" class="btn btn-primary btn-large btn-block" value="찾기">
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