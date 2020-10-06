
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

<script type="text/javascript" src="adminQnaManage.js"></script>
</head>
<body>
	<h2 class="heading">매출결산</h2>
	<form 
		action="${pageContext.request.contextPath}/admin/adminQnaManageFind.do"> 
	
	<div class="form-group">

		<div class="control">
			<label for="name">기간 </label>
			
		</div>
	
		<div class="control">
		<select name="who" id="who" disabled="disabled">
				<option value="${vo.qna_who }">${vo.qna_who }</option>
			</select>
		
	
	
			 <select name="category" id="category" disabled="disabled">
				<option >${vo.qna_category }</option>
			</select>

		</div>

	<div class="control">
			<label for="name">답변상태 </label> <select name="answerStatus"
				id="answerStatus">
				<option value="all">전체</option>
				<option value="1">답변완료</option>
				<option value="0">미답변</option>
		
			</select>

		</div>
		<!-- <div class="control" id="answerDiv">
			<label for="name">답변상태 </label> <input type="checkbox" name="answer"
				id="answer" value="y">답변완료 <input type="checkbox"
				name="answer" value="n">답변대기

		</div> -->
		<div class="control">


			<button type="submit" value="Submit" id="submit" class="col-1-4">Submit</button>
		</div>
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
					<th>답변상태
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
					<th>답변하기</th>
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
						<td>${ l.b_no}</td>
						<td>${ l.b_category}</td>
						<td><a href="adminQnaView.do? qna_no=${ l.b_no}"><${ l.b_title}</a></td>
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
		<button id="email">email</button>
	</div>
	<!-- <button type="button" id="excel">excel</button> -->

</body>
</html>