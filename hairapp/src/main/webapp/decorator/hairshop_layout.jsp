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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/locales-all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

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
		$("#siteSearchCustomerBtn").on("click", function() {
			if ($("#siteInputSearch").val() == "") {
				alert("값을 입력해주세요");
			} else {
				$("#siteSearchCustomerFrm").submit();
			}
		});
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
			url : "${pageContext.request.contextPath}/ajax/hairshopNextCustomer.do",
			data : {
				startTime : getFormatDate(new Date())
			},
			dataType : "json",
			method : "post",
			success : function(data) {
				var ttsText = "";
				if(data == 0){
					//최근예약이 존재하지않음을 표시
					$("#forUl").html("");
					$("#forUl").append($("<h6>").html("오늘은 더 이상 예약이<br>존재하지 않습니다."));

				} else {
					var eventTimeStr = data[0].mdr_date.trim().replace(" ","T")+":00";
					var eventTime = new Date(eventTimeStr);
					var currentTime = new Date(); 
		
					if(getCookie("hsnextCustomer") == null){
						setCookie("hsnextCustomer", data[0].mdr_no, 1);
						for(var i = 0; i<data.length; i++){
							ttsText += (data[i].mdr_date.split(" ")[1] + " 에 "+data[i].mem_name +" 님이 " + data[i].hair_name +" 시술을 디자이너 "+data[i].designer_name + "에게 예약했습니다. ");					
						}
						console.log(ttsText);
						speech(ttsText);
					} else if(getCookie("hsnextCustomer") != null && getCookie("hsnextCustomer") == data[0].mdr_no){
						if(currentTime <= eventTime-285000 && currentTime >= eventTime-315000){
							for(var i = 0; i<data.length; i++){
								ttsText += (data[i].mem_name +" 님이  디자이너 "+data[i].designer_name+"에게 받는 "+data[i].hair_name +" 시술이 5분전입니다. ");
							}
							console.log(ttsText);
							speech(ttsText);
						}
					} else if(getCookie("hsnextCustomer") != null && getCookie("hsnextCustomer") != data[0].mdr_no){
						console.log(getCookie("hsnextCustomer"));
						setCookie("hsnextCustomer", data[0].mdr_no, 1);
						for(var i = 0; i<data.length; i++){
							ttsText += (data[i].mdr_date.split(" ")[1] + " 에 "+data[i].mem_name +" 님이 " + data[i].hair_name +" 시술을 디자이너 "+data[i].designer_name + "에게 예약했습니다. ");					
						}
						console.log(ttsText);
						speech(ttsText);
					}
					
					$("#forUl").html("");
					result = data;
					$("#forUl").append($("<h4>").text(data[0].mdr_date.split(" ")[1]));
					
					for(var i = 0; i<data.length; i++){
						var hairs = data[i].hair_name.split(" ");
						var hairName = '';
						for(var j = 0; j<hairs.length-1; j++){
							hairName += (hairs[j]+" ");
						}
						$("#forUl").append($("<hr>"));
						$("#forUl").append($("<h5>").text("디자이너 "+data[i].designer_name));
						$("#forUl").append(
						$("<span>").append(
						$("<a>").attr("href", "${pageContext.request.contextPath}/hairshop/hsFindMyCustomerDetail.do?mdr_no="+data[i].mdr_no)
								 .html('<strong>'+data[i].mem_name+'</strong>'+" - "+hairName)));
					}
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
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link active" href="#">
									<span data-feather="home"></span> Dashboard <span
									class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="file"></span> Orders
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
							</div>
							<div class="card-body" id="forUl"></div>
							<div class="card-body">
								<hr>
								<a
									href="${pageContext.request.contextPath}/hairshop/weeklyReservationList.do"
									class="card-link">주간일정보기</a>
							</div>
						</div>
					</div>
				</div>
			</nav>
			<div class="block">
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/hairshop/hairshopMain.do">${login.hs_name}</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item"><a class="nav-link disabled" href="#"
								tabindex="-1" aria-disabled="true">제품관리</a></li>
								<li class="nav-item"><a class="nav-link disabled" href="#"
								tabindex="-1" aria-disabled="true">회원관리</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/hairInfoList.do">시술관리
									<span class="sr-only">(current)</span>
							</a></li>
							
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/hairshop/employeeList.do">직원관리</a></li>
								
								
								
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/hairshop/salesStatistics.do">매출관리</a></li>
								
								
								<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 매출관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/salesStatistics.do">매출분석</a> 
									<a
										class="dropdown-item" href="${pageContext.request.contextPath}/ajax/hairshop/salesStatisticsByDesigner.do">직원별매출</a>
								</div></li>
								
								<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 분석통계 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/analysisByTreatCtrl.do">시술별통계</a> 
									<a
										class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/analysisByReservationCtrl.do">예약분석</a>
								</div></li>
								
								
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle active" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 예약관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/dailyReservationList.do">일간예약</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/weeklyReservationList.do">주간예약</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/monthlyReservationList.do">월간예약현황</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/hairshopProcedureFinishCtrl.do">시술완료고객</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/hsFindMyCustomer.do">예약자찾기</a>
								</div></li>

								
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 쿠폰관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/HairshopCouponCtrl.do">쿠폰등록</a> <a
										class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/HairshopCouponListCtrl.do">쿠폰리스트</a>
								</div></li>
							
							
							
							







							
						</ul>
						<!-- class="form-inline my-2 my-lg-0" -->
						<form id="siteSearchCustomerFrm"
						action="${pageContext.request.contextPath}/hairshop/hsFindMyCustomer.do"
							method="post">
							<!-- class="form-control mr-sm-2" -->
							<!--  class="btn btn-outline-success my-2 my-sm-0" -->
							<input type="hidden" name="divisionSearch" value="name">
							<input type="text" id="siteInputSearch" name="inputSearch" placeholder="예약자찾기" aria-label="Search">
							<button id="siteSearchCustomerBtn" type="button" class="btn btn-secondary btn-sm">Search</button>
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