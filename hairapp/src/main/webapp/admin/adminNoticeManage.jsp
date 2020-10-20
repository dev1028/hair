
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


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>

<script type="text/javascript" src="adminNoticeManage.js">
	
</script>
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

</head>
<body>
	<div class="container">

		<h2 class="heading">공지사항 게시판 관리</h2>
		<form
			action="${pageContext.request.contextPath}/admin/adminNoticeManageFind.do">

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
				<div class="col">

					<button type="submit" value="Submit" id="submit"
						class="btn btn-default col-3" style="border: 1px solid gray;">검색</button>
				</div>
				</div>





			</div>

		</form>


${list }
		<div class="table-responsive" id="result">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th><input type="checkbox" name="all" id="all" class="chk"></th>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${list }" var="l">
						<tr>

							<td><input type="checkbox" class="chk"></td>
							<td>${ l.notice_no}</td>
							<td>${ l.notice_whov}</td>
							<td><a href="adminNoticeView.do?notice_no=${ l.notice_no}">${ l.notice_title}</a></td>

							<td>${ l.emp_alias}</td>
							<td>${ l.notice_writedate}</td>
							<td>${ l.notice_hits}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button id="excel">excel</button>
		</div>
	</div>

</body>
</html>