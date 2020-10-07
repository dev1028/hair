<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</head>
<body>
<body>

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

				<!-- <div class="control-group">
				<input type="password" class="login-field" value="" placeholder="password" id="login-pass">
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div> -->

				<input type="submit" class="btn btn-primary btn-large btn-block" value="찾기">
			</div>
		</div>
	</div>
	
</body>
</body>
</html>