<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

.sidenavself{
	 position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  height: 100%;
   overflow-x: hidden;
}

.footerself {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  color: white;
  text-align: center;
}
#footer { 
            position: fixed; 
            padding: 10px 10px 0px 10px; 
            bottom: 0; 
            width: 100%; 
            /* Height of the footer*/  
            height: 50px; 
             
        } 
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
		
		<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/hairInfoFullList.do") != -1|| fn:indexOf(pageContext.request.requestURI,"/hairshop/hairInfoInsert.do") != -1|| fn:indexOf(pageContext.request.requestURI,"/hairshop/hairNameRequest.do") != -1|| fn:indexOf(pageContext.request.requestURI,"/hairshop/hairInfoList.do") != -1|| fn:indexOf(pageContext.request.requestURI,"/hairshop/hairInfoDetail.do") != -1 }'>
			$("#navbarDropdown1").addClass("active");
		</c:if>
		<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/employeeList.do") != -1|| fn:indexOf(pageContext.request.requestURI,"/hairshop/retiredEmployeeList.do") != -1|| fn:indexOf(pageContext.request.requestURI,"/hairshop/employeeCloseDayManage.do") != -1 }'>
			$("#navbarDropdown2").addClass("active");
		</c:if>
		<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/salesStatistics.do") != -1
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/salesStatisticsByDesigner.do") != -1}'>
			$("#navbarDropdown3").addClass("active");
		</c:if>
		<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/analysisMonthly.do") != -1
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/analysisByTreat.do") != -1 
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/analysisDesignerTotal.do") != -1 }'>
				$("#navbarDropdown4").addClass("active");
		</c:if>
		<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/dailyReservationList.do") != -1
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/weeklyReservationList.do") != -1 
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/monthlyReservationList.do") != -1 
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hairshopProcedureFinishList.do") != -1
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hsFindMyCustomer.do") != -1
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hsFindMyCustomerDetail.do") != -1 
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hsFindMycustomerRe.do") != -1 }'>
			$("#navbarDropdown5").addClass("active");
		</c:if>
		<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/HairshopCouponCtrl.do") != -1
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/HairshopCouponListCtrl.do") != -1}'>
				$("#navbarDropdown6").addClass("active");
		</c:if>	
		<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/myHairshopInfo.do") != -1
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/myHairshopInfoUpdate.do") != -1
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/myHairshopProfile.do") != -1
			 || fn:indexOf(pageContext.request.requestURI,"/hairshop/HairshopCloseDayManage.do") != -1}'>
			$("#navbarDropdown7").addClass("active");
		</c:if>		 
	});
	
	function IntervalOn(){
		findNext();
		setInterval(function() {
			//console.log("interval 반복중")
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
			<nav class="col-md-2 d-none d-md-block bg-light sidebar sidenavself">
				<div class="sidebar-sticky ">
					<div>
						<br> <br>
						<hr>
					</div>

					<div>
						<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/hairshopMain.do") != -1}'>
						
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/dailyReservationList.do"> <span
									data-feather="hairinfo">일간예약</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/weeklyReservationList.do"> <span
									data-feather="hairinfo">주간예약</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/monthlyReservationList.do"> <span
									data-feather="hairinfo">월간예약</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/hairshopProcedureFinishList.do"> <span
									data-feather="hairinfo">시술완료고객</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/hsFindMyCustomer.do"> <span
									data-feather="hairinfo">예약자 찾기</span> 
							</a></li>
						</ul>
						</c:if>
						<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/hairInfoFullList.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hairInfoInsert.do") != -1 
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hairNameRequest.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hairInfoList.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hairInfoDetail.do") != -1 }'>

						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/hairInfoList.do"> <span
									data-feather="hairinfo">시술목록</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/hairInfoInsert.do"> <span
									data-feather="hairinfo">시술등록</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/hairNameRequest.do"> <span
									data-feather="hairinfo">시술명 신청</span> 
							</a></li>
						</ul>
						</c:if>
						<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/employeeList.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/retiredEmployeeList.do") != -1 
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/employeeCloseDayManage.do") != -1 }'>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/employeeList.do"> <span
									data-feather="hairinfo">직원목록</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/retiredEmployeeList.do"> <span
									data-feather="hairinfo">퇴사자목록</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/employeeCloseDayManage.do"> <span
									data-feather="hairinfo">디자이너 휴무일</span> 
							</a></li>
						</ul>
						</c:if>
						<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/salesStatistics.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/salesStatisticsByDesigner.do") != -1}'>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/salesStatistics.do"> <span
									data-feather="hairinfo">매출분석</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/salesStatisticsByDesigner.do"> <span
									data-feather="hairinfo">직원별 매출</span> 
							</a></li>
						</ul>
						</c:if>
						<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/analysisMonthly.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/analysisByTreat.do") != -1 
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/analysisDesignerTotal.do") != -1 }'>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/analysisMonthly.do"> <span
									data-feather="hairinfo">월별결산</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/analysisByTreat.do"> <span
									data-feather="hairinfo">시술별 통계</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/analysisDesignerTotal.do"> <span
									data-feather="hairinfo">디자이너 통계</span> 
							</a></li>
						</ul>
						</c:if>
						<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/dailyReservationList.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/weeklyReservationList.do") != -1 
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/monthlyReservationList.do") != -1 
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hairshopProcedureFinishList.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hsFindMyCustomer.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hsFindMyCustomerDetail.do") != -1 
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/hsFindMycustomerRe.do") != -1 }'>
						
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/dailyReservationList.do"> <span
									data-feather="hairinfo">일간예약</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/weeklyReservationList.do"> <span
									data-feather="hairinfo">주간예약</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/monthlyReservationList.do"> <span
									data-feather="hairinfo">월간예약</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/hairshopProcedureFinishList.do"> <span
									data-feather="hairinfo">시술완료고객</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/hsFindMyCustomer.do"> <span
									data-feather="hairinfo">예약자 찾기</span> 
							</a></li>
						</ul>
						</c:if>
						<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/HairshopCouponCtrl.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/HairshopCouponListCtrl.do") != -1}'>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/HairshopCouponCtrl.do"> <span
									data-feather="hairinfo">쿠폰등록</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/HairshopCouponListCtrl.do"> <span
									data-feather="hairinfo">쿠폰리스트</span> 
							</a></li>
						</ul>
						</c:if>
						<c:if test='${fn:indexOf(pageContext.request.requestURI,"/hairshop/myHairshopInfo.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/myHairshopInfoUpdate.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/myHairshopProfile.do") != -1
						 || fn:indexOf(pageContext.request.requestURI,"/hairshop/HairshopCloseDayManage.do") != -1}'>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/myHairshopInfo.do"> <span
									data-feather="hairinfo">마이페이지</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/myHairshopProfile.do"> <span
									data-feather="hairinfo">프로필</span> 
							</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hairshop/HairshopCloseDayManage.do"> <span
									data-feather="hairinfo">미용실 휴무일</span> 
							</a></li>
				
						</ul>
						</c:if>
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
				<nav class="navbar navbar-expand-xl navbar-dark bg-dark fixed-top">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/hairshop/hairshopMain.do">${sessionScope.login.hs_name}</a>
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

								<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown1"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 시술관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/hairInfoList.do">시술목록</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/hairInfoInsert.do">시술등록</a>
										<div class="dropdown-divider"></div>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/hairNameRequest.do">시술명신청</a>
								</div></li>
	
								<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown2"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 직원관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/employeeList.do">직원목록</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/retiredEmployeeList.do">퇴사자목록</a>
										<div class="dropdown-divider"></div>
									<a
										class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/employeeCloseDayManage.do">디자이너 휴무일</a>
								</div></li>
								<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown3"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 매출관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/salesStatistics.do">매출분석</a> 
									<a
										class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/salesStatisticsByDesigner.do">직원별매출</a>
								</div></li>
								
								<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown4"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 분석통계 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/analysisMonthly.do">월별결산</a> 
									<%-- <a class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/analysisByTreat.do">시술별통계</a>  --%>
									<a
										class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/analysisDesignerTotal.do">디자이너통계</a>
								</div></li>
								
								
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown5"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 예약관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/dailyReservationList.do">일간예약</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/weeklyReservationList.do">주간예약</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/monthlyReservationList.do">월간예약</a>
				
									<div class="dropdown-divider"></div>
										<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/hairshopProcedureFinishList.do">시술완료고객</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/hsFindMyCustomer.do">예약자찾기</a>
								</div></li>

								
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown6"
									role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 쿠폰관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/HairshopCouponCtrl.do">쿠폰등록</a> <a
										class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/HairshopCouponListCtrl.do">쿠폰리스트</a>
								</div></li>

									<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown7"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 미용실정보관리 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/myHairshopInfo.do">마이페이지</a>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/hairshop/myHairshopProfile.do">프로필</a>
											<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="${pageContext.request.contextPath}/hairshop/HairshopCloseDayManage.do">미용실 휴무일</a>
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
							<button id="siteSearchCustomerBtn" type="button" class="btn btn-info btn-sm">Search</button>
						</form>
						<a class="btn btn-secondary btn-sm"href="${pageContext.request.contextPath}/ajax/hairshopLoginPageGo.do">메인페이지로</a>
						<a class="btn btn-primary btn-sm"href="${pageContext.request.contextPath}/ajax/hairDeslogout.do">로그아웃</a>
					</div>
				</nav>
			</div>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<decorator:body></decorator:body>			
				
			<div>
			<br><br><br>
			</div>
			</main>
			<div id="footer">
            </div> 
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