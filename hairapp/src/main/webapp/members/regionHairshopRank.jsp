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
<link rel="stylesheet" type="text/css" href="../css/designerCard.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="../decorator/membersDesigner.css">
<style>
div.course{
	padding: 10px;
	margin:0 auto;
}
</style>
<script>
	function like_func(hs_no) {
		$.ajax({
			url : "../ajax/hairshopBookmark.do",
			type : "POST",
			cache : false,
			dataType : "json",
			data : 'hs_no=' + hs_no,
			success : function(data) {
				findClass = ".img-" + hs_no;
				if(data.type == "add"){
					$(findClass).attr("src", "../images/bookmark/heart.png");
				}else{
					$(findClass).attr("src", "../images/bookmark/empty_heart.png");
				}
			},
			error : function(request, status, error) {
				alert("에러 발생!!")
			}
		});
	}
</script>
</head>
<body>
	
<div class="container">
    <h3 class="h3">지역별 헤어샵 순위</h3>
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

<%--
	<div class="cardContainer">
		<c:forEach items="${list}" var="item">
			<form action="../members/hairshopSelectResult.do" method="post">
				<div class="horizontal-card">
					<img class="card_image" src="../images/hairshop/signin-image.jpg" width="200" height="130">
					<div class="horizontal-card-body">
						<h4 class="card-title"><a href="hairshopInfo.do?hsNo=${item.hs_no}">${item.hs_name }</a></h4>
						<span>공지: ${item.hs_notice}</span>
						<span class="card-text"> 거리: ${item.distance } km </span>
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