
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript" src="adminNoticeManage.js">
	
</script>
</head>
<body>
	<h2 class="heading">매출결산</h2>
	<form 
		action="${pageContext.request.contextPath}/admin/adminNoticeManageFind.do"> 
	
	<div class="form-group">

		<div class="control">
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
		<select name="who" id="who">
				<option value="all">전체페이지</option>
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



	

			<button type="submit" value="Submit" id="submit" class="col-1-4">Submit</button>
		</div>

	</form>



	<h2 class="heading">result</h2>
	<div class="form-group" id="result">
	<table border="1" id="table">
			<thead>
				<tr>
					<th><input type="checkbox" name="all" id="all" class="chk"></th>
					<th>번호
						<button type="button" name="designer_no" class="asc hide">a</button>
						<button type="button" name="designer_no" class="des hide">d</button>
					</th>
					<th>분류
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
					<th>제
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
					
				
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${list }" var="l">
					<tr>

						<td><input type="checkbox" class="chk"></td>
						<td>${ l.notice_no}</td>
						<td>${ l.notice_whov}</td>
						<td><a href="adminNoticeView.do?notice_no=${ l.notice_no}">${ l.notice_title}</a></td>
						
						<td>${ l.emp_no}</td>
						<td>${ l.notice_writedate}</td>
						<td>${ l.notice_hits}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button id="excel">excel</button>
	</div>
	<!-- <button type="button" id="excel">excel</button> -->

</body>
</html>