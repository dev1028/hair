<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersLogin.jsp</title>
<style>
#mypage {
	display: flex;
	position:absolute;
	top:100px;
	left:0px;
}

#wrap{
	top:150px;
	left:700px;
    position:absolute;
    margin:0 auto;
} 
</style>
<script>
	function checkValue() {
		if (!document.loginFrm.loginid.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.loginFrm.loginpw.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
	
	function membersJoin() {
		location.href = "membersJoin.do";
	}
	
	function membersSearch() {
		location.href = "membersSearch.do";
	}
	
</script>
</head>
<body>
	<div id="wrap">
	
	<form method="post" name="loginFrm" id="loginFrm"
		action="${pageContext.request.contextPath}/members/membersLoginS.do"
		onsubmit="return checkValue()">
		
		<div>
			<label for="id">EMAIL:</label> <input type="email" id="loginid"
				name="loginid">
		</div>
		<div>
			<label for="pw">PW:</label> <input type="password" id="loginpw"
				name="loginpw">
		</div>
		<button>로그인</button>
	</form>
		<input type="button" value="ID/PW찾기" onclick="membersSearch()" />
		<br><br><br><br><br>
	
	아직도 회원이 아니신가요?<br>
	<input type="button" value="회원가입" onclick="membersJoin()" />
	
	</div>
	
	<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
	</div>
</body>
</html>