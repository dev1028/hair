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
	top:120px;
	right:500px;
    position:absolute;
    margin:0 auto;
} 
</style>
<script>
</script>
</head>
<body>
<div id="wrap" style="float:right;">
	<form method="POST" name="searchFrm" action="membersPwSearchS.do">
	<h3>비밀번호 찾기</h3><br>
		<div class="row1">
			<label for="email">이메일:&nbsp;</label><input type="email" name="pwemail" id="email" placeholder="ID(email) 입력" required autofocus>
			<br>
			<label for="name">이름:&nbsp;</label><input type="text" name="pwname" id="name" placeholder="이름" required>
			<br>
			<label for="phone">전화번호:&nbsp;</label><input type="text" name="pwphone" id="phone" placeholder="ex) 010-0000-0000" required>
		</div>
			<input type="submit" value="해당버튼을 누르면 이메일 인증이 보내집니다">
	</form>
</div>
<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>