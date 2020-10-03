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
<script type="text/javascript" src="adminCustomerManage.js"></script>
</head>
<body>
	<h2 class="heading">일반회원관리</h2>
	<form
		action="${pageContext.request.contextPath}/admin/adminCustomerManage.do">
		<div class="form-group">
			<div class="control">
				<label for="name">검색어 </label> <select name="searchType"
					id="searchType">
					<option value="mem_no">회원번호</option>
					<option value="mem_name">이름</option>
					<option value="mem_email">이메일</option>
					<option value="mem_phone">전화번호</option>
				</select> <input type="text" id="searchVal" name="searchVal"
					value="${searchVal }">
			</div>

			<div class="control">
				<button type="submit" value="Submit" id="submit" class="col-1-4">Submit</button>
			</div>
		</div>

	</form>
	<div class="form-group" id="result">

		<table border="1" id="table">
			<thead>
				<tr>
					<th><input type="checkbox" name="all" id="all"></th>
					<th>회원번호
						<button type="button" name="mem_no" class="asc hide">a</button>
						<button type="button" name="mem_no" class="des hide">d</button>
					</th>
					<th>회원이름
						<button type="button" name="mem_name" class="asc hide">a</button>
						<button type="button" name="mem_name" class="des hide">d</button>
					</th>
					<th>이메일</th>
					<th>나이
						<button type="button" name="mem_birth" class="asc hide">a</button>
						<button type="button" name="mem_birth" class="des hide">d</button>
					</th>
					<th>전화번호</th>
					<th>지역</th>
					<th>등록일
						<button type="button" name="mem__access_status" class="asc hide">a</button>
						<button type="button" name="mem_access_status" class="des hide">d</button>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="l">
					<tr>

						<td><input type="checkbox" name="all" id="all" class="chk"></td>
						<td>${ l.mem_no}</td>
						<td>${ l.mem_name}</td>
						<td>${ l.mem_email}</td>
						<td>${ l.mem_birth}</td>
						<td>${ l.mem_phone}</td>
						<td>${ l.mem_city}</td>
						<td>${ l.mem_access_status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<button id="excel">excel</button>
		<button id="email">email</button>
	</div>
</body>
</html>