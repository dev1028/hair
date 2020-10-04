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
	findNextCustomer = setInterval(function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/ajax/designerNextCustomer.do",
			data : {
				startTime : getFormatDate(new Date())
			},
			dataType : "json",
			method : "post",
			success : function(data) {
				if(data == 0){
					//최근예약이 존재하지않음을 표시
					$("#customerName").text("예약이 존재하지 않습니다.");
					$("#customerDetailInfoURI").attr("href", "#");
					$("#forUl").html("");
				} else {
					if(result == null || result.mdr_no != data.mdr_no){
						$("#forUl").html("");
						result = data;
						$("#customerName").text(data.mem_name);
						$("#customerDetailInfoURI").attr("href", "${pageContext.request.contextPath}/ajax/memberReservationInfo.do?mdrNo="+data.mdr_no);
					console.log(data.hair_name.split(" "));
					
				 	var ulTag =  $("<ul>").attr("class", "list-group list-group-flush");
					var hairs = data.hair_name.split(" ");
					for(var i = 0; i<hairs.length-1; i++){
						ulTag.append($("<li>").attr("class", "list-group-item").text(hairs[i]));
					}
					$("#forUl").append(ulTag); 
	
					
					
					
					
					
					}
					
				}
				
			}
		});// end of ajax 
	}, 3000);
	
	
	
	
	
	
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
							<li class="nav-item"><a class="nav-link" href="#">?</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/hairshop/employeeList.do">내정보
									수정</a></li>
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
									<div class="dropdown-divider"></div>
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/designer/desMonthlyReservationList.do">월간예약현황</a>
								</div></li>





							<li class="nav-item"><a class="nav-link disabled" href="#"
								tabindex="-1" aria-disabled="true">Disabled</a></li>
						</ul>
						<!-- class="form-inline my-2 my-lg-0" -->
						<form>
							<!-- class="form-control mr-sm-2" -->
							<!--  class="btn btn-outline-success my-2 my-sm-0" -->
							<input type="search" placeholder="Search" aria-label="Search">
							<button type="submit">Search</button>
						</form>
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