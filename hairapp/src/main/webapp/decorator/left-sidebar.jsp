<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/dev1028/hair.git
<html>
<head>
<title>Imagination by TEMPLATED</title>

<style>
<<<<<<< HEAD
#user {
	width: 30px;
	height: 30px;
=======
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
	/* left: calc(100% - 100px); */
	right:0px;
	top: 0px;
	cursor: pointer;
	z-index: 1000;
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
	margin: 70px 80px;
	text-decoration: none;
	font-family: Arial, sans-serif;
	font-weight: 100;
	font-size: 20px;
	text-transform: uppercase;
	color: #333;
	padding: 24px;
	width: 200px;
	text-align: right;
	z-index:1001;
}

#menu a li {
	text-decoration: none!important;
	padding-bottom: 10px;
	margin-bottom: 12px;
	border-bottom: 1px solid black;
	list-style: none;
	color: #555;
	transition: all 150ms ease;
	z-index:1001;
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
>>>>>>> branch 'master' of https://github.com/dev1028/hair.git
}
</style>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.3/css/bootstrap.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/tion/css/style.css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var burgerMenu = function() {

		$('body').on('click', '.js-fh5co-nav-toggle', function(event) {

			if ($('#navbar').is(':visible')) {
				$(this).removeClass('active');
			} else {
				$(this).addClass('active');
			}

			event.preventDefault();

		});

	};

	$(function() {

		$(".navi").click(function(event) {
			/* 		$('.navi').removeClass('active');*/
			$('.active').removeClass('active');
			$(this).addClass('active');
	
			event.preventDefault();
		});
	});
</script>
<decorator:head></decorator:head>
</head>
<body>

	<div id="header-wrapper">

		<!-- Header -->
		<div id="header">
			<div id="box">
				<img src="${pageContext.request.contextPath }/tion/images/gps.png" />

				<a href="">동성로 </a> |
				<c:if test="${empty loginid}">
<<<<<<< HEAD
					<a
						href="${pageContext.request.contextPath }/members/membersLogin.do">로그인
					</a>
=======
					<a href="${pageContext.request.contextPath}/members/membersLogin.do">로그인 </a>
>>>>>>> branch 'master' of https://github.com/dev1028/hair.git
				</c:if>
				<c:if test="${not empty loginid }">
<<<<<<< HEAD
					<%=session.getAttribute("loginid")%>님 로그인 되었습니다 
				<img
						src="${pageContext.request.contextPath}/images/members/user-bubble.png"
						id="user" />  |
				<a
						href="${pageContext.request.contextPath }/members/membersLogout.do">로그아웃</a>
=======
				<%=session.getAttribute("loginid")%>님 로그인 되었습니다 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<div>
					<a class="hamburger-shell">
						<div class="hamb top"></div>
							<div class="hamb middle"></div>
								<div class="menu-name">MYPAGE</div>
									<ul id="menu">
											<a href="${pageContext.request.contextPath}/members/membersMypageTop.do"> <li>마이페이지</li></a>
											<a href="${pageContext.request.contextPath}/members/membersRD.do"> <li>예약내역</li></a>
											<a href="#"> <li>북마크</li></a>
											<a href="#"> <li>쿠폰</li></a>
											<a href="${pageContext.request.contextPath}/members/membersLogout.do"> <li>로그아웃</li></a>
									</ul>
						</a>
				</div>	
				
				<%-- <img src="${pageContext.request.contextPath}/images/members/user-bubble.png" id="user" /> --%>
				<%-- <a href="${pageContext.request.contextPath }/members/membersLogout.do">로그아웃</a> --%>
>>>>>>> branch 'master' of https://github.com/dev1028/hair.git
				</c:if>

			</div>
			<div class="container">

				<!-- Logo -->
				<div id="logo">
					<h1>
						<a class="mainLogo"
							href="${pageContext.request.contextPath}/members/membersMain.do">SALON</a>
					</h1>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="navi">
							<!--  class= "button" --> <a
							href="${pageContext.request.contextPath}/members/myRegionSetting.do">우리동네설정</a>
						</li>
						<li class="navi"><a
							href="${pageContext.request.contextPath}/members/membersMain.do">우리동네
								미용실 모아보기</a></li>
						<li class="navi"><a
							href="${pageContext.request.contextPath}/members/membersMain.do">우리동네
								미용실 순위</a></li>
						<li class="navi"><a
							href="${pageContext.request.contextPath}/members/membersMain.do">우리동네
								디자이너 순위</a></li>

						<li class="navi"><a
							href="${pageContext.request.contextPath}/members/membersMain.do">인기
								헤어 순위</a></li>

					</ul>
				</nav>

			</div>
		</div>


	</div>

	<!-- Main -->
	<div id="main">
		<div class="container">
			<div class="row">


				<decorator:body></decorator:body>

			</div>
		</div>
	</div>
	<!-- Main -->
	
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

</body>
</html>