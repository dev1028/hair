<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div class="card-body"></div>


				<div class="row">
					<div class="col-3">
						<span>예약상태정보</span>
					</div>
					<div class="col-9">${mdrResult.mdr_status}</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>예약번호</span>
					</div>
					<div class="col-9">${mdrResult.mdr_no}</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>예약시간</span>
					</div>
					<div class="col-9">${mdrResult.mdr_date}</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>이름</span>
					</div>
					<div class="col-9">${mdrResult.mem_name}</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>전화번호</span>
					</div>
					<div class="col-9">${mdrResult.mem_phone}</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>머리기장</span>
					</div>
					<div class="col-9">${mdrResult.mem_hair_length}</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>머릿결상태</span>
					</div>
					<div class="col-9">${mdrResult.mem_hair_status}</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>헤어샵요청사항</span>
					</div>
					<div class="col-9">${mdrResult.mdr_request}</div>
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
					<span>상세정보번호</span> <span>시술명</span> <span>시술시간</span> <span>가격정보</span>
					<span>메모</span>
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