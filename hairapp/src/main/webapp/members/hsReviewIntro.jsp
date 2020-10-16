<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어샵 리뷰 보기 페이지</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="../css/membersHairshop.css">
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


.review-wrapper {
  display: table;
  font-family: "Roboto";
}

.review-image {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  border-radius: 50%;
  -webkit-box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  -moz-box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  border-radius: 50%;
  width: 100px;
  height: 100px;
  background-color: lightsteelblue;
}

.review-info {
  background: #fff;
  margin-left: 50px;
  padding: 10px 10px 50px 90px;
  border-radius: 6px;
  -webkit-box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  -moz-box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.25);
  width: 1300px;
}

.first-line {
  float: left;
  width: 100%;
  padding-bottom: 15px;
}

.review-stars {
  float: left;
  padding: 5px 0;
}

.review-name {
  float: right;
  padding: 5px 10px 5px 0;
}

.review-name span {
  text-transform: uppercase;
  font-size: 20px;
  color: #757575;
}

.fa-star-o,
.fa-star-half-empty,
.fa-star-half-full,
.fa-star-half-o,
.fa-star {
  padding-right: 10px;
}

.fa-star-o:before,
.fa-star-half-empty:before,
.fa-star-half-full:before,
.fa-star-half-o:before,
.fa-star:before {
  font-size: 25px;
  color: #d4af37;
}

.review-text {
  margin-bottom: 10px;
}

.review-text span {
  display: block;
  color: #666;
  font-size: 16px;
}

.review-time a span {
  float: right;
  font-size: 12px;
  color: #5890ff;
  padding-right: 10px;
}

.review-time a span:hover {
  text-decoration: underline;
}

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
		후기 및 리뷰
	</div>
</div>




<!-- 여기서부터 본문. div shopbody 부터 본문시작-->
<div id="shopbody">

<!-- 본문쓰면됨 여기에 -->

<c:if test="${empty intro}">
	후기가 없습니다<br><br>
</c:if>
<!-- css -->
<c:forEach items="${intro}" var="in">
<div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="review-wrapper">
          <div class="review-image">
          </div>
          <div class="review-info">
          <div class="review-stars">
          	<c:if test="${in.hr_rate == 5}">
          		<span>★★★★★</span>
          	</c:if>
          	<c:if test="${in.hr_rate == 4}">
          		<span>★★★★☆</span>
          	</c:if>
          	<c:if test="${in.hr_rate == 3}">
          		<span>★★★☆☆</span>
          	</c:if>
          	<c:if test="${in.hr_rate == 2}">
          		<span>★★☆☆☆</span>
          	</c:if>
          	<c:if test="${in.hr_rate == 1}">
          		<span>★☆☆☆☆</span>
          	</c:if>
          </div>
          <div class="review-name">
             <span>${in.hr_writer}</span>
          </div><br><br>
           <div class="review-text">
             <span>${in.hr_contents}</span>
           </div>
            <div class="review-meta">
              	<div class="review-time">
                	<a><span>${in.hr_writedate}</span></a>
         		</div>
        	</div>
      </div>
    </div>
  </div>
</div>
</div>
<br>
<hr>
<br>
</c:forEach>
<!-- css끝 -->






</div> <!-- shopbody끝 -->

<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>
</body>
</html>