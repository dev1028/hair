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
	top:120px;
	right:500px;
    position:absolute;
    margin:0 auto;
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
	<form method="POST" name="searchFrm" action="">
	<h3>ID(email) 찾기</h3><br>
		<div class="row1">
			회원가입 시 사용한 ID(email)는<br>
			<h5>${members.mem_email} 입니다.</h5>
		</div>
	</form>
	<input type="button" value="로그인하러 가기" onclick="goLogin()">
</div>

<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>