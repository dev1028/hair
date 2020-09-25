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
	top:80px;
	left:700px;
    position:absolute;
    margin:0 auto;
} 
</style>
<script>
</script>
</head>
<body>
<div id="wrap">
	<form method="POST" name="searchFrm" action="membersIdSearchS.do">
	<h3>ID(email) 찾기</h3><br>
		<div class="row1">
			<label for="name">이름:&nbsp;</label><input type="text" name="idname" id="name" placeholder="이름" required autofocus>
			<br>
			<label for="phone">전화번호:&nbsp;</label><input type="text" name="idphone" id="phone" placeholder="ex) 010-0000-0000" required>
			<br>
			<label for="birth">생일:&nbsp;</label><input type="date" name="idbirth" id="birth" placeholder="생일" required>
		</div>
			<input type="submit" value="찾기">
	</form>
</div>
	<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
	</div>
</body>
</html>