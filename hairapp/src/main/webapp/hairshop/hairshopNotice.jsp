<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.controller {
	padding: 25px 0;
	margin: auto;
	width: 840px;
	text-align: center;
}

table {
	width: 840px;
	padding: 10px 0;
	border-collapse: collapse;
}

th {
	background-color: rgb(100, 100, 100);
	color: white;
}

button {
	margin: 4px 0;
	padding: 10px 0;
	width: 840px;
	background-color: rgb(255, 80, 80);
	color: white;
	border: none;
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration-line: underline;
}
</style>
</head>
<body>
	<div class="controller">
		<table>
			<tr>
				<th width="100px">카테고리</th>
				<th width="40px">번호</th>
				<th width="150px">제목</th>
				<th>내용</th>
				<th width="100px">작성자</th>
				<th width="150px">날짜</th>
				<th width="40px">조회</th>
			</tr>
			<c:forEach items="${list}" var="notice">
				<tr>
					<td>${notice.notice_categoryname}</td>
					<td>${notice.notice_no}</td>
					<td>${notice.notice_title }</td>
					<td>${notice.notice_contents }</td>
					<td>${notice.notice_hits }</td>
					<td>${notice.notice_writedate }</td>
					<td></td>
					<td>${notice.emp_no }</td>
				</tr>
			</c:forEach>
			
		
		</table>
	</div>
	<p>
		<a href="${pageContext.request.contextPath}/hairshop/hairshopNoticeWrite.jsp"><button>글쓰기</button></a><br /> 
		<a href=""><button>Main</button></a>
	</p>
</body>
</html>