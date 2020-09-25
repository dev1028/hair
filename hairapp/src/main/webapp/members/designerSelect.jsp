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
	<div>
		<%@include file="/decorator/membersLeftMenu.jsp" %>
	</div>

	<c:forEach items="${list}" var="designerInfo" >
		<form action="../members/designerSelectResult.do" method="post">
			<div class="horizontal-card">
				<img src="http://via.placeholder.com/200x100" />
				<div class="horizontal-card-body">
					<span class="card-text">ID: ${designerInfo.designer_no} </span>
					<span class="card-text">이름: ${designerInfo.designer_name} </span>
					<span class="card-text">프로필: ${designerInfo.designer_profile} </span>
					<span class="card-text">직책: ${designerInfo.position} </span>
					<span class="card-text">시간: ${designerInfo.work_start_time}-${hairInfo.work_end_time} </span>
					<span class="card-text">휴일: ${designerInfo.designer_dayoff} </span>
					<h4 class="card-title"></h4>
					<span class="card-text"></span>
				</div>
				<div class="horizontal-card-footer">
					<span>Image Title</span> 
					<a class="card-text status">#View</a>
					<a class="card-text status">#Save</a>
					<!-- 예약은 로그인 상태만 가능 -->
					<c:if test="${not empty sessionScope.login }">
						<button>예약</button>
					</c:if>
				</div>
				
				<div>
					<input type="hidden" name="designerNo" value="${designerInfo.designer_no}">
					<input type="hidden" name="hsNo" value="${hairInfo.hs_no}">
					<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
				</div>
			</div>
		</form>
	</c:forEach>
</body>
</html>