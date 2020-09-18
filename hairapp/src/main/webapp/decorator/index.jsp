<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>

<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<title>Modelling by TEMPLATED</title>
<link href="http://fonts.googleapis.com/css?family=Abel"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath }/decorator/style.css"
	rel="stylesheet" type="text/css" media="screen" />
<%-- <link href="${pageContext.request.contextPath }/decorator/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/decorator/jquery-ui.js"></script> --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>
	$(function() {
		$('.acc_ctrl').on('click', function(e) {
			e.preventDefault();
			if ($(this).hasClass('active')) {
				$(this).removeClass('active');
				$(this).next().stop().slideUp(300);
			} else {
				$(this).addClass('active');
				$(this).next().stop().slideDown(300);
			}
		});
	});
</script>
<decorator:head></decorator:head>
</head>
<body>

	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="#">hair shop </a>
			</h1>
			<p>
				Design by <a href="http://templated.co" rel="nofollow">강산잉</a>
			</p>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="#">예약</a></li>
				<li><a href="# ">제품</a></li>
				<li><a href="#">회원</a></li>
				<li><a href="#">매출</a></li>
				<li><a href="#">직원</a></li>
				<li><a href="#">디자이너</a></li>
			</ul>
		</div>
	<!-- 	<div id="btnox">
			<ul>
				<li><button>HOME</button></li>
				<li><button>LOGOUT</button></li>
			</ul>
		</div> -->

	</div>

	<div class="navBar">

		<ul class="acc">
			<li>
				<button class="acc_ctrl">
					<h4>고객간편등록</h4>
				</button>
				<div class="acc_panel">
					<p></p>
				</div>
			</li>
			<li>
				<button class="acc_ctrl">
					<h4>고객예약현황</h4>
				</button>

			</li>
			<li>
				<button class="acc_ctrl">
					<h4>고객대기현황</h4>
				</button>

			</li>
		</ul>
	</div>
















	<decorator:body></decorator:body>
</body>
</html>
