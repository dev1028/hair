<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/card.css">
<link rel="stylesheet" type="text/css" href="../css/hairshopCard.css">
<style>
div.course{
	padding: 10px;
	margin:0 auto;
}

body {
	background: url(../images/members/hairshopselect.png);
}
</style>
<script src="../js/hairshopBookmark.js"></script>
<script src="../js/locationFromIP.js"></script>
</head>
<body>

<div class="container">
	<div class="container_horrizon">
    	<br> <br> <h4 style="font-weight: bold;">키워드: ${param.term }</h4>
	<hr style="border: 2px solid #6d7fcc;"><br><br>
    </div>
	    
	<div class="row">
	<c:forEach items="${list}" var="item">
		<form action="../members/hairshopSelectResult.do" method="post">
			<div class="course">
				<div class="course-preview" onclick="location.href='hairshopInfo.do?hsNo=${item.hs_no}';" style="cursor: pointer;">
					<h6>미용실이름</h6>
					<h4>${item.hs_name }</h4>
				</div>
				<div class="course-info">
					<div class="progress-container">
						<div class="progress"></div>
					</div>
					<h6>공지사항</h6>
					<h2>${item.hs_notice}</h2>
					<h6>영업시간</h6>
					<h2>${item.hs_starttime}시 - ${item.hs_endtime}시</h2>
					<h6>주소</h6>
					<h2>${item.hs_fulladdr }</h2>
					
					<button class="btn">예약</button>
					<c:if test="${not empty login }">
						<a href='javascript: like_func("${item.hs_no}")'>
							<c:if test="${item.hs_book == 1 }">
								<img class="img-${item.hs_no}" src="../images/bookmark/heart.png" width="30" height="30">
							</c:if>
							<c:if test="${item.hs_book != 1 }">
								<img class="img-${item.hs_no}" src="../images/bookmark/empty_heart.png" width="30" height="30">
							</c:if>
						</a>
					</c:if>
				</div>
			</div>
			<input type="hidden" name="hsNo" value="${item.hs_no}">
		</form>
		<hr>
	</c:forEach>
	</div>
</div>

	

<%--
	<div class="cardContainer">
		<c:forEach items="${list}" var="item">
			<form action="../members/hairshopSelectResult.do" method="post">
				<div class="horizontal-card">
					<img class="card_image" src="../images/hairshop/signin-image.jpg" width="200" height="130">
					<div class="horizontal-card-body">
						<h4 class="card-title"><a href="hairshopInfo.do?hsNo=${item.hs_no}">${item.hs_name }</a></h4>
						<span>공지: ${item.hs_notice}</span>
 						<span class="card-text"> 프로필: ${item.hs_profile } </span> 
						<span class="card-text"> 주소: ${item.hs_fulladdr } </span>
						<span class="card-text"> 영업시간: ${item.hs_starttime}시 -${item.hs_endtime}시</span>	
					</div>
					<div class="horizontal-card-footer">
						<span class="card-text"> 별점: 미구현 </span>
						<!-- <a class="card-text status">좋아요수: 미구현</a> -->
						<!-- <a class="card-text status">#Save</a> -->
						<!-- <button>북마크</button> -->
<!-- 						<button style="width:40pt;height:25pt;">예약</button> -->
						<c:if test="${not empty login }">
							<a href='javascript: like_func("${item.hs_no}")'>
								<c:if test="${item.hs_book == 1 }">
									<img class="img-${item.hs_no}" src="../images/bookmark/heart.png" width="30" height="30">
								</c:if>
								<c:if test="${item.hs_book != 1 }">
									<img class="img-${item.hs_no}" src="../images/bookmark/empty_heart.png" width="30" height="30">
								</c:if>
							</a>
						</c:if>
						<button>예약</button>
						
					</div>
				</div>						
				<input type="hidden" name="hsNo" value="${item.hs_no}">
			</form>
		</c:forEach>
	</div>
 --%>
</body>
</html>