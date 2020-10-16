<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>헤어 모아보기</title>
<link rel="stylesheet" href="../css/membersHairshop.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="../decorator/membersDesigner.css">
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="../js/hairBookmark.js"></script>

<style>
/* 슬라이더 */
input.set { display:none; }

#slide1:checked ~ .mask .overflow { margin-left:0; }
#slide2:checked ~ .mask .overflow { margin-left:-100%; }

#slides { margin:35px auto; width:80%; position:relative; 
text-align:center; font-family:Helvetica; font-size:3em; color:white;}

#slides .mask { width:90%; overflow:hidden; margin:auto; }

#slides .overflow { width:400%; -webkit-transform:translateZ(0); -webkit-transition:all 0.5s ease-out; -moz-transition:all 0.5s ease-out; -o-transition:all 0.5s ease-out; transition:all 0.5s ease-out; }

#slides .slide { width:25%; height:200px; line-height:200px; float:left; background:#fff; }

#controls { width:100%; }

#controls label { display:none; width:5%; height:60px; opacity:0.3; position:absolute; top:50%; margin-top:-30px; cursor:pointer; background:#000; }

#controls label:hover { opacity:0.8; }

#slide1:checked ~ #controls label:nth-child(2) { right:0; display:block; }

#slide2:checked ~ #controls label:nth-child(1), #slide3:checked ~ #controls label:nth-child(2) { left:0; display:block; }
/* 슬라이더끝 */
</style>
</head>
<body>

<!-- 맨위에 선 -->
<div id="headerLine">
</div>

<!-- 슬라이더 -->
<div id="slides">
  <input checked type="radio" name="slider" id="slide1" class="set" />
  <input type="radio" name="slider" id="slide2" class="set" />
  <input type="radio" name="slider" id="slide3" class="set" />
  <input type="radio" name="slider" id="slide4" class="set" />  
		  
  <div class="mask">    
    <div class="overflow">
      
      <div class="slide" style="background:lightsteelblue;">${shop.hs_name} 입니다</div>
      <div class="slide" style="background:#85b;">${shop.hs_profile}</div>
      
    </div>    
  </div>

  <div id="controls" onclick="">  
    <label for="slide1"></label>
    <label for="slide2"></label>
    <label for="slide3"></label>
    <label for="slide4"></label>    
  </div>
</div>

<!-- 미용실정보 -->
<br>
<div id="shopInfo">
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<img src="../images/members/curling-hair.png" style="width: 95px; height: 95px;">
	<div id="shopName">
		<div id="hsname">
			<h4><b>${shop.hs_name}</b></h4>
		</div>
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
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<img src="../images/members/curling-hair.png" style="width: 95px; height: 95px;">
</div>

<!-- 바디안에 메뉴바 -->
<br>
<div id="menubar">
	<div id="shopdata">
		헤어 모아보기
	</div>
</div>

<!-- 바디안에 -->
<div id="shopbody">


	<div class="container">
    <h3 class="h3"></h3>
	
	
	
	
	<c:forEach items="${list}" var="hairInfo">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid4">
                <div class="product-image4">
                	<img class="pic-1" src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/hair/${hairInfo.hhi_no}/profile&img_name=${hairInfo.hhmi_file}"
		                			onerror="this.src='http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg'">
                </div>
                <div class="product-content" >
<!--                 	------------------------------------- -->
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
						<div class="price">${hairInfo.hhi_name}</div>
					</div>
				</div>
				<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
			</div>
		</c:forEach>
    
</div>	<!-- container 마지막 -->
<%--
<div class="container">
		<c:forEach items="${list}" var="hairInfo">
			<div class="col-md-3 col-sm-6">
				<div class="product-grid4">
					<div class="product-image4">
<!-- 						<img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-1.jpg"> -->
						<img class="pic-1" src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/hair/${hairInfo.hhi_no}/profile&img_name=${hairInfo.hhmi_file}"
		                			onerror="this.src='http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg'">
<!-- 						<img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg"> -->
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
						<div class="price">${hairInfo.hhi_name}</div>
					</div>
				</div>
				<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
			</div>
		</c:forEach>
</div>	<!-- container 마지막 -->
 --%>
 
<hr>
</div>	<!-- shopbody 마지막 -->


<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>


</body>
</html>