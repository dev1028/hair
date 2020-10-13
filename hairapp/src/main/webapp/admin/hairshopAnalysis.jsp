<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript" src="hairshopAnalysis.js"></script>
<!--
			§ 미용실 지역별 매출순위
			§ 미용실 지역별 예약순위
			§ 미용실 전체 매출순위
			§ 미용실 전체지역 예약순위
				미용실 평점순위

 -->


</head>
<body>
	<h2 class="heading"></h2>
	<form
		action="${pageContext.request.contextPath}/admin/hairshopAnalysisFind.do">


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



	<h2 class="heading">미용실 전체매출순위</h2>
	<div class="table-responsive" id="result">
		<table class="table table-bordered" id="dataTable" width="100%"
			cellspacing="0">
			<thead>
				<tr>

					<th>미용실번호</th>
					<th>미용실이름</th>
					<th>지역</th>

					<th>고객이름</th>
					<th>예약번호</th>
					<th>시술날짜</th>
					<th>시술대분류</th>
					<th>시술중분류</th>
					<th>금액</th>
					<th>총금액</th>
				</tr>
			</thead>
			<tbody id="tbody">

			</tbody>
		</table>
		<button id="excel">excel</button>
		<button id="email">email</button>
	</div>

</body>
</html>