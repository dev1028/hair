<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/designerCard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="../decorator/membersDesigner.css">
<title>지역별 디자이너 순위</title>
<script src="../js/designerBookmark.js"></script>
<script src="../js/locationFromIP.js"></script>
</head>
<body>
<c:if test="${empty lat }">
<script>
	setLocationFromIP();
</script>
</c:if>
<div class="container">
    <h3 class="h3">지역별 디자이너 순위</h3>
    <div class="row">
    	<c:forEach items="${list}" var="designerInfo" >
<!--     		<form class="col-md-3 col-sm-6" action="../members/designerSelectResult.do" method="post"> -->
				<form class="col-md-3 col-sm-6" action="../members/hairshopInfo.do" method="post"> 
		            <div class="product-grid4">
		                <div class="product-image4">
	                        <img class="pic-1" 	src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/designer/${designerInfo.designer_no}/profile&img_name=${designerInfo.file_name}" 
	                        					onerror="this.src='http://bestjquery.com/tutorial/product-grid/demo6/images/img-3.jpg'">
	                        
<!-- 	                        <img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo6/images/img-4.jpg"> -->
		                </div>
		                <div class="product-content">
		                	<c:if test="${not empty sessionScope.login }">
			                	<a href='javascript: like_func("${designerInfo.designer_no}")'>
									<c:if test="${designerInfo.designer_book == 1 }">
										<img class="img-${designerInfo.designer_no}" src="../images/bookmark/heart.png" width="30" height="30">
									</c:if>
									<c:if test="${designerInfo.designer_book != 1 }">
										<img class="img-${designerInfo.designer_no}" src="../images/bookmark/empty_heart.png" width="30" height="30">
									</c:if>
								</a>
							</c:if>
							<span class="title">${designerInfo.designer_name} </span><br>
<%-- 							<span class="title">프로필: ${designerInfo.designer_profile} </span><br> --%>
							<span class="title">거리: ${designerInfo.distance} km </span><br>
<%-- 							<span class="title">직책: ${designerInfo.position} </span><br> --%>
							<span class="title">시간: ${designerInfo.work_start_time}시 - ${designerInfo.work_end_time}시 </span><br>
<%-- 							<span class="title">휴일: ${designerInfo.designer_dayoff} </span><br> --%>
							<button class="add-to-cart">이동하기</button>
<%-- 		                    <h3 class="title"><a href="#">${hairInfo.hhi_name}</a></h3> --%>
<%-- 		                    <h3 class="title"><a href="#">${hairInfo.hhi_time}시간</a></h3> --%>
<%-- 		                    <div class="price">${hairInfo.hhi_price}원</div> --%>
<!-- 		                    <a class="add-to-cart" href="">예약하기</a>
<!-- 		                     <button class="add-to-cart">예약하기</button> -->
		                </div>
		            </div>
		            <div>
						<input type="hidden" name="designerNo" value="${designerInfo.designer_no}">
						<input type="hidden" name="hsNo" value="${designerInfo.hs_no}">
<%-- 						<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}"> --%>
					</div>
	        </form>
        </c:forEach>
    </div>
</div>
<hr>

</body>
</html>