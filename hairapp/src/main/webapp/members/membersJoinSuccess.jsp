<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersJoinSuccess.jsp</title>
</head>
<script>
		//취소 버튼 클릭시 첫화면으로 이동
		function goLogin() {
    		location.href="membersLogin.jsp";
		}  
</script>
<body>
<h2><%=session.getAttribute("joinemail")%>님</h2><br>
<h4>회원가입이 완료되었습니다</h4><br>
<button onclick="goLogin()">로그인</button>
</body>
</html>