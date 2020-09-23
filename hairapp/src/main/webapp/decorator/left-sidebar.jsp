<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>

<html>
<head>
<title>Imagination by TEMPLATED</title>
<style>
#user {
	width: 30px;
	height: 30px;
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
					<a
						href="${pageContext.request.contextPath }/members/membersLogin.do">로그인
					</a>
				</c:if>
				<c:if test="${not empty loginid }">
					<%=session.getAttribute("loginid")%>님 로그인 되었습니다 
				<img
						src="${pageContext.request.contextPath}/images/members/user-bubble.png"
						id="user" />  |
				<a
						href="${pageContext.request.contextPath }/members/membersLogout.do">로그아웃</a>
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

</body>
</html>