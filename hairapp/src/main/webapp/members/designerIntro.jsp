<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>디자이너 소개</title>
<link rel="stylesheet" href="../css/membersHairshop.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="../decorator/membersDesigner.css">
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>

<!-- 맨위에 선 -->
<div id="headerLine">
</div>

<!-- 슬라이더 -->
<div id="divSlider">

<section id="contenedor">
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<ul id="slider">
		<li>
			<div><p>상민미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
		<li>
			<div><p>송현미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
		<li>
			<div><p>강산미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
		<li>
			<div><p>승연미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
	</ul>
</section>

</div>

<!-- 미용실정보 -->
<br>
<div id="shopInfo">
	<div id="shopName">
		<c:forEach items="${intro}" var="in">
		<h4>${in.hs_name}</h4>
		<h6>${in.hs_fulladdr}</h6>
		</c:forEach>
	</div>
	<div id="shopStar1">
		★★★★★
	</div>
	<div id="shopStar2">
		<br><h4>4.9</h4>
	</div>
	<div id="reviewBook">
		리뷰 1000+<br>
		북마크 1000+
	</div>

</div>

<!-- 바디안에 메뉴바 -->
<br>
<div id="menubar">
	<div id="shopdata">
		디자이너 소개
	</div>
</div>

<!-- 바디안에 -->
<div id="shopbody">

<form method="post" action="hsDesignerIntro.do" name="form" id="form">
			 <c:forEach items="${intro}" var="in">
			
	<div class="container">
    <h3 class="h3"></h3>
    <div class="row">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid4">
                <div class="product-image4">
                    <a href="#">
                        <img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-1.jpg">
                        <img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg">
                    </a>
                </div>
                <div class="product-content">
                    <h3 class="title">${in.designer_name}</h3>
                    <h3 class="title">${in.position}</h3>
                    <div class="price">
                        ${in.designer_profile}
                    </div>
                    <a class="add-to-cart" href="">예약하기</a>
                </div>
            </div>
        </div>
    </div>
</div>
<hr>
			
			
			</c:forEach>
		</form>

</div>


<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>


</body>
</html>