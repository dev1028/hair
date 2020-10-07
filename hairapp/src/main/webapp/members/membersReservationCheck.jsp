<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersReservationCheck.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
<style>
#mypage {
	display: flex;
	position:absolute;
	top:50px;
	left:0px;
}

#wrap{
	top:50px;
	left:400px;
    position: absolute;
    margin:0 auto;
} 

/* css */
@import url('https://fonts.googleapis.com/css?family=Muli&display=swap');

* {
	box-sizing: border-box;
}

.course {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);
	display: flex;
	max-width: 100%;
	margin: 20px;
	overflow: hidden;
	width: 700px;
}

.course h6 {
	opacity: 0.6;
	margin: 0;
	letter-spacing: 1px;
	text-transform: uppercase;
}

.course h2 {
	letter-spacing: 1px;
	margin: 10px 0;
}

.course-preview {
	background-color: #2A265F;
	color: #fff;
	padding: 30px;
	max-width: 250px;
}

.course-preview a {
	color: #fff;
	display: inline-block;
	font-size: 12px;
	opacity: 0.6;
	margin-top: 30px;
	text-decoration: none;
}

.course-info {
	padding: 30px;
	position: relative;
	width: 100%;
}

.progress-container {
	position: absolute;
	top: 30px;
	right: 30px;
	text-align: right;
	width: 150px;
}

.progress {
	background-color: #ddd;
	border-radius: 3px;
	height: 5px;
	width: 100%;
}

.progress::after {
	border-radius: 3px;
	background-color: #2A265F;
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	height: 5px;
	width: 66%;
}

.btn {
	background-color: #2A265F;
	border: 0;
	border-radius: 50px;
	box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);
	color: #fff;
	font-size: 16px;
	padding: 12px 25px;
	position: absolute;
	bottom: 30px;
	right: 30px;
	letter-spacing: 1px;
}
</style>
<script>
function openDR(mdr_no){
    window.name = "parentForm";
    window.open("membersDR.do?mdr_no=" + mdr_no,
            "chkForm", "width=1000, height=700, resizable = no, scrollbars = no");    
}

function openWriteDR(mdr_no) {
	window.name = "parentForm";
    window.open("../popup/hairshopReview.do?mdr_no=" + mdr_no,
            "chkForm", "width=400, height=300, resizable = no, scrollbars = no");
}

</script>

</head>
<body>

	
    <div id="wrap">
	<h2>예약 내역</h2>
	<hr width="1000px" style="border: solid 1px">
	<br><br>
   
	
	<!-- 예약내역 -->
	<form method="post" action="membersRD.do" name="form" id="form">
		<div id="wrap1">
			<h3>예약중인 헤어샵</h3>	
			<hr style="border: solid 1px">
			<c:if test="${ empty booking }">	<%-- c:if 했을때 empty는 booking == null과 같은거 --%>
				예약중인 헤어샵이 없습니다
			</c:if>
			<%-- <c:if test="${not empty booking }">
			<c:forEach items="${booking}" var="book">
			<div>
				미용실 : ${book.hs_name}<br>
				디자이너 : ${book.designer_name}<br>
				방문 일자 : ${book.mdr_date}<br>
				예약 번호 : ${book.mdr_no}<br>
				<input type="button" value="예약상세확인" onclick="openDR(${book.mdr_no})">
			</div>
			</c:forEach>
			</c:if>
		</div><!-- wrap1 끝 --> --%>
		
<!-- css -->
<c:if test="${not empty booking }">
<c:forEach items="${booking}" var="book">
<div class="courses-container">
	<div class="course">
		<div class="course-preview">
			<h6>${book.mdr_no}</h6>
			<h2>${book.hs_name}</h2>
		</div>
		<div class="course-info">
			<div class="progress-container">
				<div class="progress"></div>
			</div>
			<h6>디자이너</h6>
			<h2>${book.designer_name}</h2><br>
			<h6>예약일자</h6>
			<h2>${book.mdr_date}</h2><br><br>
			<button class="btn" onclick="openDR(${book.mdr_no})">예약상세확인</button>
		</div>
	</div>
</div>
</c:forEach>
</c:if>
		
</div><!-- wrap1 끝 -->
		
		
		<br><br>
		<div id="wrap2">
			<h3>전체 예약 내역</h3>	
			<hr style="border: solid 1px">
			<c:forEach items="${list}" var="reservation">
			<div>
				미용실 : ${reservation.hs_name}<br>
				디자이너 : ${reservation.designer_name}<br>
				방문 일자 : ${reservation.mdr_date}<br>
				예약 번호 : ${reservation.mdr_no}<br>
				
				<input type="button" value="예약상세확인" onclick="openDR(${reservation.mdr_no})">
				<input type="button" value="후기쓰기" onclick="openWriteDR(${reservation.mdr_no})">
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