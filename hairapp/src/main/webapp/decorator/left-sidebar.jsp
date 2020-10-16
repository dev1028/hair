<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 미용실 UDONG#</title>

<style>
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
	right: 0px;
	top: 0px;
	cursor: pointer;
	font-family: 'Do Hyeon', sans-serif;
	z-index: 1000;
}

.top, .middle {
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
	font-family: 'Do Hyeon', sans-serif;
	font-weight: 100;
	font-size: 20px;
	text-transform: uppercase;
	color: #333;
	padding: 24px;
	width: 200px;
	text-align: right;
	z-index: 1001;
}

#menu a li {
	text-decoration: none !important;
	padding-bottom: 10px;
	margin-bottom: 12px;
	border-bottom: 1px solid black;
	list-style: none;
	color: #555;
	transition: all 150ms ease;
	z-index: 1001;
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

/* 맨위에 선 */
#mainLine {
	width:100%;
	height: 5px;
	background-color: #00B4CC;
	z-index: 9999;
}
</style>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.3/css/bootstrap.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/tion/css/style.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- bookmark heart -->
<!-- <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/bodymovin.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js" type="text/javascript"></script> -->
<!-- <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/gziped3.js" type="text/javascript"></script> -->



<script type="text/javascript">


	$(function() {

		$("a").click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
			$('.active').removeClass("active"); // sBtn 속에 (active) 클래스를 삭제 한다.
			$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.

		})
	})

	/* 	$('body').on('click', '.navi', function(event) {
			$('.navi').removeClass('active');

			$('.active').removeClass('active');

			$(this).addClass('active');

			event.preventDefault();
		});
	});
	 */
</script>
<script>
/* ul */
/* $(document).ready(function() {
	  
	  var $wrapper = $('.tab-wrapper'),
	      $allTabs = $wrapper.find('.tab-menu > ul'),
	      $tabMenu = $wrapper.find('.tab-menu li'),
	      $line = $('<div class="line"></div>').appendTo($tabMenu);
	  
	  $allTabs.not(':first-of-type').hide();  
	  $tabMenu.find(':first').width('100%');
	  
	  $tabMenu.each(function(i) {
	    $(this).attr('data-tab', 'tab'+i);
	  });
	  
	  $allTabs.each(function(i) {
	    $(this).attr('data-tab', 'tab'+i);
	  });
	  
	  $tabMenu.on('click', function() {
	    
	    var dataTab = $(this).data('tab'),
	        $getWrapper = $(this).closest($wrapper);
	    
	    $getWrapper.find($tabMenu).removeClass('active');
	    $(this).addClass('active');
	    
	    $getWrapper.find('.line').width(0);
	    $(this).find($line).animate({'width':'100%'}, 'fast');
	    $getWrapper.find($allTabs).hide();
	    $getWrapper.find($allTabs).filter('[data-tab='+dataTab+']').show();
	  });

	});//end ready */
	
	
	function menuGo1() {
        location.href="myRegionSetting.do";
    }
	function menuGo2() {
        location.href="gpsHairshopSearch.do";
    }
	function menuGo3() {
        location.href="regionHairshopRank.do";
    }
	function menuGo4() {
        location.href="regionDesignerRank.do";
    }
	function menuGo5() {
        location.href="regionHairRank.do";
    }
</script>
<decorator:head></decorator:head>
</head>
<body>

	<!-- Header -->
	<div id="header">
		<div id="box">
			<img src="${pageContext.request.contextPath }/tion/images/gps.png" />
			<c:if test="${empty loginid}">
				<a>로그인을 하시면 주소가 도출됩니다</a> |
			</c:if>
			<c:if test="${not empty loginid }">
				<a>${sessionScope.township}</a> |
			</c:if>
			<c:if test="${empty loginid}">
				<font style="color: #6d7fcc; font-weight: bold;"><a href="${pageContext.request.contextPath}/members/membersLogin.do">로그인</a></font>
			</c:if>
			<c:if test="${not empty loginid }">
				<font style="color: #6d7fcc; font-weight: bold;"><%=session.getAttribute("memName")%></font>님 로그인 되었습니다 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<div>
					<a class="hamburger-shell">
						<div class="hamb top"></div>
						<div class="hamb middle"></div>
						<div class="menu-name">MYPAGE</div>
						<ul id="menu">
							<a href="${pageContext.request.contextPath}/members/membersMypageTop.do"> <li>마이페이지</li></a>
							<a href="${pageContext.request.contextPath}/members/membersRD.do"> <li>예약내역</li></a>
							<a href="${pageContext.request.contextPath}/members/membersBookmarkHairshop.do"> <li>북마크</li> </a>
							<a href="${pageContext.request.contextPath}/members/membersCoupon.do"> <li>쿠폰</li> </a>
							<a href="${pageContext.request.contextPath}/members/membersLogout.do"> <li>로그아웃</li></a>
						</ul>
					</a>
				</div>
			</c:if>

		</div>
		<div class="container">

			<!-- Logo -->
			<div id="logo">
				<h1>
					<img src="../images/members/udong.png" style="width: 100px; height: 80px;">
					<a class="mainLogo"href="${pageContext.request.contextPath}/members/membersMain.do">UDONG#</a>
				</h1>
			</div>

			<!-- tab-wrapper -->
			<div class="tab-wrapper">
				<ul class="tab-menu">
					<li class="active" onclick="menuGo1()">
						우리동네설정
					</li>
					<li class="active" onclick="menuGo2()">
						미용실 모아보기
					</li>
					<li class="active" onclick="menuGo3()">
						미용실 순위
					</li>
					<li class="active" onclick="menuGo4()">
						디자이너 순위
					</li>
					<li class="active" onclick="menuGo5()">
						헤어 순위
					</li>
				</ul>
			</div>
			
			<!-- 메뉴 -->
			<%-- <div id="mainMenu">
				<div>
					<a href="${pageContext.request.contextPath}/members/myRegionSetting.do">우리동네 설정</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/members/gpsHairshopSearch.do">우리동네 미용실 모아보기</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/members/regionHairshopRank.do">우리동네 미용실 순위</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/members/regionDesignerRank.do">우리동네 디자이너 순위</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/members/regionHairRank.do">인기헤어 순위</a>
				</div>
			</div> --%>
			
		</div>
	</div>
	<div id="mainLine"></div><br>

	<!-- Main -->
	<div id="main">

		<decorator:body></decorator:body>

	</div>

<script>
//햄버거
$(document).ready(function() {
	$('.hamburger-shell').click(function() {
		$('#menu').slideToggle(300);
		$('.top').toggleClass('rotate');
		$('.middle').toggleClass('rotate-back');
		$('.menu-name').toggleClass('bump');
	});
	$('.bg-cover').click(function() {
		$('#menu').slideToggle(300);
		$('.top').toggleClass('rotate');
		$('.middle').toggleClass('rotate-back');
		$('.menu-name').toggleClass('bump');
	})
});
</script>
</body>
</html>