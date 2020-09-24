<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
</head>
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
<script>

function membersIdSearch() {
	location.href = "membersIdSearch.do";
}

function membersPwSearch() {
	location.href = "membersPwSearch.do";
}

</script>
<body>
	<div id="wrap" style="float:right;">
	<input type="button" name="id" value="ID찾기" onclick="membersIdSearch()" />
	<input type="button" name="pw" value="비밀번호 찾기" onclick="membersPwSearch()" />
	</div>
	<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
	</div>
</body>
</html>