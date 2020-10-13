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
<script
src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
crossorigin="anonymous"></script>
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

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript" src="adminDesignerManage.js">
	
</script>
</head>
<body>
	<h2 class="heading">디자이너관리</h2>
	<form
		action="${pageContext.request.contextPath}/admin/adminDesignerManageFind.do">
		<div class="form-group">
			<div class="control">
				<label for="name">검색어 </label> <select name="searchType"
					id="searchType">
					<option value="designer_no">회원번호</option>
					<option value="designer_name">이름</option>
					<option value="hs_name">헤어샵이름</option>
					<option value="designer_email">이메</option>
					<option value="designer_phone">전화번호</option>
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
					<th>회원번호
					</th>
					<th>이름
					</th>
					<th>이메일
					</th>
					<th>헤어샵이름
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
						<td>${ l.designer_no}</td>
						<td>${ l.designer_name}</td>
						<td>${ l.designer_email}</td>
						<td>${ l.hs_name}</td>
						<td>${ l.designer_phone}</td>
						<td>${ l.hire_date}</td>
						<td>${ k}</td>
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