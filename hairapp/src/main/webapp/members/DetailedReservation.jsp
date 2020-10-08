<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DetailedReservation.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css">
<style>
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
.btn1 {
	background-color: #2A265F;
	border: 0;
	border-radius: 50px;
	box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);
	color: #fff;
	font-size: 16px;
	padding: 12px 25px;
	position: absolute;
	bottom: 30px;
	right: 190px;
	letter-spacing: 1px;
}

.btn2 {
	background-color: #2A265F;
	border: 0;
	border-radius: 50px;
	box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2);
	color: #fff;
	font-size: 16px;
	padding: 12px 25px;
	position: absolute;
	bottom: 30px;
	right: 70px;
	letter-spacing: 1px;
}
</style>
</head>
<body>
<br><br>
	<div id="wrap">
	
	<form method="post" action="membersDR.do" name="form" id="form">
		<div id="wrap1">
			<h3>예약 상세 확인</h3>	
			<hr style="border: solid 1px"><br>
			<%-- <div>
			<input type="hidden" name="no" value="no" >
				예약 번호 : ${list.mdr_no}<br>
				방문 일자 : ${list.mdr_date}<br>
				미용실 : ${list.hs_name}<br>
				디자이너 : ${list.designer_name}<br>
				시술 헤어 : ${list.hhi_name}<br>
				헤어샵 요청사항 : ${list.mdr_request}<br>
				헤어 기장 : ${list2.mem_hair_length}<br>
				헤어 상태 : ${list2.mem_hair_status}<br>
				결제 금액 : ${list.mdp_price}<br>
			</div> 
			<br>--%>
			
<!-- css -->
<div class="courses-container">
	<div class="course">
		<div class="course-preview">
			<h6>${list.mdr_no}</h6>
			<h2>${list.hs_name}</h2>
		</div>
		<div class="course-info">
			<div class="progress-container">
				<div class="progress"></div>
			</div>
			<input type="hidden" name="no" value="no" >
			<h6>예약일자</h6>
			<h4>${list.mdr_date}</h4><br>
			<h6>디자이너</h6>
			<h4>${list.designer_name}</h4><br>
			<h6>시술헤어</h6>
			<h4>${list.hhi_name}</h4><br>
			<h6>헤어기장</h6>
			<h4>${list2.mem_hair_length}</h4><br>
			<h6>헤어상태</h6>
			<h4>${list2.mem_hair_status}</h4><br>
			<h6>결제금액</h6>
			<h4>${list.mdp_price}</h4><br>
			<h6>헤어샵 요청사항</h6>
			<h4>${list.mdr_request}</h4><br>
		</div>
	</div>
</div>
			
		</div>
	</form>
	</div>
</body>
</html>