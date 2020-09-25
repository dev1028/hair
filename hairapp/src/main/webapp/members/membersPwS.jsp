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
			인증메일이 발송되었습니다
			인증 메일에서 버튼을 클릭하시면 비밀번호 수정이 가능합니다
		</div>
	</form>
	<input type="button" value="로그인하러 가기" onclick="goLogin()">
</div>

<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>