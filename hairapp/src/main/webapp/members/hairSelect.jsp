<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="../decorator/membersDesigner.css">

</head>
<body>
<div class="container">
    <h3 class="h3">헤어 정보</h3>
    <div class="row">
    	<c:forEach items="${list}" var="hairInfo" >
    		<form class="col-md-3 col-sm-6" action="../members/hairSelectResult.do" method="post">
		            <div class="product-grid4">
		                <div class="product-image4">
	                        <img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-1.jpg">
	                        <img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg">
		                </div>
		                <div class="product-content">
		                    <h3 class="title">${hairInfo.hhi_name}</h3>
		                    <h3 class="title">${hairInfo.hhi_time}시간</h3>
		                    <div class="price">${hairInfo.hhi_price}원</div>
		                    <!-- <a class="add-to-cart" href="">예약하기</a>
		                     -->
		                     <button class="add-to-cart">예약하기</button>
		                </div>
		            </div>
		            <input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
	        </form>
        </c:forEach>
    </div>
</div>
<hr>
</body>
</html>