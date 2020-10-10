<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Charts - SB Admin</title>
<link
	href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">


	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">월별결산</h1>
				<input type="month" id="date" value="2020-09">
				<button id="find">조회</button>


				<!-- <div class="card mb-4">
                            <div class="card-body">
                                Chart.js is a third party plugin that is used to generate the charts in this template. The charts below have been customized - for further customization options, please visit the official
                                <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area mr-1"></i>
                                Area Chart Example
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div> 
                        
            
                     
                        
                        
                        
                        고객분석	성별, 연령대별, 전월대비 접객수, 우리지역 헤어샵 인기순위,방문수추, 
                        시술분석 인기헤어 성별별 인기, 연령대별 기장별 인기순위, 시술별 평
                        매출분석 매출추이, ㅏ시술별 매출, 디자이너별 매출, 
                        고객만족도 고객 재방문율,리뷰개수 추이, 평점추이,  
                        디자이너 분석 매출순위, 접객순위, 리뷰개수, 평점, 재예약
                        -->

				<div class="col-lg-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-bar mr-1"></i> 예약수 추이
						</div>
						<div class="card-body">
							<canvas id="total" width="100%" height="50"></canvas>
						</div>

					</div>
				</div>

				<div class="row">

					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar mr-1"></i> 예약고객성별비
							</div>
							<div class="card-body">
								<canvas id="gender" width="100%" height="50"></canvas>
							</div>
							<!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
						</div>
					</div>



					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar mr-1"></i> 연령대별 예약고객분석
							</div>
							<div class="card-body">
								<canvas id="age" width="100%" height="50"></canvas>
							</div>

						</div>
					</div>


				</div>
			</div>
		</main>
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your Website 2020</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/decorator/ges/dist/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<%--  <script src="${pageContext.request.contextPath}/decorator/ges/dist/assets/demo/chart-area-demo.js"></script> --%>
	<script
		src="${pageContext.request.contextPath}/decorator/ges/dist/assets/demo/chart-bar-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/decorator/ges/dist/assets/demo/chart-pie-demo.js"></script>
</body>
</html>
