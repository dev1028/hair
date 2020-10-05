<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<!-- 추가한거 -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

<style>
/* 슬라이더 */
*{box-sizing: border-box; -webkit-box-sizing: border-box; }
html, body { height: 100%; }
body { margin: 0; font: 16px/1.3 sans-serif; }

/*
PURE RESPONSIVE CSS3 SLIDESHOW GALLERY by Roko C. buljan
http://stackoverflow.com/a/34696029/383904
*/

.CSSgal {
	position: relative;
	overflow: hidden;
	height: 100%; /* Or set a fixed height */
}

/* SLIDER */

.CSSgal .slider {
	height: 100%;
	white-space: nowrap;
	font-size: 0;
	transition: 0.8s;
}

/* SLIDES */

.CSSgal .slider > * {
	font-size: 1rem;
	display: inline-block;
	white-space: normal;
	vertical-align: top;
	height: 100%;
	width: 100%;
	background: none 50% no-repeat;
	background-size: cover;
}

/* PREV/NEXT, CONTAINERS & ANCHORS */

.CSSgal .prevNext {
	position: absolute;
	z-index: 1;
	top: 50%;
	width: 100%;
	height: 0;
}

.CSSgal .prevNext > div+div {
	visibility: hidden; /* Hide all but first P/N container */
}

.CSSgal .prevNext a {
	background: #fff;
	position: absolute;
	width:       60px;
	height:      60px;
	line-height: 60px; /* If you want to place numbers */
	text-align: center;
	opacity: 0.7;
	-webkit-transition: 0.3s;
					transition: 0.3s;
	-webkit-transform: translateY(-50%);
					transform: translateY(-50%);
	left: 0;
}
.CSSgal .prevNext a:hover {
	opacity: 1;
}
.CSSgal .prevNext a+a {
	left: auto;
	right: 0;
}

/* NAVIGATION */

.CSSgal .bullets {
	position: absolute;
	z-index: 2;
	bottom: 0;
	padding: 10px 0;
	width: 100%;
	text-align: center;
}
.CSSgal .bullets > a {
	display: inline-block;
	width:       30px;
	height:      30px;
	line-height: 30px;
	text-decoration: none;
	text-align: center;
	background: rgba(255, 255, 255, 1);
	-webkit-transition: 0.3s;
					transition: 0.3s;
}
.CSSgal .bullets > a+a {
	background: rgba(255, 255, 255, 0.5); /* Dim all but first */
}
.CSSgal .bullets > a:hover {
	background: rgba(255, 255, 255, 0.7) !important;
}

/* NAVIGATION BUTTONS */
/* ALL: */
.CSSgal >s:target ~ .bullets >* {      background: rgba(255, 255, 255, 0.5);}
/* ACTIVE */
#s1:target ~ .bullets >*:nth-child(1) {background: rgba(255, 255, 255,   1);}
#s2:target ~ .bullets >*:nth-child(2) {background: rgba(255, 255, 255,   1);}
#s3:target ~ .bullets >*:nth-child(3) {background: rgba(255, 255, 255,   1);}
#s4:target ~ .bullets >*:nth-child(4) {background: rgba(255, 255, 255,   1);}
/* More slides? Add here more rules */

/* PREV/NEXT CONTAINERS VISIBILITY */
/* ALL: */
.CSSgal >s:target ~ .prevNext >* {      visibility: hidden;}
/* ACTIVE: */
#s1:target ~ .prevNext >*:nth-child(1) {visibility: visible;}
#s2:target ~ .prevNext >*:nth-child(2) {visibility: visible;}
#s3:target ~ .prevNext >*:nth-child(3) {visibility: visible;}
#s4:target ~ .prevNext >*:nth-child(4) {visibility: visible;}
/* More slides? Add here more rules */

/* SLIDER ANIMATION POSITIONS */

#s1:target ~ .slider {transform: translateX(   0%); -webkit-transform: translateX(   0%);}
#s2:target ~ .slider {transform: translateX(-100%); -webkit-transform: translateX(-100%);}
#s3:target ~ .slider {transform: translateX(-200%); -webkit-transform: translateX(-200%);}
#s4:target ~ .slider {transform: translateX(-300%); -webkit-transform: translateX(-300%);}
/* More slides? Add here more rules */


/* YOU'RE THE DESIGNER! 
   ____________________
   All above was mainly to get it working :)
   CSSgal CUSTOM STYLES / OVERRIDES HERE: */

.CSSgal{
	color: #fff;	
	text-align: center;
}
.CSSgal .slider h2 {
	margin-top: 40vh;
	font-weight: 200;
	letter-spacing: -0.06em;
	word-spacing: 0.2em;
	font-size: 3em;
}
.CSSgal a {
	border-radius: 50%;
	margin: 0 3px;
	color: rgba(0,0,0,0.8);
	text-decoration: none;
}



body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}

/*  */
#project-label {
	display: block;
	font-weight: bold;
	margin-bottom: 1em;
}

#project-icon {
	float: left;
	height: 32px;
	width: 32px;
}

#project-description {
	margin: 0;
	padding: 0;
}


/* 공지사항 큐앤에이 */
#qnaNotice {
	justify-content: center; /* 가로에서 센터 */
	align-items: center;	 /* 세로에서 센터 */
	text-align: center;
	display: flex;
}
#notice {
	float: left;
	text-align: left;
	margin:30px 50px 100px;
}
#qna {
	float: left;
	text-align: left;
	margin:30px 50px 100px;
}

/* 더보기버튼 */
.share-button { 
  margin: auto;
  float: right;
  top: 0; 
  left: 0;
  bottom: 0;
  right: 0;
  width:4em;
  height:2em;
  line-height:1.8em;
 }

.social-toggle {
  display:block;
  font-weight:bold;
  font-size:85%;
  text-align:center;
  text-transform:uppercase;
  transition:all 0.25s;
  color:rgb(144 144 144);
  background:rgba(200,200,200,.05);
  border: 2px solid rgb(200,200,200);
} 

.social-toggle:hover {
  background:rgb(200,200,200);
  color:#333;
}

.no-js .social-toggle, .no-js .social-toggle:hover {
  cursor: default;
  border:none;
  background:transparent;
  color:rgb(200,200,200);
  pointer-events:none;
}/* 더보기버튼끝 */


</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인화면</title>

<script>
	function formatDate(date) {
		var d = new Date(date), month = '' + (d.getMonth() + 1), day = ''
				+ d.getDate(), year = d.getFullYear();
		if (month.length < 2)
			month = '0' + month;
		if (day.length < 2)
			day = '0' + day;
		return [ year, month, day ].join('-');
	}

	function singleAuto(){
		
	}
	
	$(function() {
		$("#project").autocomplete({
			minLength : 1,
			source : "../ajax/searchRealtime.do",
			focus : function(event, ui) {
				$("#project").val(ui.item.label);
				return false;
			},
			select : function(event, ui) {
				$("#project").val(ui.item.label);
				$("#project-id").val(ui.item.value);
				$("#project-description").html(ui.item.desc);
				//$("#project-icon").attr("src", "images/" + ui.item.icon);

				return false;
			}
		}).autocomplete("instance")._renderItem = function(ul, item) {
			return $("<li>").append(
					"<div>" + item.label + "<br>" + item.desc + "</div>")
					.appendTo(ul);
		};
		

		$("input:radio[name='date']:radio[value='day0']").prop('checked', true); // 선택하기
		$("#date").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate: 0
		});
		$("input:radio[name='radioDate']:radio[value='day0']").prop('checked', true); 
		$("#date").datepicker( "setDate", new Date());
		
		
		$('input[type="radio"]').click(function() {
			if ($(this).is(':checked')) {
				date = new Date();
				val = $(this).val();

				if (val == 'day1') {
					date.setDate(date.getDate() + 1);
				} else if (val == 'day2') {
					date.setDate(date.getDate() + 2);
				}
				
				$("#date").val(formatDate(date));
			}
		});
		
		$('#timepicker_start').timepicker({
			timeFormat: 'HH',
			interval: 60
		});
		$('#timepicker_end').timepicker({
			timeFormat: 'HH',
			interval: 60
		});
	});
</script>
</head>
<body>
<!-- 슬라이더 -->
<div id="divSlider">

<!-- Place somewhere in the <body> of your page -->
<div class="flexslider">
<div class="CSSgal">

  <!-- Don't wrap targets in parent -->
  <s id="s1"></s> 
  <s id="s2"></s>
  <s id="s3"></s>
  <s id="s4"></s>

  <div class="slider">
    <div style="background:#5b8;">
			<h2>우리동네 미용실 <b>우동</b> 에 오신것을 환영합니다</h2>
			<p>예약을 희망하는 날짜를 선택하여 검색해서 예약하세요!<br>　<br>　</p>
		</div>
    <div style="background:#85b;">
			<h2>헤어샵 예약 사이트 부문고객 만족도 1위!</h2>
			<p>우동은 언제나 고객과 함께합니다<br>　<br>　</p>
		</div>
    <div style="background:#e95;">
			<h2>우동과 함께라면 언제 어디서는 간편 예약 OK!</h2>
			<p>내가 원하는 시간과 장소에 맞춰서 모든 헤어샵 예약이 가능합니다<br>　<br>　</p>
		</div>
    <div style="background:#e59;">
			<h2>우리동네는 어떤 헤어가 유행일까?</h2>
			<p>우리동네 지역별 인기 순위도 한 눈에 확인 하세요<br>　<br>　</p>
		</div>
  </div>
  
  <div class="prevNext">
    <div><a href="#s4"></a><a href="#s2"></a></div>
    <div><a href="#s1"></a><a href="#s3"></a></div>
    <div><a href="#s2"></a><a href="#s4"></a></div>
    <div><a href="#s3"></a><a href="#s1"></a></div>
  </div>

  <div class="bullets">
    <a href="#s1">1</a>
    <a href="#s2">2</a>
    <a href="#s3">3</a>
    <a href="#s4">4</a>
  </div>
</div>
</div>
</div><!-- 슬라이더끝 -->


	<div class="myForm">
		<form action="../members/searchDetail.do" method="post" style="margin:auto;max-width:300px">
			<div>
				<input autocomplete="off" type="text" name="date" id="date" size="12" />
				<label class="radio-inline">
		     		<input type="radio" name="radioDate" value="day0">오늘
		    	</label>
		    	<label class="radio-inline">
		      		<input type="radio" name="radioDate" value="day1" >내일
		    	</label>
		    	<label class="radio-inline">
		      		<input type="radio" name="radioDate" value="day2">모래
		    	</label>
    		</div>
	    	
		    <input autocomplete="off" id="timepicker_start" value="00" type="text" name="hs_starttime" style="width:80px"> -
		    <input autocomplete="off" id="timepicker_end" value="23" type="text" name="hs_endtime" style="width:80px" > 영업시간
	    	
    	
			<!--  <img id="project-icon" src="images/transparent_1x1.png" class="ui-state-default" alt="">-->
			<!-- 여기서도 term을 보낸다. -->
			<input autocomplete="off" id="project" type="text" name="term">
			<button type="submit" name="detail"><i class="fa fa-search"></i></button>
			<input type="hidden" id="project-id">
			<p id="project-description"></p>
		</form>
		<br><br><br>
		
		<!-- 여기서부터 공지사항과 QnA 뿌려주는거 -->
		<div id="qnaNotice">
		<div id="notice">
		공지사항
		<c:if test="${not empty loginid}">
		<div class="share-button" style="">
			<a href="membersNotice.do" class="social-toggle">더보기</a>
		</div>
		</c:if>
		<hr>
			<ul>
				<c:forEach items="${noticeList}" var="notice">
				<li>
					${notice.notice_title}	
				</li>
				</c:forEach>
			</ul>
		</div>
		&emsp;
		<div id="qna">
		Q&A
		<c:if test="${not empty loginid}">
		<div class="share-button" style="">
			<a href="membersQna.do" class="social-toggle">더보기</a>
		</div>
		</c:if>
		<hr>
			<ul>
				<c:forEach items="${qnaList}" var="qna">
				<li>
					${qna.qna_title}			
				</li>
				</c:forEach>
			</ul>
		</div>
		
		</div>
		<!-- 여기까지 공지사항과 QnA 뿌려주는거 -->
		
	</div>
</body>
</html>