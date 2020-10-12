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

<script>
	function like_func(designer_no) {
		$.ajax({
			url : "../ajax/designerBookmark.do",
			type : "POST",
			cache : false,
			dataType : "json",
			data : 'designer_no=' + designer_no,
			success : function(data) {
				findClass = ".img-" + designer_no;
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
		<h4>${shop.hs_name}</h4>
		<h6>${shop.hs_fulladdr}</h6>
	</div>
	<div id="shopStar1">
		<c:choose>
			<c:when test="${shop2.hr_rate > 4.5}">
	        	★★★★★
	        </c:when>
	        <c:when test="${shop2.hr_rate > 3.5}">
	        	★★★★☆
	        </c:when>
	        <c:when test="${shop2.hr_rate > 2.5}">
	        	★★★☆☆
	        </c:when>
	        <c:when test="${shop2.hr_rate > 1.5}">
	        	★★☆☆☆
	        </c:when>
	        <c:when test="${shop2.hr_rate > 0.5}">
	        	★☆☆☆☆
	        </c:when>
	        <c:when test="${empty shop2.hr_rate}">
	        	☆☆☆☆☆
	        </c:when>
        </c:choose>
	</div>
	<div id="shopStar2">
		<c:choose>
			<c:when test="${empty shop2.hr_rate}">
	        	<br><h4>0.0</h4>
	        </c:when>
	        <c:when test="${shop2.hr_rate > 0.0}">
	        	<br><h4>${shop2.hr_rate}</h4>
	        </c:when>
	    </c:choose>
	</div>
	<div id="reviewBook">
		<c:choose>
			<c:when test="${shop2.hs_no > 0}">
	        	리뷰수 : ${shop2.hs_no} +<br>
	        </c:when>
	        <c:when test="${empty shop2.hs_no}">
	        	리뷰수 : 리뷰가 없습니다<br>
	        </c:when>
	    </c:choose>
		<c:choose>
			<c:when test="${shop3.hs_no > 0}">
				북마크 : ${shop3.hs_no} +
			</c:when>
			<c:when test="${empty shop3.hs_no}">
				북마크 : 북마크가 없습니다
			</c:when>
		</c:choose>
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
			
	<div class="container">
    <h3 class="h3"></h3>
	<c:if test="${empty intro}">
		디자이너가 없습니다<br><br>
	</c:if>
	<c:forEach items="${intro}" var="in">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid4">
                <div class="product-image4">
                        <img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-1.jpg">
                        <img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg">
                </div>
                <div class="product-content">
                    <h3 class="title">${in.designer_name}</h3>
                    <h3 class="title">${in.position}</h3>
                    <div class="price">
                        ${in.designer_profile}
                    </div>
                    <c:if test="${not empty sessionScope.login }">
                    	<a href='javascript: like_func("${in.designer_no}")'>
                    	<c:if test="${in.designer_book == 1 }">
                    		<%-- <a class="add-to-cart" href="${in.designer_no}">북마크</a><br><br> --%>
                    		<img class="img-${in.designer_no}" src="../images/bookmark/heart.png" width="30" height="30">
                    	</c:if>
                    	<c:if test="${in.designer_book != 1 }">
							<img class="img-${in.designer_no}" src="../images/bookmark/empty_heart.png" width="30" height="30">
						</c:if>
                    	</a>
                    </c:if>
                    
                    <input type="hidden" name="hsNo" value="${in.hs_no}"><br>
                </div>
            </div>
        </div>
			</c:forEach>
    
</div>	<!-- container 마지막 -->
<hr>
			
			
</form>

</div>	<!-- shopbody 마지막 -->


<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>


</body>
</html>