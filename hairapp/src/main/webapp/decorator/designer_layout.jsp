<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/locales-all.min.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style>
/* .block {
	display: block;
	clear: both;
} */
</style>
<decorator:head></decorator:head>
<script>
	var result = null;
	var coeff = 1000 * 60 * 5;
	
	$(function(){
		findNext();
		var dated = new Date();  //or use any other date
		var rounded = new Date(Math.ceil(dated.getTime() / coeff) * coeff)
		setTimeout(IntervalOn, rounded-dated);
	});

	function IntervalOn(){
		findNext();
		setInterval(function() {
			console.log("interval 반복중")
			findNext();
		}, 300000);
	}
	
	function findNext(){
		$.ajax({
			url : "${pageContext.request.contextPath}/ajax/designerNextCustomer.do",
			data : {
				startTime : getFormatDate(new Date())
			},
			dataType : "json",
			method : "post",
			success : function(data) {
				var ttsText = "";
				if(data == 0){
					//최근예약이 존재하지않음을 표시
					$("#customerName").text("예약이 존재하지 않습니다.");
					$("#customerDetailInfoURI").attr("href", "#");
					$("#forUl").html("");

				} else {
					var eventTimeStr = data.mdr_date.trim().replace(" ","T")+":00";
					var eventTime = new Date(eventTimeStr);
					var currentTime = new Date(); 
		
					if(getCookie("nextCustomer") == null){
						setCookie("nextCustomer", data.mdr_no, 1);
						ttsText = data.mdr_date.split(" ")[1] + " 에 "+data.mem_name +" 님이 " + data.hair_name +" 시술을 예약했습니다.";
						console.log(ttsText);
						speech(ttsText);
					} else if(getCookie("nextCustomer") != null && getCookie("nextCustomer") == data.mdr_no){
						if(currentTime <= eventTime-285000 && currentTime >= eventTime-315000){
							ttsText = data.mem_name +" 님의 " + data.hair_name +" 시술이 5분전입니다.";
							console.log(ttsText);
							speech(ttsText);
						}
					} else if(getCookie("nextCustomer") != null && getCookie("nextCustomer") != data.mdr_no){
						console.log(getCookie("nextCustomer"));
						setCookie("nextCustomer", data.mdr_no, 1);
						ttsText = data.mdr_date.split(" ")[1] + " 에 "+data.mem_name +" 님이 " + data.hair_name +" 시술을 예약했습니다.";
						console.log(ttsText);
						speech(ttsText);
					}
					
					$("#forUl").html("");
					result = data;
					$("#customerName").text(data.mdr_date.split(" ")[1]+" - "+data.mem_name);
					$("#customerDetailInfoURI").attr("href", "${pageContext.request.contextPath}/ajax/memberReservationInfo.do?mdrNo="+data.mdr_no);
					var ulTag =  $("<ul>").attr("class", "list-group list-group-flush");
					var hairs = data.hair_name.split(" ");
					for(var i = 0; i<hairs.length-1; i++){
						ulTag.append($("<li>").attr("class", "list-group-item").text(hairs[i]));
					}
					$("#forUl").append(ulTag);
						
				}
				
			}
		});// end of ajax 
	}
	
	
	
	function getFormatDate(date) {
		var year = date.getFullYear(); //yyyy
		var month = (1 + date.getMonth()); //M
		month = month >= 10 ? month : '0' + month; //month 두자리로 저장
		var day = date.getDate(); //d
		var hour = date.getHours();
		var min = date.getMinutes();
		day = day >= 10 ? day : '0' + day; //day 두자리로 저장
		return year + '/' + month + '/' + day + ' ' + hour +':'+ min; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	
	//tts
	var voices = [];
	function setVoiceList() {
		voices = window.speechSynthesis.getVoices();
	}
	setVoiceList();
	if (window.speechSynthesis.onvoiceschanged !== undefined) {
	window.speechSynthesis.onvoiceschanged = setVoiceList;
	}
	function speech(txt) {
		if(!window.speechSynthesis) {
			alert("음성 재생을 지원하지 않는 브라우저입니다. 크롬, 파이어폭스 등의 최신 브라우저를 이용하세요");
			return;
		}
		var lang = 'ko-KR';
		var utterThis = new SpeechSynthesisUtterance(txt);
		utterThis.onend = function (event) {
			console.log('end');
		};
		utterThis.onerror = function(event) {
			console.log('error', event);
		};
		var voiceFound = false;
		for(var i = 0; i < voices.length ; i++) {
			if(voices[i].lang.indexOf(lang) >= 0 || voices[i].lang.indexOf(lang.replace('-', '_')) >= 0) {
				utterThis.voice = voices[i];
				voiceFound = true;
			}
		}
		if(!voiceFound) {
			alert('voice not found');
			return;
		}
		utterThis.lang = lang;
		utterThis.pitch = 1;
		utterThis.rate = 1; //속도
		window.speechSynthesis.speak(utterThis);
	}
	
	//쿠키설정
	function setCookie(cookie_name, value, days) {
		  var exdate = new Date();
		  exdate.setDate(exdate.getDate() + days);
		  // 설정 일수만큼 현재시간에 만료값으로 지정

		  var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
		  document.cookie = cookie_name + '=' + cookie_value;
		}
	
	function getCookie(cookie_name) {
		  var x, y;
		  var val = document.cookie.split(';');

		  for (var i = 0; i < val.length; i++) {
		    x = val[i].substr(0, val[i].indexOf('='));
		    y = val[i].substr(val[i].indexOf('=') + 1);
		    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
		    if (x == cookie_name) {
		      return unescape(y); // unescape로 디코딩 후 값 리턴
		    }
		  }
		}
	
</script>
</head>
<body>



	<!--  -->

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<div>
						<br> <br>
						<hr>
					</div>

					<div>
						<h5>디자이너 ${login.designer_name}님</h5>
						<ul class="nav flex-column">


							<li class="nav-item"><a class="nav-link active" href="#">
									<span data-feather="home"></span> Home <span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="shopping-cart"></span> Products
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="users"></span> Customers
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="bar-chart-2"></span> Reports
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="layers"></span> Integrations
							</a></li>
						</ul>
						<div>
							<hr>

						</div>
						<div class="card" id="nextCustomer">
							<!-- <img src="..." class="card-img-top" alt="..."> -->
							<div class="card-body">
								<h5 class="card-title">다음 예약정보</h5>
								<hr>
								<h6 class="card-text" id="customerName"></h6>
								
							</div>
							<div class="card-body" id="forUl">
						
							</div>
							<div class="card-body">
					
								<a id="customerDetailInfoURI" href="#" class="btn btn-primary btn-sm">예약정보확인</a>
								<hr>
								<a href="${pageContext.request.contextPath}/designer/desWeeklyReservationList.do" class="card-link">주간일정보기</a>
							</div>
						</div>
					</div>
				</div>
			</nav>
			<div class="block">
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/designer/designerMain.do">${hairshopInfo.hs_name}</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">

							<li class="nav-item active"><a class="nav-link" href="#">제품관리
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/designer/designerMyPageCtrl.do">MyPage</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/hairshop/salesStatistics.do">나의
									매출정보</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 예약관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/designer/desDailyReservationList.do">일간예약</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/designer/desWeeklyReservationList.do">주간예약</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/designer/desMonthlyReservationList.do">월간예약</a>
									<div class="dropdown-divider"></div>
										<a class="dropdown-item"
										href="${pageContext.request.contextPath}/designer/findMyCustomer.do">예약자찾기</a>
								</div></li>





							<li class="nav-item"><a class="nav-link disabled" href="#"
								tabindex="-1" aria-disabled="true">Disabled</a></li>
						</ul>
						<!-- class="form-inline my-2 my-lg-0" -->
						<form>
							<!-- class="form-control mr-sm-2" -->
							<!--  class="btn btn-outline-success my-2 my-sm-0" -->
							<input type="search" placeholder="예약자찾기" aria-label="Search">
							<button type="submit" class="btn btn-secondary btn-sm">Search</button>
						</form>
						<span>로그아웃</span>
					</div>
				</nav>
			</div>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<decorator:body></decorator:body>
				<div>
					<br> <br> <br>
				</div>
				<div></div>
			</main>
		</div>





	</div>

	<!-- 
	<script src="https://unpkg.com/@popperjs/core@2"></script>

	Icons
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script> -->

</body>
</html>