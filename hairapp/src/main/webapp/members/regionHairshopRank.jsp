<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 헤어샵 순위</title>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/card.css">
<link rel="stylesheet" type="text/css" href="../css/hairshopCard.css">
<style>
div.course{
	padding: 10px;
	margin:0 auto;
}
</style>
<script src="../js/hairshopBookmark.js"></script>
<script src="../js/locationFromIP.js"></script>
</head>
<style>
.container_horrizon {
  text-align: center;
}
</style>

<body>
<c:if test="${empty lat }">
<script>
	setLocationFromIP();
</script>
</c:if>

<div class="container">
	<div class="container_horrizon">
    	<h3 class="h3">지역별 헤어샵 순위</h3>
    </div>
    
    <div class="row">
	<c:forEach items="${list}" var="item">
		<form action="../members/hairshopSelectResult.do" method="post">
			<div class="course" onclick="location.href='hairshopInfo.do?hsNo=${item.hs_no}';" style="cursor: pointer;">
				<div class="course-preview">
					<h6>미용실이름</h6>
					<h4>${item.hs_name }</h4>
				</div>
				<div class="course-info">
					<div class="progress-container">
						<div class="progress"></div>
					</div>
					<h6>거리</h6>
					<h2>${item.distance } km </h2>
					<h6>영업시간</h6>
					<h2>${item.hs_starttime}시 -${item.hs_endtime}시</h2>
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
<hr>
</body>
</html>