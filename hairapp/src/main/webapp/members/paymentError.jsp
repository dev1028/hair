<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
</head>
<body>

<c:if test="${empty login }">
<script>
	alert("로그인을 해주세요")
	location.href="membersLogin.do"
</script>
</c:if>
<!-- 	결제도중 에러가 발생했습니다. 재시도해 주세요. -->
	다른 사람이 예약되어 있는 시간대와 겹칩니다.
</body>
</html>