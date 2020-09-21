<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE HTML>
<!--
	Imagination by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Imagination by TEMPLATED</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/tion/css/skel-noscript.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/tion/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/tion/css/style-desktop.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/tion/js/skel.min.js"></script>
<script
	src="${pageContext.request.contextPath }/tion/js/skel-panels.min.js"></script>
<script src="${pageContext.request.contextPath }/tion/js/init.js"></script>
<decorator:head></decorator:head>
</head>
<body>

	<div id="header-wrapper">

		<!-- Header -->
		<div id="header">
			<div id="box">
				<a href="${pageContext.request.contextPath}/members/memberMain.jsp">logout</a>
				/<a href="${pageContext.request.contextPath}/members/memberMain.jsp">
					my page</a>
			</div>
			<div class="container">

				<!-- Logo -->
				<div id="logo">
					<h1>
						<a
							href="${pageContext.request.contextPath}/members/membersMain.do">salon</a>
					</h1>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="left-sidebar.html">우리동네설정 </a></li>
						<li class="active"><a href="left-sidebar.html">우리동네 미용실
								모아보기</a></li>
						<li><a href="left-sidebar.html">우리동네 미용실 순위</a></li>
						<li><a href="no-sidebar.html">우리동네 디자이너 순위</a></li>

						<li><a href="no-sidebar.html">인기 헤어 순위</a></li>

					</ul>
				</nav>

			</div>
		</div>
		<!-- Header -->

		<!-- Banner -->
		<!-- <div id="banner">
			<div class="container"></div>
		</div> -->
		<!-- /Banner -->

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



	<!-- Copyright -->
	<div id="copyright">
		<div class="container">
			Design: <a href="http://templated.co">TEMPLATED</a> Images: <a
				href="http://unsplash.com">Unsplash</a> (<a
				href="http://unsplash.com/cc0">CC0</a>)
		</div>
	</div>


</body>
</html>