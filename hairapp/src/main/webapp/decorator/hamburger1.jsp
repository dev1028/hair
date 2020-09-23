<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>

//Click the hamburger menu to see the animation
//You can click the X to close or click anywhere outside the menu

$(document).ready(function(){
	$('.hamburger-shell').click(function(){
		$('#menu').slideToggle(300);
		$('.top').toggleClass('rotate');
		$('.middle').toggleClass('rotate-back');
		$('.menu-name').toggleClass('bump');
	});
	$('.bg-cover').click(function(){
		$('#menu').slideToggle(300);
		$('.top').toggleClass('rotate');
		$('.middle').toggleClass('rotate-back');
		$('.menu-name').toggleClass('bump');
	})
});

</script>
<style>

body {
	background-color: #fafafa;
}

.reveal {
	opacity: .85;
	display: block;
	pointer-events: auto;
	visibility: visible;
}

.hamburger-shell {
	margin: 0;
	position: fixed;
	overflow: hidden;
	width: 70px;
	height: 100px;
	overflow: auto;
	left: calc(100% - 100px);
	top: 20px;
	cursor: pointer;
}

.top, .middle{
	position: absolute;
	width: 62px;
	height: 10px;
	background-color: black;
	transition: all 350ms ease-in-out;
	top: 20px;
}

.middle {
	top: 40px;
}

#menu {
	position: fixed;
	left: calc(100% - 292px);
	top: 10px;
	color: black;
	display: none;
	margin: 120px 30px;
	text-decoration: none;
	font-family: Arial, sans-serif;
	font-weight: 100;
	font-size: 20px;
	text-transform: uppercase;
	color: #333;
	padding: 24px;
	width: 200px;
	text-align: right;
}

#menu a li {
	text-decoration: none!important;
	padding-bottom: 10px;
	margin-bottom: 12px;
	border-bottom: 1px solid black;
	list-style: none;
	color: #555;
	transition: all 150ms ease;
}

#menu a li:hover {
	color: #00abff;
	padding-right: 3px;
}

#menu a li:hover:after {
}



#menu a {
	text-decoration: none;
}

.rotate {
	transform: rotate(225deg);
	-webkit-transform: rotate(225deg);
	top: 30px;
	background-color: red;
	height: 2px;
}

.rotate-back {
	transform: rotate(-225deg);
	-webkit-transform: rotate(-225deg);
	top: 30px;
	background-color: red;
	height: 2px;
}

.top {
-webkit-animation-delay: 100ms;
}

.middle {
-webkit-animation-delay: 250ms;
}

.bottom {
	-webkit-animation-delay: 400ms;
}

.menu-name {
	font-family: Verdana;
	font-weight: 900;
	color: black;
	font-size: 14px;
	text-decoration: none;
	position: absolute;
	top: 56px;
	left: -1px;
	transition: all 350ms;
}

.bump {
	top: 64px;
	color: red;
}

</style>
</head>
<body>

<a class="hamburger-shell">
	<div class="hamb top"></div>
		<div class="hamb middle"></div>
	<div class="menu-name">MYPAGE</div>

<ul id="menu">
		<a href="#"> <li>Home</li></a>
		<a href="#"> <li>Portfolio</li></a>
		<a href="#"> <li>About Us</li></a>
		<a href="#"> <li>Locations</li></a>
		<a href="#"> <li>Contact</li></a>
</ul>
</a>	

</body>
</html>