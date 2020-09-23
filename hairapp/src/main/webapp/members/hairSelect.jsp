<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
.horizontal-card {
	position: relative;
	display: flex;
	border: 1px solid gray;
	margin-bottom: 1rem;
}

.horizontal-card img {
	width: 200px;
	height: 130px;
	border-bottom: 30px solid orange;
}

.horizontal-card .horizontal-card-body {
	display: flex;
	flex-direction: column;
	margin-left: 1rem;
}

.horizontal-card .horizontal-card-footer {
	position: absolute;
	left: 0px;
	right: 0px;
	bottom: 0px;
	height: 30px;
	display: flex;
	align-items: center;
}

.horizontal-card .horizontal-card-footer span {
	width: 200px;
	display: inline-block;
}

.horizontal-card .horizontal-card-footer a {
	margin-left: 10px;
}
</style>
</head>
<body>
	<c:forEach items="${list}" var="hairInfo" >
		<form action="../members/hairSelectResult.do" method="post">
			<div class="horizontal-card">
				<img src="http://via.placeholder.com/200x100" />
				<div class="horizontal-card-body">
					<span class="card-text">이름: ${hairInfo.hhi_name} </span>
					<span class="card-text">가격: ${hairInfo.hhi_price} </span>
					<span class="card-text">시술시간: ${hairInfo.hhi_time}분 </span>
					<h4 class="card-title"></h4>
					<span class="card-text"></span>
				</div>
				<div class="horizontal-card-footer">
					<span>Image Title</span> 
					<a class="card-text status">#View</a>
					<a class="card-text status">#Save</a>
					<button>예약</button>
				</div>
				
				<div>
					<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
				</div>
			</div>
		</form>
	</c:forEach>
</body>
</html>