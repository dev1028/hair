
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript" src="adminBoardManage.js">
	
</script>
</head>
<body>
	<h2 class="heading">매출결산</h2>
	<form 
		action="${pageContext.request.contextPath}/admin/adminBoardManageFind.do"> 
	
	<div class="form-group">

		<div class="control">
		
		<input type="month">
		
		
			<label for="name">기간 </label>
			<button type="button" value="0" class='dateBtn' id="all">전체 
			</button>
			<button type="button" value="0" class='dateBtn' id="today">오늘
			</button>
			<button type="button" value="3" class='dateBtn' id="three">3일
			</button>
			<button type="button" value="7" class='dateBtn' id="seven">7일
			</button>
			<button type="button" value="30" class='dateBtn' id="month">1개월
			</button>
			<input type="date" id="start" name="startDate"> -
			<input type="date" id="end" name="endDate">
		</div>
		<div class="control">
			<label for="name">게시판 선택 </label> <select name="boardType"
				id="boardType">
				
				<option id="notice" value="notice">공지</option>
				<option id="qna" value="qna">QnA</option>
			</select> <select name="category" id="category">
				<option value ="all">전체카테고리</option>
				<option value ="a1">입점문의 </option>
				<option value ="a2">단순문의 </option>
				<option value ="a3">불만문의 </option>
			</select>

		</div>
		<div class="control">
		<select name="who" id="who">
				<option value="j1">미용실</option>
				<option value="j2">일반회원  </option>
				<option value="j3">디자이너  </option>
			</select>
		
		</div>

		<div class="control">
			<label for="name">게시글 찾기 </label> <select name="searchType"
				id="searchType">
				<option value="title">제목</option>
				<option value="contents">내용</option>
				<option value="writer">작성자</option>
				<option value="id">ID</option>
			</select> <input type="text" id="searchVal" name="searchVal">

		</div>



		<div class="control" id="answerDiv">
			<label for="name">답변상태 </label> <input type="checkbox" name="answer"
				id="answer" value="y">답변완료 <input type="checkbox"
				name="answer" value="n">답변대기

		</div>
		<div class="control">


			<button type="submit" value="Submit" id="submit" class="col-1-4">Submit</button>
		</div>
	</div>
	</form>



	<h2 class="heading">result</h2>
	<div class="table-responsive" id="result">
<table class="table table-bordered" id="dataTable" width="100%"
cellspacing="0">
			<thead>
				<tr>
					<th><input type="checkbox" name="all" id="all" class="chk"></th>
					<th>번호
					</th>
					<th>분류
					</th>
					<th>제목
					</th>
					<th>답변상태
					</th>
					<th>답변하기</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수
					</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${list }" var="l">
					<tr>

						<td><input type="checkbox" class="chk"></td>
						<td>${ l.b_no}</td>
						<td>${ l.b_category}</td>
						<td>${ l.b_title}</td>
						<td>${ l.b_as}</td>
						<td>${ l.b_a}</td>
						<td>${ l.b_writer}</td>
						<td>${ l.b_wd}</td>
						<td>${ l.b_hits}</td>
						<td>${ l.b_who}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button id="excel">excel</button>
	</div>
	<!-- <button type="button" id="excel">excel</button> -->

</body>
</html>