<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
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
</head>
<script>
		//취소 버튼 클릭시 첫화면으로 이동
		function goLogin() {
    		location.href="membersLogin.do";
		}  
</script>
<body>
<div id="wrap" style="float:right;">
	<h4>회원가입이 완료되었습니다</h4><br>
	<h5>이메일에서 인증을 해주시면 가입이 최종 완료 됩니다</h5>
<button onclick="goLogin()">로그인</button>
</div>
<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>