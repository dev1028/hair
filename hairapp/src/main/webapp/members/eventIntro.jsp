<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersHairshopPage</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="../decorator/membersDesigner.css">
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
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


/* 쿠폰박스 */
.bs-calltoaction{
    position: relative;
    width:auto;
    padding: 15px 25px;
    border: 1px solid black;
    margin-top: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
}

.bs-calltoaction > .row{
        display:table;
        width: calc(100% + 30px);
}
     
.bs-calltoaction > .row > [class^="col-"],
.bs-calltoaction > .row > [class*=" col-"]{
        float:none;
        display:table-cell;
        vertical-align:middle;
}

.cta-contents{
        padding-top: 10px;
        padding-bottom: 10px;
}

.cta-title{
        margin: 0 auto 15px;
        padding: 0;
}

.cta-desc{
        padding: 0;
}

.cta-desc p:last-child{
        margin-bottom: 0;
}

.cta-button{
        padding-top: 10px;
        padding-bottom: 10px;
}

@media (max-width: 991px){
    .bs-calltoaction > .row{
        display:block;
        width: auto;
}

    .bs-calltoaction > .row > [class^="col-"],
    .bs-calltoaction > .row > [class*=" col-"]{
        float:none;
        display:block;
        vertical-align:middle;
        position: relative;
}

     .cta-contents{
        text-align: center;
}
}
.bs-calltoaction.bs-calltoaction-primary{
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
}
.bs-calltoaction.bs-calltoaction-primary .cta-button .btn{
    border-color:#fff;
}

</style>
<script>
function qqq() {
	alert('로그인이 필요합니다');
}
</script>

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
</div>

<!-- 바디안에 메뉴바 -->
<br>
<div id="menubar">
<div id="shopdata">
		쿠폰과이벤트
	</div>
</div>




<!-- 여기서부터 본문. div shopbody 부터 본문시작-->
<div id="shopbody">

<!-- 본문쓰면됨 여기에 -->
<div class="container">
<c:if test="${empty intro}">
	쿠폰이 없습니다<br><br>
</c:if>
<c:forEach items="${intro}" var="in">
<form action="hsCouponIssuance.do">
<div class="col-sm-12">
<div class="bs-calltoaction bs-calltoaction-primary">
	<div class="row">
		<div class="col-md-9 cta-contents">
			<h1 class="cta-title">${in.hsc_name}</h1>
				<div class="cta-desc">
					<p>${shop.hs_name}의 쿠폰을 받으세요</p>
					<br><p>할인률 : ${in.hsc_discount_rate}%</p>
					<p>최대 할인 금액 : ${in.hsc_maxdiscount_pay}원</p>
					<p>최대 사용 일자 : 10일</p>
					<p>현재 ${in.hsc_coupon_quantity}개 남았습니다</p>
				</div>
		</div>
		<div class="col-md-3 cta-button">
			<c:if test="${empty sessionScope.memNo}">
				<a href="hsEventIntro.do" class="btn btn-lg btn-block btn-primary" onclick="qqq()">쿠폰받기</a>
			</c:if>
			<c:if test="${not empty sessionScope.memNo}">
				<a href="hsCouponIssuance.do?hsc_no=${in.hsc_no}&hsc_coupon_quantity=${in.hsc_coupon_quantity}" class="btn btn-lg btn-block btn-primary">쿠폰받기</a>
			</c:if>
		</div>
	</div>
</div>
</div>
<%-- <input type="hidden" value="${in.hsc_no}" name="hsc_no"> --%>
</form>
</c:forEach>
</div>
<br><br><br><br><br>







</div>

<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>
</body>
</html>