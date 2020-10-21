<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/cover/">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/locales-all.min.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

#div1 {
	background:
		url("${pageContext.request.contextPath}/hairshop/aboutus/KakaoTalk_20201016_101947375.jpg");
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
}

#div2 {
	background:
		url("${pageContext.request.contextPath}/hairshop/aboutus/charming-pensive-woman-with-flowers-hair_23-2148105325.jpg");
	background-size: auto;
	background-position: center center;
	background-repeat: no-repeat;
}

#div3 {
	background:
		url("${pageContext.request.contextPath}/hairshop/aboutus/hairshopmain.jpg");
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
}

#div4 {
	background:
		url("${pageContext.request.contextPath}/hairshop/aboutus/KakaoTalk_20201016_101944755.jpg");
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
}

#div5 {
	background:
		url("${pageContext.request.contextPath}/hairshop/aboutus/appointment-booking-with-calendar_23-2148546548.jpg");
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
}

#div6 {
	background:
		url("${pageContext.request.contextPath}/hairshop/aboutus/modern-coupon-voucher-template_23-2147945687.jpg");
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
}
</style>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/hairshop/product.css"
	rel="stylesheet">
</head>
<body>
	<nav class="site-header sticky-top py-1">
		<div
			class="container d-flex flex-column flex-md-row justify-content-between">
			<a class="py-2" href="#" aria-label="Product"> </a> <a
				class="py-2 d-none d-md-inline-block"
				href="${pageContext.request.contextPath}/ajax/hairshopReturnToLogin.do">Home</a>
			<a class="py-2 d-none d-md-inline-block"
				href="${pageContext.request.contextPath}/ajax/aboutUs.do">Among
				Us</a> <a class="py-2 d-none d-md-inline-block"
				href="${pageContext.request.contextPath}/ajax/hairshopNotice.do">공지사항</a>
			<a class="py-2 d-none d-md-inline-block"
				href="${pageContext.request.contextPath}/ajax/hairshopQna.do">QnA</a>
		</div>
	</nav>

	<div
		class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
		<div class="col-md-5 p-lg-5 mx-auto my-5">
			<h1 class="display-4 font-weight-normal">우동#</h1>
			<p class="lead font-weight-normal">
				우동은 모든 미용실이 편하게 예약을 관리 할 수 있게 도와줍니다.<br> 예약부터 미용실 관리까지 모든 것을 할
				수 있습니다.
			</p>
			<a class="btn btn-outline-secondary"
				href="${pageContext.request.contextPath}/ajax/hairshopJoin.do">지금
				시작하기</a>
		</div>
		<div class="product-device shadow-sm d-none d-md-block" id="div2"></div>
		<div
			class="product-device product-device-2 shadow-sm d-none d-md-block"
			id="div1"></div>
	</div>

	<div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
		<div
			class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
			<div class="my-3 py-3">
				<h2 class="display-5">믿고 가는 헤어샵 간편 검색</h2>
				<p class="lead">
					헤어샵 찾을 때 꼭 필요한 위치와 가격 정보, <br>시술 사진과 진짜 리뷰까지 볼 수 있어 헤어샵 선택이
					쉬워져요.
				</p>
			</div>
			<div class="bg-light shadow-sm mx-auto"
				style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"
				id="div3"></div>
		</div>
		<div
			class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
			<div class="my-3 p-3">
				<h2 class="display-5">다양하고 쉬운 헤어 스타일 찾기</h2>
				<p class="lead">
					남녀/길이/펌 종류/염색 컬러 등 80여 개의 스타일 태그로<br> 내가 원하는 스타일을 찾아 바로 예약할 수
					있어요.
				</p>
			</div>
			<div class="bg-dark shadow-sm mx-auto"
				style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"
				id="div4"></div>
		</div>
	</div>

	<div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
		<div
			class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
			<div class="my-3 p-3">
				<h2 class="display-5">24시간 웹으로 간편 예약</h2>
				<p class="lead">
					시술 가능한 날짜/시간을 웹에서 확인하고, <br>아무 때나 클릭 한 번으로 예약할 수 있어요.
				</p>
			</div>
			<div class="bg-dark shadow-sm mx-auto"
				style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"
				id="div5"></div>
		</div>
		<div
			class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
			<div class="my-3 py-3">
				<h2 class="display-5">투명한 가격, 가성비 높은 메뉴 할인</h2>
				<p class="lead">
					가격 확인 후, 미리 결제하니 추가 요금 걱정도 덜고, <br>적립금 이나 쿠폰으로 부담도 덜 수 있어요.
				</p>
			</div>
			<div class="bg-light shadow-sm mx-auto"
				style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"
				id="div6"></div>
		</div>
	</div>

	<footer class="container py-5">
		<div class="row">
			<div class="col-12 col-md">
				<small class="d-block mb-3 text-muted">한국의 대표 성씨조</small>
			</div>
			<div class="col-6 col-md">
				<h5>Member</h5>
				<ul class="list-unstyled text-small">
					<li><a class="text-muted"
						href="${pageContext.request.contextPath}/members/membersMain.do">일반
							사용자</a></li>
				</ul>
			</div>
			<div class="col-6 col-md">
				<h5>Hairshop</h5>
				<ul class="list-unstyled text-small">
					<li><a class="text-muted"
						href="${pageContext.request.contextPath}/ajax/hairshopReturnToLogin.do">미용실
							사용자</a></li>
				</ul>
			</div>
			<div class="col-6 col-md">
				<h5>Designer</h5>
				<ul class="list-unstyled text-small">
					<li><a class="text-muted"
						href="${pageContext.request.contextPath}/ajax/hairshopReturnToLogin.do">디자이너</a></li>
				</ul>
			</div>
			<div class="col-6 col-md">
				<h5>Admin</h5>
				<ul class="list-unstyled text-small">
					<li><a class="text-muted"
						href="${pageContext.request.contextPath}/admin/adminLogin.jsp">관리자</a></li>
				</ul>
			</div>
		</div>
	</footer>
</body>
</html>