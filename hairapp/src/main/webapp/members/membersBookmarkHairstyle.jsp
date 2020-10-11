<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/designerCard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="../decorator/membersDesigner.css">
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
<script src="../js/designerBookmark.js"></script>>
</head>
<body>
<div id="wrap">
	<h3>헤어샵 북마크 리스트</h3>
<%-- 	<c:forEach items="${list }" var="item"> --%>
<%-- 		헤어샵번호: ${item.hs_no } <br> --%>
<%-- 		헤어샵이름: ${item.hs_name} <br> --%>
<%-- 	</c:forEach> --%>
	
	<div class="row">
    	<c:forEach items="${list}" var="hairInfo" >
    		<form class="col-md-3 col-sm-6" action="../members/hairshopInfo.do" method="post">
		            <div class="product-grid4">
		                <div class="product-image4">
	                        <img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-1.jpg">
	                        <img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg">
		                </div>
		                <div class="product-content">
		                	<c:if test="${not empty sessionScope.login }">
			                	<a href='javascript: like_func("${hairInfo.hhi_no}")'>
									<c:if test="${hairInfo.hhi_book == 1 }">
										<img class="img-${hairInfo.hhi_no}" src="../images/bookmark/heart.png" width="30" height="30">
									</c:if>
									<c:if test="${hairInfo.hhi_book != 1 }">
										<img class="img-${hairInfo.hhi_no}" src="../images/bookmark/empty_heart.png" width="30" height="30">
									</c:if>
								</a>
							</c:if>
		                    <h3 class="title">${hairInfo.hhi_name}</h3>
		                    <h3 class="title">${hairInfo.hhi_time}시간</h3>
		                    <div class="price">${hairInfo.hhi_price}원</div>
		                    <!-- <a class="add-to-cart" href="">예약하기</a>
		                     -->
		                     <button class="add-to-cart">이동하기</button>
		                </div>
		            </div>
		            <input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
		            <input type="hidden" name="hhiNo" value="${hairInfo.hs_no}">
	        </form>
        </c:forEach>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<div id="mypage">
   <%@include file="/decorator/membersMypage.jsp" %>
</div>
</body>
</html>