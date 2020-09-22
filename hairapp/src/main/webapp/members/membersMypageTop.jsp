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
	position:absolute;
	top:100px;
	left:0px;
}
</style>
</head>
<body>
<div id="wrap" style="float:right;">
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
			<div>
				<!-- 미용실사진 -->${one.hsp_file}<br>
				<!-- 미용실이름 -->${one.hs_name}<br>
			</div>
			</c:forEach>
		</div>
		
	<div id="mypage">
	<%@include file="/decorator/membersMypage.jsp" %>
	</div>
	
	</form>
</div>

</body>
</html>