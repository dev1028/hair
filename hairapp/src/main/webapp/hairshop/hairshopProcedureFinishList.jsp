<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:forEach items="${list }" var="f">
			<table>
				<tr>
					<td>${f.mdr_no}</td>
					<td>${f.hhi_no }</td>
					<td>${f.designer_no }</td>
					<td>${f.hhi_price }</td>
					<td>${f.designer_name }</td>
					<td>${f.mem_name }</td>
				</tr>
			</table>
		</c:forEach>
	</div>
</body>
</html>