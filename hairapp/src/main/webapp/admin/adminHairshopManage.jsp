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

<script type="text/javascript" src="adminBoardManage.js">
	
</script>
</head>
<body>
	<h2 class="heading">헤어샵회원관리</h2>
	<div class="form-group">
		<div class="control">
			<label for="name">검색어 </label> <select name="searchType"
				id="searchType">
				<option value="notice_title">헤어샵번호</option>
				<option value="contents">헤어샵이름</option>
				<option value="writer">헤어샵대표자명</option>
				<option value="id">사업자등록번호</option>
			</select> <input type="text" id="searchVal">
		</div>
		<!-- 지역별,  -->

		<div class="control">
			<button type="button" value="Submit" id="submit" class="col-1-4">Submit</button>
		</div>
	</div>

	<h2 class="heading">지출합계</h2>
	<div class="form-group" id="result">

		<table border="1">

			<tr>
				<th>헤어샵번호</th>
				<th>헤어샵이름</th>
				<th>헤어샵아이디</th>
				<th>대표자명</th>
				<th>전화번호</th>
				<th>지역</th>
				<th>등록일</th>
			</tr>
			<c:forEach items="${list }" var ="list">
			<tr>
			<td>${ list.hs_no}</td>
			<td>${ list.hs_name}</td>
			<td>${ list.hs_email}</td>
			<td>${ list.hs_owner}</td>
			<td>${ list.hs_tel}</td>
			<td>${ list.hs_fulladdr}</td>
			<td>${ list.hs_regdate}</td>
			
			</c:forEach>
		</table>

	</div>
	<!-- <button type="button" id="excel">excel</button> -->

</body>
</html>