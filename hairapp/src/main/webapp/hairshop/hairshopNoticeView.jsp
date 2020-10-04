<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 4px 0;
}

.controller {
	padding: 25px 0;
	margin: auto;
	width: 800px;
}

#bbsTitle {
	text-align: center;
	background-color: rgb(100, 100, 100);
	width: 800px;
	height: 20px;
	padding: 12px 0;
	color: white;
}

table {
	width: 800px;
	margin: 25px 0;
	padding: 20px;
	border-collapse: collapse;
}

tr {
	height: 40px;
}

#content {
	width: 800px;
	height: 400px;
	text-align: left;
}

.btn1 {
	width: 100px;
	padding: 5px 12px;
	border: none;
	background-color: rgb(150, 60, 60);
	color: white;
}

.btn2 {
	padding: 5px 12px;
	background-color: white;
	border-color: rgb(180, 180, 180);
	border-width: 1px;
}
</style>
</head>
<body>
	<div class="controller">
		<div id="bbsTitle">
			<b>게시글 보기</b>
		</div>
		<table>
			<tr>
				<th colspan="3" align="left"><h3>${view.notice_title }</h3></th>
			</tr>
			<tr>
				<td width="30%">카테고리 : ${view.notice_categoryname }</td>
	
			</tr>
			<tr id="content" valign="top"
				style="border-top-color: rgb(100, 100, 100); border-top-width: 1px">
				<td colspan="3">내용 : ${view.notice_contents }</td>
			</tr>
			<tr>
				<td colspan="3">조회수 ${view.notice_hits }</td>
			</tr>


		</table>
		<div id="">
			<a href="">
				<button class="btn2">목록</button>
			</a>
		</div>
		<div>
			<a href="">
				<button class="btn2">홈으로</button>
			</a>
		</div>
	</div>
</body>
</html>