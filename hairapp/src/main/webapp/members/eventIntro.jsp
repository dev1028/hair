<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h4>미용실이름</h4>
		<h6>미용실주소</h6>
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
		쿠폰과이벤트
	</div>
</div>




<!-- 여기서부터 본문. div shopbody 부터 본문시작-->
<div id="shopbody">

<!-- 본문쓰면됨 여기에 -->
<div class="container">
<div class="col-sm-12">
<div class="bs-calltoaction bs-calltoaction-primary">
	<div class="row">
		<div class="col-md-9 cta-contents">
			<h1 class="cta-title">쿠폰이름적기</h1>
				<div class="cta-desc">
					<p>ㅇㅇ미용실의 쿠폰을 받으세요</p>
					<br><p>할인률 : ㅇㅇ%</p>
					<p>최대할인 금액 : ㅇㅇ원</p>
					<p>현재 ㅇㅇ개 남았습니다</p>
				</div>
		</div>
		<div class="col-md-3 cta-button">
			<a href="#" class="btn btn-lg btn-block btn-primary">쿠폰받기</a>
		</div>
	</div>
</div>
</div>
</div>









</div>

<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>
</body>
</html>