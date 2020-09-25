<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정 완료</title>
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
	function goLogin() {
		location.href="membersLogin.do";
	}
</script>
</head>
<body>
<div id="wrap">
	<form method="POST" name="searchFrm" action="">
	<h3>비밀번호 찾기</h3><br>
		<div class="row1">
			비밀번호 수정이 완료되었습니다
			로그인을 해주세요.
		</div>
	</form>
	<input type="button" value="로그인하러 가기" onclick="goLogin()">
</div>

<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>