<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/card.css">
<link rel="stylesheet" type="text/css" href="../css/hairshopCard.css">
<script src="../js/hairshopBookmark.js"></script>
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
	<h3>헤어샵 북마크 리스트</h3>
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
					<h6>공지사항</h6>
					<h2>${item.hs_notice}</h2>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<div id="mypage">
   <%@include file="/decorator/membersMypage.jsp" %>
</div>
</body>
</html>