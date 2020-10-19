<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원별 매출결산</title>
<!-- <link rel="stylesheet" href="hairshopStatistics.css"> -->


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/hairshop/hairshopStatisticsByDs.js">
	
</script>
</head>
<body>
	<div class="container">
<br><br><br>
	<div class="row">
	<h2 class="heading">직원별 매출결산</h2>
	</div>
	<hr>
	<form method="POST"
		action="${pageContext.request.contextPath}/hairshop/salesStatisticsResult.do">
		<!--  search -->
		<div class="form-group">
		<div class="row">
			<div class="control">
				<label for="name"><strong>검색구분: &nbsp;&nbsp;</strong></label>
				<button type="button" value="Submit" class='search btn btn-primary btn-sm' id="period">기간내결산</button>
				<button type="button" value="Submit" class='search btn btn-secondary btn-sm' id="year">년도별
					결산</button>
				<button type="button" value="Submit" class='search btn btn-secondary btn-sm' id="quarter">분기별
					결산</button>
				<button type="button" value="Submit" class='search btn btn-secondary btn-sm' id="month">월별
					결산</button>
			</div>
		</div>
			<hr>
			<div class="row">
			<div class="control">
				<label for="name"><strong>기간선택 </strong></label>
				<div class="controls" id="range"></div>
			</div>
			</div>
			<hr>
			<div class="row">
			<div class="control">
			
				<label for="name"><strong>직원선택 &nbsp;&nbsp;</strong> </label>
				<input type="checkbox" name="designer_name" value="all" id="all">전체직원&nbsp;|
				<c:forEach items="${list }" var="i">
				
			<input type="checkbox" name="designer_name" id="${i.designer_name }" value="${i.designer_no}" >${i.designer_name } &nbsp;|
			</c:forEach>
				
					
				<div class="controls"></div>
			</div>
			</div>
			<div class="row">
			<button type="button" value="Submit" id="submit" class="btn btn-primary">검색</button>
			</div>
		</div>
	</form>
	<!--  result -->
	<!-- 매출 -->


	<hr>
	<h2 class="heading"></h2>
	<div class="form-group" id="result"></div>
	<!-- <button type="button" id="excel">excel</button> -->


	</div>


</body>
</html>