<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>헤어샵 소개</title>
<style>
/* 메뉴바 */
#menubar2{
	top:91%;
	right:0px;
	position:absolute;
	width:80%;
	height:50px;
	background-color: #d8ddee;
}
#shopdata2 {
	position:absolute;
	left:2%;
	top:30%;
}

/* 바디 div */
#shopbody2 {
	position:absolute;
	left:21%;
	top:100%;
}
</style>
<link rel="stylesheet" href="../css/membersHairshop.css">
</head>

<body>

<!-- 맨위에 선 -->
<div id="headerLine">
</div>

<!-- 슬라이더 -->
<div id="divSlider">

<section id="contenedor">
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<ul id="slider">
		<li>
			<div><p>상민미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
		<li>
			<div><p>송현미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
		<li>
			<div><p>강산미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
		<li>
			<div><p>승연미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
	</ul>
</section>

</div>

<!-- 미용실정보 -->
<br>
<div id="shopInfo">
	<div id="shopName">
		<c:forEach items="${intro}" var="in">
		<h4>${in.hs_name}</h4>
		<h6>${in.hs_fulladdr}</h6>
		</c:forEach>
	</div>
	<div id="shopStar1">
		★★★★★
	</div>
	<div id="shopStar2">
		<br><h4>4.9</h4>
	</div>
	<div id="reviewBook">
		리뷰 1000+<br>
		북마크 1000+
	</div>

</div>

<!-- 바디안에 메뉴바 -->
<br>
<div id="menubar">
	<div id="shopdata">
		헤어샵 정보
	</div>
</div>

<!-- 바디 -->
<div id="shopbody">

<form method="post" action="hairshopIntro.do" name="form" id="form">
			<c:forEach items="${intro}" var="in">
			<table>
				<tr>
					<td id="title">전화번호</td>
					<td>${in.hs_tel}</td>
				</tr>

				<tr>
					<td id="title">주소</td>
					<td>${in.hs_fulladdr}</td>
				</tr>

				<tr>
					<td id="title">영업시간</td>
					<td>${in.hs_starttime} ~ ${in.hs_endtime} 시</td>
				</tr>

				<tr>
					<td id="title">휴무일</td>
					<td>${in.hs_dayoff} 일</td>
				</tr>

				<tr>
					<td id="title">직원수</td>
					<td>${in.designer_access_status} 명</td>
				</tr>

				<tr>
					<td id="title">주차장유무</td>
					<td>${in.hs_parking}</td>
				</tr>

				<tr>
					<td id="title">비고</td>
					<td>${in.hs_etc}</td>
				</tr>

			</table>
			</c:forEach>
		</form>

</div>

<!-- 바디안에 메뉴바 -->
<div id="menubar2">
	<div id="shopdata2">
		헤어샵 위치
	</div>
</div>


<!-- 이안에 지도하면됨 -->
<div id="shopbody2">

ㄴㅇㄹㄴㄹㅇ









</div>









<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>


</body>
</html>