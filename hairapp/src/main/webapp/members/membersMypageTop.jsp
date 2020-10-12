<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersMypage.jsp</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">

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


/* 슬라이더 */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

*:focus {
  outline: 0;
}

.swiper-container {
	margin: 0 auto;
    position: relative;
    overflow: hidden;
    list-style: none;
    padding: 0;
    z-index: 1;
    width: 1000px;
}

.swiper-slide {
	width: 400px;
}

.swiper-slide:nth-child(1) .slider-text {
	background-color: #2196f3;
}

.swiper-slide:nth-child(2) .slider-text {
	background-color: #e91e63;
}

.swiper-slide:nth-child(3) .slider-text {
	background-color: #c3d41a;
}

.swiper-slide:nth-child(4) .slider-text {
	background-color: #ff9800;
}

.swiper-slide:nth-child(5) .slider-text {
	background-color: #c33ada;
}
.swiper-slide:nth-child(6) .slider-text {
	background-color: #2196f3;
}

.swiper-slide:nth-child(7) .slider-text {
	background-color: #e91e63;
}

.swiper-slide:nth-child(8) .slider-text {
	background-color: #c3d41a;
}

.swiper-slide:nth-child(9) .slider-text {
	background-color: #ff9800;
}

.swiper-slide:nth-child(10) .slider-text {
	background-color: #c33ada;
}

.card {
	background-color: #ffffff;
	height: 400px;
	margin: 0 auto;
	position: relative;
	width: 400px;
}

.card .content {
	padding: 30px;
	width: 400px;
}

.card .content a {
	border: 2px solid #000000;
	color: #262626;
	display: inline-block;
	font-weight: 600;
	margin: 10px 0 0;
	padding: 10px 20px;
	text-decoration: none;
}

.card .slider-text {
	align-items: center;
	background-color: #000000;
	display: flex;
	height: 200px;
	justify-content: center;
	position: relative;
	width: 100%;
}

.card .slider-text h3 {
	color: #ffffff;
	font-size: 3em;
}

.card2 {
	background-color: #ffffff;
	height: 250px;
	margin: 0 auto;
	position: relative;
	width: 400px;
}
.card2 .content {
	padding: 30px;
	width: 400px;
}

.card2 .content a {
	border: 2px solid #000000;
	color: #262626;
	display: inline-block;
	font-weight: 600;
	margin: 10px 0 0;
	padding: 10px 20px;
	text-decoration: none;
}

.card2 .slider-text {
	align-items: center;
	background-color: #000000;
	display: flex;
	height: 250px;
	justify-content: center;
	position: relative;
	width: 100%;
}

.card2 .slider-text h3 {
	color: #ffffff;
	font-size: 3em;
}

</style>

</head>
<body>
<div id="wrap">
	<br> <br> <b><font size="6" color="gray">마이페이지톱</font></b> <br>
	<hr><br>
   
	
	<!-- 예약내역 -->
	<form method="post" action="membersMypageTop.do" name="form" id="form">
		<div id="wrap1">
			<h4>예약중인 헤어샵</h4>	
			<hr>
			<c:if test="${ empty booking }">	<%-- c:if 했을때 empty는 booking == null과 같은거 --%>
				예약중인 헤어샵이 없습니다
			</c:if>
		
<!-- 슬라이더 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		
		<c:if test="${not empty booking }">
			<c:forEach items="${booking}" var="book">
			<div class="swiper-slide">
			<div class="card">
				<div class="slider-text">
					<h3>
						${book.hs_name}<br>
					</h3>
				</div>

				<div class="content">
					<p>
						디자이너 : ${book.designer_name}<br>
						방문 일자 : ${book.mdr_date}<br>
						예약 번호 : ${book.mdr_no}<br>
					</p>
				</div>
			</div>
		</div>
		</c:forEach>
		</c:if>
		
	</div>
</div>
		
		
</div>
		
<br><br><br><br><br><br>
<div id="wrap2">	<!-- wrap2시작 -->
	<h4>예약한 적이 있는 헤어샵</h4>	
	<hr>
	<c:if test="${ empty onevisit }">	<%-- c:if 했을때 empty는 booking == null과 같은거 --%>
				예약한적이 있는 헤어샵이 없습니다
	</c:if>	
			
<!-- 슬라이더 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		
			<c:forEach items="${onevisit}" var="one">
			<div class="swiper-slide">
			<div class="card2">
				<div class="slider-text">
					<h3>
						${one.hs_name}
					</h3>
				</div>
			</div>
		</div>
		</c:forEach>
		
	</div>
</div>
<!-- 슬라이더끝 -->
			
</div>	<!-- wrap2끝 -->
<br><br><br><br><br><br>
		
</form>
</div>

<script>
let swiper = new Swiper ('.swiper-container', {
	effect: 'coverflow',
	grabCursor: true,
	centeredSlides: true,
	slidesPerView: 'auto',
	coverflowEffect: {
		rotate: 30,
		stretch: 0,
		depth: 200,
		modifier: 1,
		slideShadows: true,
	},
  pagination: {
	 el: 'swiper-pagination'
  }
});
</script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<div id="mypage">
	<%@include file="/decorator/membersMypage.jsp" %>
</div>
</body>

</html>