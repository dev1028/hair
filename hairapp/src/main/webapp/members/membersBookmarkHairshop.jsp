<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mypage {
   display: flex;
   position: absolute;
   top:50px;
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
	<!-- 작업내용 -->
	헤어샵 북마크 리스트
</div>
<div id="mypage">
   <%@include file="/decorator/membersMypage.jsp" %>
</div>
</body>
</html>