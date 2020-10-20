<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/hairshop/hairshopStatistics.js"></script>
<link
	href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous">
	
</script>
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
<body>
	<br>
	<br>
	<br>
	<div class="container">

		<!-- <h5 class="heading">매출통계</h5> -->

		<div class="col">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">매출결산</h5>
				</div>

				<div class="table-responsive" id="">
					<%-- <form method="POST"
						action="${pageContext.request.contextPath}/hairshop/salesStatisticsResult.do">
 --%>
					<table
						class='table table-bordered table-sm text-center  table card-table table-vcenter text-nowrap datatable'>
						<tr>

							<td><label for="name">검색구분 </label></td>
							<td colspan="4">
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
					<div class="btn-list justify-content-end">

						<button type="submit" value="Submit" id="submit"
							class="btn btn-white btn-secondary btn-">검색</button>
					</div>


					<!-- </form> -->
				</div>
			</div>
		</div>

		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title"></h5>
				</div>

				<div class="table-responsive" id="result"></div>
			</div>

		</div>
	</div>
</body>
</html>