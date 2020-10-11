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
<script>

$("#all").on("click", function() {

	var check = $("#all").prop("checked");
	$("input[class=chk]").prop("checked", check);
})
$(document).on(
		"click",
		"#excel",
		function() {

			var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
			var table_html = encodeURIComponent(document
					.getElementById('table').outerHTML);

			var a = document.createElement('a');
			a.href = data_type + ',%EF%BB%BF' + table_html;
			a.download = 'test' + '_excel' + '.xls';
			a.click();

		})
</script>
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
	<div class="table-responsive" id="result">
<table class="table table-bordered" id="dataTable" width="100%"
cellspacing="0">
			<thead>
				<tr>
				<th><input type="checkbox" name="all" id="all" class="chk"></th>
					<th>회원번호
					</th>
					<th>회원이름
					</th>
					<th>이메일</th>
					<th>나이
					</th>
					<th>전화번호</th>
					<th>지역</th>
					<th>등록일
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="l">
					<tr>

						<td><input type="checkbox" class="chk"></td>
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