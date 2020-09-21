<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersLogin.jsp</title>
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
</script>
</head>
<body>
	<%=request.getAttribute("errormsg")%>

	<form method="post" name="loginFrm" id="loginFrm"
		action="${pageContext.request.contextPath}/membersLogin.do"
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
</body>
</html>