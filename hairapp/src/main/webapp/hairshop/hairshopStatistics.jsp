<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="${pageContext.request.contextPath}/hairshop/hairshopStatistics.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/hairshop/hairshopStatistics.js"></script>

</head>
<body>
	<br>
	<br>
	<br>

	<div class="container">


		<h5 class="card-title">매출결산</h5>

		<table
			class="table table-bordered table-sm text-center datatable">
			<tr>

				<td><label for="name">검색구분 </label></td>
				<td>
					<!-- 	<div class="row row-sm align-items-center mb-3"> --> <!-- <div class="col"> -->
					<div class="input-group">
						<div class="col">
							<button type="button" value="0"
								class="dateBtn form-control search" id="period">기간내결산</button>
						</div>
						<div class="col">
							<button type="button" value="0"
								class='dateBtn form-control search' id="year">년도별 결산</button>
						</div>
						<div class="col">
							<button type="button" value="3"
								class='dateBtn form-control search' id="quarter">분기별</button>
						</div>
						<div class="col">
							<button type="button" value="7"
								class='dateBtn form-control search' id="month">월별 결산</button>
						</div>


					</div>

				</td>
			</tr>

			<tr>
				<td><label for="name">기간선택 </label></td>
				<td>
					<div class="controls" id="range"></div>
				</td>
			</tr>


		</table>


		<button type="submit" value="Submit" id="submit"
			class="btn btn-white btn-secondary btn-">검색</button>




		<div class="table-responsive" id="result"></div>
	</div>
</body>
</html>