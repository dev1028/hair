<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/cover/">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<!-- <link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="${pageContext.request.contextPath}/hairshop/product.css" rel="stylesheet">
<style>
#container {
	width: 70%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	padding-top: 10%; /* 테두리와 내용 사이의 패딩 여백 */
}

#list {
	text-align: center;
}

#upde {
	text-align: right;
}

/* Bootstrap 수정 */
.table>tbody>tr>th {
	background-color: #b3c6ff;
}

.table>tbody>tr>th {
	text-align: center;
}

.table-hover>tbody>tr:hover {
	background-color: #e6ecff;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

#paging {
	text-align: center;
}

.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	/* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}

/* 애니메이션 지점 설정하기 */
/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@
keyframes blink {
	from {color: white;
}
30%
{
color
:

yellow
;
}
to {
	color: red;
	font-weight: bold;
}
/* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
}
</style>


<script>
	function noticeModifyGo() {
		location.href = "hairshopNoticeMG.do";
	}

	function noticeDeleteGo() {
		location.href = "hairshopNoticeD.do";
	}

	function noticeGo() {
		location.href = "hairshopNotice.do";
	}

	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})
</script>
</head>
<body>
		<nav class="site-header sticky-top py-1">
		<div
			class="container d-flex flex-column flex-md-row justify-content-between">
			<a class="py-2" href="#" aria-label="Product"> </a> <a class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/hairshopReturnToLogin.do">Home</a> <a
				class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/aboutUs.do">Among Us</a> <a
				class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/hairshopNotice.do">공지사항</a> <a
				class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/hairshopQna.do">QnA</a>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container">
		<form method="post" name="frm" id="frm" action="">

			<div id="list">
				<h3 class="page_title">공지사항</h3>
			</div>

			<hr>
			<br> <br>
			<table class="table table-striped table-bordered table-hover">
				<thead>
				</thead>
				<tbody>
					<tr>
						<th>번호</th>
						<td>${view.notice_no}</td>
					</tr>

					<tr>	
						<th>제목</th>
						<td>${view.notice_title}</td>
					</tr>

					<tr>
						<th>작성자</th>
						<td>관리자</td>
					</tr>

					<tr>
						<th>날짜</th>
						<td>${view.notice_writedate}</td>
					</tr>

					<tr>
						<th>조회수</th>
						<td>${view.notice_hits}</td>
					</tr>

					<tr>
						<th>내용</th>
						<td><img
							src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/members/notice/${view.notice_title}&img_name=${view.notice_image}"
							style="width: 600px; height: 400px; padding: 10px"
							onerror="this.src='../images/no_img.gif'"> <%-- <img src="../${view.notice_image}" style="width: 600px; height: 400px; 
    		padding: 10px"> --%> <br> <br> <pre>
								<c:out value="${content}">${view.notice_contents}</c:out>
							</pre></td>
					</tr>
				</tbody>
			</table>

		</form>

		<button type="button" class="btn btn-outline-primary"
			onclick="noticeGo()">목록으로</button>

		<br>
		<br>
		<br>
		<!--  -->
		<%-- <c:if test="${admin == '2'}"> --%>
			<%-- <div id="upde">
				<button type="button" class="btn btn-outline-primary"
					onclick="noticeModifyGo()">수정</button>
				<button type="button" class="btn btn-outline-danger"
					data-toggle="modal" data-target="#staticBackdrop">삭제</button>
			</div> --%>
		<%-- </c:if> --%>


		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">삭제 여부 확인</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">삭제하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary"
							onclick="noticeDeleteGo()">삭제</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal 끝 -->


	</div>
</body>
</html>