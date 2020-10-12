<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
html, body {
	overflow-x: hidden; /* Prevent scroll on narrow devices */
}

body {
	padding-top: 56px;
}

@media ( max-width : 991.98px) {
	.offcanvas-collapse {
		position: fixed;
		top: 56px; /* Height of navbar */
		bottom: 0;
		left: 100%;
		width: 100%;
		padding-right: 1rem;
		padding-left: 1rem;
		overflow-y: auto;
		visibility: hidden;
		background-color: #343a40;
		transition: visibility .3s ease-in-out, -webkit-transform .3s
			ease-in-out;
		transition: transform .3s ease-in-out, visibility .3s ease-in-out;
		transition: transform .3s ease-in-out, visibility .3s ease-in-out,
			-webkit-transform .3s ease-in-out;
	}
	.offcanvas-collapse.open {
		visibility: visible;
		-webkit-transform: translateX(-100%);
		transform: translateX(-100%);
	}
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: nowrap;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	color: rgba(255, 255, 255, .75);
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.nav-underline .nav-link {
	padding-top: .75rem;
	padding-bottom: .75rem;
	font-size: .875rem;
	color: #6c757d;
}

.nav-underline .nav-link:hover {
	color: #007bff;
}

.nav-underline .active {
	font-weight: 500;
	color: #343a40;
}

.text-white-50 {
	color: rgba(255, 255, 255, .5);
}

.bg-purple {
	background-color: yellowgreen;
}

.lh-100 {
	line-height: 1;
}

.lh-125 {
	line-height: 1.25;
}

.lh-150 {
	line-height: 1.5;
	
}

</style>
<script type="text/javascript">
	$(function() {
		/* $('[data-toggle="offcanvas"]').on('click', function() {
			$('.offcanvas-collapse').toggleClass('open')
		}); */

	
		$('.bxslider').bxSlider({
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true
			
		});
	});
</script>
</head>
<body>

	<main role="main" class="container">
		<div class="row">
			<div class="col">
				<br>
				<h3>마이페이지</h3>
			</div>
		</div>
		<hr>
		<div
			class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
			<!-- <img class="mr-3"
				src="{{ site.baseurl }}/docs/{{ site.docs_version }}/assets/brand/bootstrap-outline.svg"
				alt="" width="48" height="48"> -->
			<div class="lh-100">
				<h5 class="mb-0 text-white lh-100">${hairshop.hs_name}</h5>
				<small>가입일: ${hairshop.hs_regdate}</small>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col">
				<div class="bxslider" id="imgList">
						<c:forEach items="${hsPhoto}" var="hs">
						<div>
							<img onerror="this.src='../images/no_img.gif'"
								src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/hairshop/${hairshop.hs_no}/profile&img_name=${hs.hsp_file}">
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="my-3 p-3 bg-white rounded shadow-sm">
			<h6 class="border-bottom border-gray pb-2 mb-0">기본정보</h6>
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">대표자</strong>${hairshop.hs_owner}
				</p>
			</div>
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">사업자번호</strong>
					${hairshop.hs_comp_no}
				</p>
			</div>
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">전화번호</strong>
					${hairshop.hs_tel}
				</p>
			</div>
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">이메일</strong>
					${hairshop.hs_email}
				</p>
			</div>
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">주소</strong>
					${hairshop.hs_fulladdr}
				</p>
			</div>
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">영업시간</strong>
					${hairshop.hs_starttime}시 - ${hairshop.hs_endtime}시
				</p>
			</div>
			<div class="media text-muted pt-3">
				<div
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div
						class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">휴무일</strong> <a href="${pageContext.request.contextPath}/hairshop/employeeCloseDayManage.do">휴무일 수정</a>
					</div>
					<span class="d-block">${hairshop.hs_dayoff}</span>
				</div>
			</div>
			<small class="d-block text-right mt-3"> <a id="updateInfo"
				href="${pageContext.request.contextPath}/hairshop/myHairshopInfoUpdate.do">수정</a>
			</small>
		</div>

		<div class="my-3 p-3 bg-white rounded shadow-sm">
			<h6 class="border-bottom border-gray pb-2 mb-0">추가정보</h6>
			<div class="media text-muted pt-3">
				<div
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div
						class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">자재관리사용여부</strong>
						<c:if test="${hairshop.hs_resource_option eq '1'}">
							<a class="btn btn-sm btn-outline-danger disabled" role="button"
								aria-disabled="true" href="#">자재관리 사용여부 변경</a>
						</c:if>
						<c:if test="${hairshop.hs_resource_option eq '0'}">
							<a class="btn btn-sm btn-outline-success disabled" role="button"
								aria-disabled="true" href="#">자재관리 사용여부 변경</a>
						</c:if>
					</div>
					<span class="d-block"><c:if
							test="${hairshop.hs_resource_option eq '1'}">
							<span class="badge badge-pill badge-success">사용</span>
						</c:if> <c:if test="${hairshop.hs_resource_option eq '0'}">
							<span class="badge badge-pill badge-danger">미사용</span>
						</c:if></span>
				</div>
			</div>
			<div class="media text-muted pt-3">
				<div
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div
						class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">주차장여부</strong>
						<c:if test="${hairshop.hs_parking eq '1'}">
							<a class="btn btn-sm btn-outline-danger"
								href="${pageContext.request.contextPath}/hairshop/myParkingChange.do?hs_parking=0">주차장
								여부 변경</a>
						</c:if>
						<c:if test="${hairshop.hs_parking eq '0'}">
							<a class="btn btn-sm btn-outline-success"
								href="${pageContext.request.contextPath}/hairshop/myParkingChange.do?hs_parking=1">주차장
								여부 변경</a>
						</c:if>
					</div>
					<span class="d-block"><c:if
							test="${hairshop.hs_parking eq '1'}">
							<span class="badge badge-pill badge-success">보유</span>
						</c:if> <c:if test="${hairshop.hs_parking eq '0'}">
							<span class="badge badge-pill badge-danger">미보유</span>
						</c:if></span>
				</div>
			</div>
			<div class="media text-muted pt-3">
				<div
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div
						class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">승인여부</strong>
					</div>
					<span class="d-block"><c:if
							test="${hairshop.hs_approval eq '1'}">
							<span class="badge badge-pill badge-success">승인</span>
						</c:if> <c:if test="${hairshop.hs_approval eq '0'}">
							<span class="badge badge-pill badge-warning">미승인</span>
						</c:if></span>
				</div>
			</div>
			<!-- <small class="d-block text-right mt-3"> <a href="#">추가정보 수정</a> 
			</small>-->
		</div>
	</main>
</body>
</html>