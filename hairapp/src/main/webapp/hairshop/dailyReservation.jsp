<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	$(function(){
		var calendarEl = $("#calendar");
		var calendar = new FullCalendar.Calendar(calendarEl,{
			schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	
			themeSystem : 'bootstrap',	
			initialView : 'resourceTimeGridDay',	
			   resources: [	
				      { id: 'a', title: '김강산' },	
				      { id: 'b', title: '김린아'},	
				      { id: 'c', title: '김승연' },	
				      { id: 'd', title: '이송현' },	
				      { id: 'e', title: '이상민' }	
				    ]
		});
		
		
		calendar.render();
	});
</script>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>