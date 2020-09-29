<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersDelete</title>
<style>
#mypage {
	display: flex;
	position:absolute;
	top:100px;
	left:0px;
}

#wrap{
	top:50px;
	left:400px;
    position: absolute;
    margin:0 auto;
} 
</style>

</head>
<body>
<div id="wrap">

<form name="deleteform" method="post" action="membersDeleteF.do">
<br><br><br><br>
	회원탈퇴가 완료되었습니다.<br>
	그동안 '우동'을 이용해주셔서 감사합니다.<br>
</form>

</div>






<div id="mypage">
	<%@include file="/decorator/membersMypage.jsp" %>
</div>
</body>
</html>