<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left" type="button"
						data-toggle="collapse" data-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">기본정보</button>
				</h2>
			</div>

			<div id="collapseOne" class="collapse show"
				aria-labelledby="headingOne" data-parent="#accordionExample">
				<div class="card-body">
					<hr>
					<div class="row">
						<div class="col-4">
							<span>예약상태정보</span>
						</div>
						<div class="col-8">${mdrResult.mdr_status}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>예약번호</span>
						</div>
						<div class="col-8">${mdrResult.mdr_no}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>예약시간</span>
						</div>
						<div class="col-8">${mdrResult.mdr_date}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>이름</span>
						</div>
						<div class="col-8">${mdrResult.mem_name}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>전화번호</span>
						</div>
						<div class="col-8">${mdrResult.mem_phone}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>머리기장</span>
						</div>
						<div class="col-8">${mdrResult.mem_hair_length}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>머릿결상태</span>
						</div>
						<div class="col-8">${mdrResult.mem_hair_status}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>헤어샵요청사항</span>
						</div>
						<div class="col-8">${mdrResult.mdr_request}</div>
					</div>
					<hr>
				</div>
			</div>	
		</div>
		<div class="card">
			<div class="card-header" id="headingTwo">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left collapsed"
						type="button" data-toggle="collapse" data-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">시술정보</button>
				</h2>
			</div>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionExample">
				<div class="card-body">
					<c:forEach items="${detailInfo}" var="info">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title">${info.hhi_name}</h5>
								<h6 class="card-subtitle mb-2 text-muted">${info.hhi_time}시간</h6>
								<p class="card-text">${info.hhi_price}원</p>
								<a href="#" class="card-link">정보기록</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header" id="headingThree">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left collapsed"
						type="button" data-toggle="collapse" data-target="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">메모</button>
				</h2>
			</div>
			<div id="collapseThree" class="collapse"
				aria-labelledby="headingThree" data-parent="#accordionExample">
				<div class="card-body"></div>
			</div>
		</div>
	</div>
</body>
</html>