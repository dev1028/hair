
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript" src="adminQnaManage.js">
	
</script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">

		<h5 class="heading">qna 게시판 관리</h5>


		<form
			action="${pageContext.request.contextPath}/admin/adminQnaManageFind.do">

			<div class="form-group">

				<div class="row">

					<div class="col-2">
						<label for="name">기간 </label>
					</div>
					<div class="col">

						<button type="button" value="0" class="dateBtn form-control "
							id="all">전체</button>
					</div>
					<div class="col">
						<button type="button" value="0" class='dateBtn form-control'
							id="today">오늘</button>
					</div>
					<div class="col">
						<button type="button" value="3" class='dateBtn form-control'
							id="three">3일</button>
					</div>
					<div class="col">
						<button type="button" value="7" class='dateBtn form-control'
							id="seven">7일</button>
					</div>
					<div class="col">
						<button type="button" value="30" class='dateBtn form-control'
							id="month">1개월</button>
					</div>
					<div class="col-2">
						<input type="date" id="start" name="startDate"
							class="form-control">
					</div>
					<div class="col-2">
						<input type="date" id="end" name="endDate" class="form-control">
					</div>
				</div>




























				<div class="row">

					<div class="col-2">
						<label>사용자 </label>
					</div>
					<div class="col">
						<select name="who" id="who" class="form-control">
							<option class="form-control form-check-input" value="all">전체사용자</option>
							<option class="form-control form-check-input" value="j1">미용실</option>
							<option class="form-control form-check-input" value="j2">일반회원</option>
							<option class="form-control form-check-input" value="j3">디자이너</option>
						</select>


					</div>
					<div class="col-2">
						<label>카테고리</label>
					</div>
					<div class="col">
						<select class="form-control " name="category" id="category">
							<option class="form-control form-check-input" value="all">전체카테고리</option>
							<option class="form-control form-check-input" value="a1">입점문의</option>
							<option class="form-control form-check-input" value="a2">단순문의</option>
							<option class="form-control form-check-input" value="a3">불만문의</option>
						</select>
					</div>
					<div class="col">
						<label for="name">답변글 제외 </label>
					</div>
					<div class="col-1">
						<input type="checkbox" id="exclude" name="excludeAns"
							value="exclude" class="form-control ">
					</div>
				</div>


				<div class="row">

					<div class="col">
						<label for="name">답변상태 </label>
					</div>
					<div class="col">
						<select class="form-control " name="answerStatus"
							id="answerStatus">
							<option class="form-control form-check-input" value="all">전체</option>
							<option class="form-control form-check-input" value="1">답변완료</option>
							<option class="form-control form-check-input" value="0">미답변</option>

						</select>
					</div>
				</div>


				<div class="row">
					<div class="col-2">
						<label>게시글 찾기</label>
					</div>
					<div class="input-group-prepend">
						<select name="searchType" id="searchType" class="form-control ">
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="writer">작성자</option>
							<option value="id">ID</option>
						</select> <input type="text" id="searchVal" name="searchVal"
							class="form-control ">

					</div>
				</div>








				<div class="row">

					<button type="submit" value="Submit" id="submit"
						class="btn btn-default col-3" style="border: 1px solid gray;">검색</button>
				</div>



			</div>

		</form>



		<h5 class="heading">result</h5>
		<!-- <div class="form-group" id="result"> -->
		<div class="table-responsive" id="result">
			<table class="table table-bordered" id="dataTabl" width="100%"
				cellspacing="0">

				<thead>
					<tr>
						<th><input type="checkbox" name="all" id="all" class="chk"></th>
						<th>page
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>답변상태</th>
						<th>답변하기</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${list }" var="l">
						<tr>

							<td><input type="checkbox" class="chk"></td>
							<td>${ l.qna_whov}</td>
							<td>${ l.qna_no}</td>
							<td>${ l.qna_categoryv}</td>
							<td><c:if test="${l.qna_level > 0}">
									<c:forEach begin="1" end="${l.qna_level}">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
									</c:forEach>
	&nbsp;&nbsp;&nbsp;&nbsp;RE :
	</c:if> <a href="adminQnaView.do?qna_no=${ l.qna_no}">${ l.qna_title}</a></td>
							<td>${l.answerStatus }</td>
							<td><c:if test="${l.qna_category !='m5' }">
									<button
										onclick="location.href = 'adminQnaView.do?qna_no=${ l.qna_no}'">답변하기
									</button>
								</c:if></td>
							<td>${ l.qna_answer}</td>
							<td>${ l.qna_writedate}</td>
							<td>${ l.qna_hits}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button id="excel">excel</button>
		</div>
	</div>
	<!-- <button type="button" id="excel">excel</button> -->
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
</body>
</html>