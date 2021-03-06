
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>HairshopQna.jsp</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/cover/">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="${pageContext.request.contextPath}/hairshop/product.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- <link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
<style>
#container {
	width: 70%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	padding-top: 10%; /* 테두리와 내용 사이의 패딩 여백 */
}

#list {
	text-align: center;
}

#write {
	text-align: right;
}

/* Bootstrap 수정 */
.table>thead {
	background-color: #b3c6ff;
}

.table>thead>tr>th {
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

tr:first-child {
	width: 10px;
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

<link href="${pageContext.request.contextPath}/hairshop/product.css"
	rel="stylesheet">
<script>
	function qnaWriteGo() {
		location.href = "hairshopQnaWG.do";
	}
</script>
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

	<br>
	<br>
	<div class="container">
		<div class=""></div>
		<form method="post" name="frm2" id="frm2"
			action="${pageContext.request.contextPath}/ajax/hairshopQnaV.do">
			<div id="list">
				<h3 class="page_title">Qna</h3>
			</div>

			<hr>
			<br> <br>
			<table class="table table-striped table-bordered table-hover">
				<%-- 				<colgroup>
					<col width="5%" />
					<col width="10%" />
					<col width="50%" />
					<col width="10%" />
					<col width="10%" />
					<col width="5%" />
				</colgroup> --%>
				<thead>
					<tr>
						<th>번호</th>
						<th>문의유형</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${write}" var="qna">
						<%--   <input type="hidden" name="noticeNo" value="${board.notice_no}"> --%>
						<%--   <input type="hidden" name="noticeHit" value="${board.notice_hits}"> --%>
						<tr>
				<%-- 		<td>
								<c:choose >
									<c:when test="${qna.qna_category == 'a1'}">입점문의</c:when>
									<c:when test="${qna.qna_category == 'a2'}">단순문의</c:when>
									<c:when test="${qna.qna_category == 'a3'}">불만문의</c:when>
								</c:choose>
							</td> --%>


							<td>${qna.qna_no}</td>
							<c:if test="${qna.qna_category == 'a1'}">
								<td>입점문의</td>
							</c:if>
							<c:if test="${qna.qna_category == 'a2'}">
								<td>단순문의</td>
							</c:if>
							<c:if test="${qna.qna_category == 'a3'}">
								<td>불만 문의</td>
							</c:if>


							<td align="left"><c:if test="${qna.qna_level > 0}">
								
									<c:forEach begin="1" end="${qna.qna_level}">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
									</c:forEach>
	&nbsp;&nbsp;&nbsp;&nbsp;RE :
	</c:if> <c:if test="${qna.qna_openstatus == '0'}">
									<!-- 공개여부 비밀글에 자물쇠 담 -->
									<img src="../images/members/lock.png"
										style="width: 13px; height: 13px;">
								</c:if> <!--  --> <a
								href="${pageContext.request.contextPath}/ajax/hairshopQnaV.do?qna_no=${qna.qna_no}&qna_hit=${qna.qna_hits}">${qna.qna_title}</a>
							</td>

							<td>${qna.qna_writer}</td>
							<td>${qna.qna_writedate}</td>
							<td>${qna.qna_hits}</td>
						<tr>
					</c:forEach>
				</tbody>
			</table>

			<hr />
			<c:if
				test="${not empty sessionScope.login && (sessionScope.udong eq 'hairshop' || sessionScope.udong eq 'designer')}">
				<div id="write">
					<a class="btn btn-default pull-right" onclick="qnaWriteGo()">글쓰기</a>
				</div>
			</c:if>

		</form>

		<!-- 페이징 -->
		<form method="post" name="frm" id="frm">
			<input type="hidden" name="p" value="1">
			<!-- value에는 페이지번호 적었음 -->
			<div id="paging">
				<my:paging paging="${paging}" jsfunc="gopage" />
			</div>
		</form>
		<!-- 페이징끝 -->

	</div>

	<script>
		function gopage(p) {
			frm.p.value = p; // 페이지번호 받아와서 submit에 넘김
			frm.submit();

		}
	</script>
</body>
</html>