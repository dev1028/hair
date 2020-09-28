<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersMypage.jsp</title>
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
#wrap3 {
	border: 2px dashed #bcbcbc;
	margin: 10px;
	float: left;
}

</style>
</head>
<body>
<div id="wrap">
	<h2>마이페이지 톱</h2>
	<hr width="1000px" style="border: solid 1px">
	<br><br>
   
	
	<!-- 예약내역 -->
	<form method="post" action="membersMypageTop.do" name="form" id="form">
		<div id="wrap1">
			<h3>예약중인 헤어샵</h3>	
			<hr style="border: solid 1px">
			<c:if test="${ empty booking }">	<%-- c:if 했을때 empty는 booking == null과 같은거 --%>
				예약중인 헤어샵이 없습니다
			</c:if>
			<c:if test="${not empty booking }">
			<c:forEach items="${booking}" var="book">
			<div>
				미용실 : ${book.hs_name}<br>
				디자이너 : ${book.designer_name}<br>
				방문 일자 : ${book.mdr_date}<br>
				예약 번호 : ${book.mdr_no}<br>
			</div>
			</c:forEach>
			</c:if>
		</div>
		<br><br>
		<div id="wrap2">
			<h3>예약한 적이 있는 헤어샵</h3>	
			<hr style="border: solid 1px">
			<c:forEach items="${onevisit}" var="one">
			<div id="wrap3">
				<!-- 미용실사진 -->${one.hsp_file}<br>
				<!-- 미용실이름 -->${one.hs_name}<br>
			</div>
			</c:forEach>
		</div>
		
	
	</form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

	<div id="mypage">
	<%@include file="/decorator/membersMypage.jsp" %>
	</div>

</body>
</html>