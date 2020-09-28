<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/card.css">
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
<%-- 	<c:forEach items="${list }" var="item"> --%>
<%-- 		헤어샵번호: ${item.hs_no } <br> --%>
<%-- 		헤어샵이름: ${item.hs_name} <br> --%>
<%-- 	</c:forEach> --%>
	
	<div class="cardContainer">
		<c:forEach items="${list}" var="item">
			<form action="../members/hairshopSelectResult.do" method="post">
				<div class="horizontal-card">
					<img src="../images/hairshop/signin-image.jpg" width="200" height="130">
					<div class="horizontal-card-body">
						<h4 class="card-title"><a href="hairshopInfo.do?hsNo=${item.hs_no}">${item.hs_name }</a></h4>
<%-- 						<span>공지: ${item.hs_notice}</span> --%>
<%-- 						<span class="card-text"> 프로필: ${item.hs_profile } </span> --%>
<%-- 						<span class="card-text"> 주소: ${item.hs_fulladdr } </span> --%>
<%-- 						<span class="card-text"> 영업시간: ${item.hs_starttime}시 -${item.hs_endtime}시</span>	 --%>
					</div>
					<div class="horizontal-card-footer">
						<span class="card-text"> 별점: 미구현 </span>
						<!-- <a class="card-text status">좋아요수: 미구현</a> -->
						<!-- <a class="card-text status">#Save</a> -->
						<!-- <button>북마크</button> -->
<!-- 						<button style="width:40pt;height:25pt;">예약</button> -->
						<c:if test="${not empty login }">
							<a href='javascript: like_func("${item.hs_no}")'>좋아요 해제</a>
						</c:if>
						<button>예약</button>
					</div>
				</div>
				<input type="hidden" name="hsNo" value="${item.hs_no}">
			</form>
		</c:forEach>
	</div>
</div>
<div id="mypage">
   <%@include file="/decorator/membersMypage.jsp" %>
</div>
</body>
</html>