<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/js/require.min.js"></script>

<script>
	requirejs
			.config({
				baseUrl : "${pageContext.request.contextPath}/decorator/tabler-gh-pages"
			});
</script>
<!-- Dashboard Core -->
<link
	href="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/css/dashboard.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/js/dashboard.js"></script>
<!-- c3.js Charts Plugin -->
<link
	href="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/charts-c3/plugin.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/charts-c3/plugin.js"></script>
<!-- Google Maps Plugin -->
<link
	href="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/maps-google/plugin.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/maps-google/plugin.js"></script>
<!-- Input Mask Plugin -->
<script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/input-mask/plugin.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/hairshop/hairshopStatisticsByDs.js">
	
</script>
</head>
<body>

	<br>
	<br>
	<br>
	<div class="container">
		<h5 class=" heading">매출결산</h5>

		<form method="POST"
			action="${pageContext.request.contextPath}/hairshop/salesStatisticsResult.do">
			<!--  search -->
			<div class="form-group">




<!-- 
<div class="row row-sm align-items-center mb-3">
                  <div class="col">
                    <div class="input-group">
                      <span class="input-group-text">
                        $
                      </span>
                      <input type="text" class="form-control" placeholder="from" value="3">
                    </div>
                  </div>
                  <div class="col-auto">—</div>
                  <div class="col">
                    <div class="input-group">
                      <span class="input-group-text">
                        $
                      </span>
                      <input type="text" class="form-control" placeholder="to">
                    </div>
                  </div>
                </div> -->






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

					<label for="name">직원선택 </label> <input type="checkbox"
						name="designer_name" value="all" id="all">전체직원|
					<c:forEach items="${list }" var="i">

						<input type="checkbox" name="designer_name"
							id="${i.designer_name }" value="${i.designer_no}">${i.designer_name } |
			</c:forEach>


					<div class="controls"></div>
				</div>

				<button type="button" value="Submit" id="submit" class="col-1-4">Submit</button>
			</div>
		</form>
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">매출</h3>
				</div>
			
					<div class="table-responsive" id="result"></div>
			
			</div>

		</div>
	</div>
</body>
</html>