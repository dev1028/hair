<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어살롱 메인페이지</title>
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="hairshopMainCalendar.js"></script>
<script src="hairshopMainChart.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm">
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
				  <label class="btn btn-secondary active">
				    <input type="radio" name="options" id="option1" checked> 일
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option2"> 주
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option3"> 월
				  </label>
				</div>
			</div>
			<div class="col-sm">
				<div>주</div>
			</div><div class="col-sm">
				<div>일</div>
			</div>
			
		</div>
		<div class="row">	
			<div class="col-9">
				<div id='calendar'></div>
			</div>
			<div class="col-3">
				<div id="chart_div"></div>
				<div class="container-fluid">
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
				  <label class="btn btn-secondary active">
				    <input type="radio" name="options" id="option1" checked> 일
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option2"> 주
				  </label>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>