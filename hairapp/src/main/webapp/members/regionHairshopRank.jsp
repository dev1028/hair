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
<script>
	function like_func(hs_no) {
// 		var frm_read = $('#frm_read');
// 		var boardno = $('#boardno', frm_read).val();
// 		//var mno = $('#mno', frm_read).val();
// 		//console.log("boardno, mno : " + boardno +","+ mno);
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
				
				
				
				//alert($(findClass).val());
				
			},
			error : function(request, status, error) {
				alert("에러 발생!!")
// 				alert("code:" + request.status + "\n" + "message:"
// 						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
</script>
</head>
<body>
	지역별 헤어샵 순위
	
	<div class="cardContainer">
		<c:forEach items="${list}" var="item">
			<form action="../members/hairshopSelectResult.do" method="post">
				<div class="horizontal-card">
					<img class="card_image" src="../images/hairshop/signin-image.jpg" width="200" height="130">
					<div class="horizontal-card-body">
						<h4 class="card-title"><a href="hairshopInfo.do?hsNo=${item.hs_no}">${item.hs_name }</a></h4>
						<span>공지: ${item.hs_notice}</span>
<%-- 						<span class="card-text"> 프로필: ${item.hs_profile } </span> --%>
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
	
</body>
</html>