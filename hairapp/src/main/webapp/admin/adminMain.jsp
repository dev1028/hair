<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>chart</div>
	<div>schedule</div>
	<div>
		미용실 추가 현황
		<table border="1">
			<thead>
				<tr>
					<th>no</th>
					<th>name</th>
					<th>status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${hsList }" var="i">
					<tr>
						<td>${i.hs_no }</td>
						<td>${i.hs_name }</td>
						<td>${i.hs_approval }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>