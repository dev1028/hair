<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="hairshopStatistics.css"> -->


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/hairshop/hairshopStatistics.js">
	
</script>
</head>
<body>
	<h2 class="heading">매출결산</h2>
	<form method="POST"
		action="${pageContext.request.contextPath}/hairshop/salesStatisticsResult.do">
		<!--  search -->
		<div class="form-group">

			<div class="control">
				<label for="name">검색구분 </label>
				<button type="button" value="Submit" class='search' id="period">기간내결산</button>
				<button type="button" value="Submit" class='search' id="year">년도별
					결산</button>
				<button type="button" value="Submit" class='search' id="quarter">분기별
					결산</button>
				<button type="button" value="Submit" class='search' id="month">월별
					결산</button>
			</div>

			<div class="control">
				<label for="name">기간선택 </label>
				<div class="controls" id="range"></div>
			</div>

			<div class="control">
			
				<label for="name">직원선택 </label>
				<input type="checkbox" name="designer_name" value="all">전체직원|
				<c:forEach items="${list }" var="i">
				
			<input type="checkbox" name="designer_name" value="${i.designer_no}">
			</c:forEach>
				
					
				<div class="controls"></div>
			</div>

			<button type="button" value="Submit" id="submit" class="col-1-4">Submit</button>
		</div>
	</form>
	<!--  result -->
	<!-- 매출 -->



	<h2 class="heading">지출합계</h2>
	<div class="form-group" id="result"></div>
	<!-- <button type="button" id="excel">excel</button> -->





</body>
</html>