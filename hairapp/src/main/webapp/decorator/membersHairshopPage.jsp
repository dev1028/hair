<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersHairshopPage</title>

<style>
/* 맨위에 선 */
#header {
	width:100%;
	height: 5px;
	background-color: #d8ddee;
}
/* 미용실 이름 상단 */
#shopInfo {
	width:100%;
	height:100px;
	background-color: #d8ddee;
}

/* 왼쪽메뉴 */
#mypage {
	display: flex;
	position:absolute;
	top:420px;
	left:0px;
}


/* 메뉴바 */
#menubar{
	right:0px;
	position:absolute;
	width:80%;
	height:50px;
	background-color: #d8ddee;
}


/* 슬라이더 */
ul{
	display: block;
	margin: 0;
	padding: 0;
}
li{
	display: inline-block;
}

p{
	color: white;
  font-size:1.2em;
  font-weight:100;
  letter-spacing:1px;
}

#contenedor{
	box-shadow: 0px 0px 2px 2px rgba(0, 0, 0, 0.3);
	width:600px;
	height: 250px;
	margin: 20px auto 0 auto;
	overflow:hidden;
	position: relative;
}
#slider{
	width: 2400px; /* *600px la dimension de la imagen */
	height: 200px;
	position: relative;
	transition: all 500ms ease-in-out;
	-webkit-filter: grayscale(100%); /* funciona correctamente en Chrome solo webKit */
  -webkit-backface-visibility: hidden;
}
#slider div{
	background: rgba(0,0,0,.5);
	position: absolute;
	padding: 7px;
	bottom: 2px;
	left: 0px;
	width: 100%;
}

#slider li:nth-child(1){
	position: absolute;
	top: 0px;
	left: 0px;
}
#slider li:nth-child(2){
	position: absolute;
	top: 0px;
	left: 600px;
}
#slider li:nth-child(3){
	position: absolute;
	top: 0px;
	left: 1200px;
}
#slider li:nth-child(4){
	position: absolute;
	top: 0px;
	left: 1800px;
}

.mini{
	-webkit-filter: grayscale(100%);
	cursor: ew-resize;
	float: left;
	margin-top: 200px;
	width: 25%;
	transition: all .5s linear;
}

.mini:hover{
	-webkit-filter: grayscale(0%);
}

#contenedor div:nth-child(1):hover ~ #slider{
  transform: translateX(0px) translateZ(0px);
	-webkit-filter: grayscale(0%);
}
#contenedor div:nth-child(2):hover ~ #slider{
  transform: translateX(-600px) translateZ(0px);
	-webkit-filter: grayscale(0%);
}
#contenedor div:nth-child(3):hover ~ #slider{
  transform: translateX(-1200px) translateZ(0px);
	-webkit-filter: grayscale(0%);
}
#contenedor div:nth-child(4):hover ~ #slider{
  transform: translateX(-1800px) translateZ(0px);
	-webkit-filter: grayscale(0%);
}
</style>

</head>
<body>
<!-- 맨위에 선 -->
<div id="header">
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
</div>

<!-- 바디안에 메뉴바 -->
<br>
<div id="menubar">
</div>


<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>





</body>
</html>