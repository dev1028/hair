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

<script type="text/javascript" src="adminHairshopManage.js">
	
</script>
</head>
<body>
	<h2 class="heading">헤어샵회원관리</h2>
	<form
		action="${pageContext.request.contextPath}/admin/adminHairshopManageFind.do">
		<div class="form-group">
			<div class="control">
				<label for="name">검색어 </label> <select name="searchType"
					id="searchType">
					<option value="hs_no">헤어샵번호</option>
					<option value="hs_name">헤어샵이름</option>
					<option value="hs_owner">헤어샵대표자명</option>
					<option value="hs_comp_no">사업자등록번호</option>
				</select> <input type="text" id="searchVal" name="searchVal"
					value="${searchVal }">

			</div>
			<!-- 지역별,  -->

			<div class="control">
				<button type="submit" value="Submit" id="submit" class="col-1-4">검색</button>
			</div>
		</div>

	</form>
<div class="table-responsive" id="result">
<table class="table table-bordered" id="dataTable" width="100%"
cellspacing="0">
			<thead>
				<tr>
					<th><input type="checkbox" name="all" id="all" class="chk"></th>
					<th>헤어샵번호
					</th>
					<th>헤어샵이름
					</th>
					<th>헤어샵아이디
					</th>
					<th>대표자명
					</th>
					<th>전화번호</th>
					<th>지역</th>
					<th>등록일
					</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${list }" var="l">
					<tr>

						<td><input type="checkbox" class="chk"></td>
						<td>${ l.getHs_no()}</td>
						<td>${ l.hs_name}</td>
						<td>${ l.hs_email}</td>
						<td>${ l.hs_owner}</td>
						<td>${ l.hs_tel}</td>
						<td>${ l.hs_fulladdr}</td>
						<td>${ l.hs_regdate}</td>
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