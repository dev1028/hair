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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style>
/* .block {
	display: block;
	clear: both;
} */
</style>
<decorator:head></decorator:head>
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
					</div>
				</div>
			</nav>
			<div class="block">
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/hairshop/hairshopDesignerLogin.do">헤어살롱</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> Dropdown </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Something else here</a>
								</div></li>
							<li class="nav-item active"><a class="nav-link" href="#">제품관리
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#">회원관리</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/hairshop/employeeList.do">직원관리</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/hairshop/salesStatistics.do">매출관리</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hair/dailyReservationList.do">예약관리</a></li>
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