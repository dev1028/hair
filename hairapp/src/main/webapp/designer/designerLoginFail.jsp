<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("이메일  인증하세요");
	location.href = "${pageContext.request.contextPath}/hairshop/hairshopDesignerLogin.jsp";
</script>
</head>
<body>
<%session.invalidate(); %>
</body>
</html>