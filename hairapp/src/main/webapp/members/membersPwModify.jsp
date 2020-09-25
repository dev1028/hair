<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
#mypage {
	display: flex;
	position:absolute;
	top:100px;
	left:0px;
}

#wrap{
	top:80px;
	left:700px;
    position:absolute;
    margin:0 auto;
} 
</style>

</head>
<body>
<div id="wrap">
	<form method="POST" name="searchFrm" action="membersPwModify.do">
	<h3>비밀번호 수정</h3><br>
		<div class="row1">
			<label>비밀번호 수정 : </label><input type="text" name="mem_pw">
			<br>
			<input type="submit" value="수정">
		</div>
	</form>
</div>

<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
</div>
</body>
</html>