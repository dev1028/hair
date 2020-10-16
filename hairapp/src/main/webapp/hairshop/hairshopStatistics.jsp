<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="hairshopStatistics.css"> -->


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/hairshop/hairshopStatistics.js">
<link
href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
rel="stylesheet" />
<link
href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
rel="stylesheet" crossorigin="anonymous" />
<script
src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
crossorigin="anonymous"></script>
<script
src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
crossorigin="anonymous"></script>
<script
src="${pageContext.request.contextPath}/decorator/ges/dist/js/scripts.js"></script>
<script
src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
crossorigin="anonymous"></script>
<script
src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
crossorigin="anonymous"></script>
<script
src="${pageContext.request.contextPath}/decorator/ges/dist/assets/demo/datatables-demo.js"></script>


</head>
<body> 
<br><br><br>
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

			

			<button type="button" value="Submit" id="submit" class="col-1-4">Submit</button>
		</div>
	</form>
	<!--  result -->
	<!-- 매출 -->



	<h2 class="heading"></h2>
	<div class="table-responsive" id="result">
		</div>
=======
	
</script>
</head>
<body> 
<br><br><br>
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

			

			<button type="button" value="Submit" id="submit" class="col-1-4">Submit</button>
		</div>
	</form>
	<!--  result -->
	<!-- 매출 -->



	<h2 class="heading"></h2>
	<div class="form-group" id="result"></div>
>>>>>>> branch 'master' of https://github.com/dev1028/hair.git
	<!-- <button type="button" id="excel">excel</button> -->





</body>
</html>