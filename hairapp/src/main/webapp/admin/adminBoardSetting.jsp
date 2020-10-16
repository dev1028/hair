<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
	<h2>board list</h2>


	<div class="" id="result">
		<table class="table table-bordered" id="dataTable" width="100%"
			cellspacing="0">

			<thead>
				<tr>
					<th>분류</th>
					<th>page</th>
					<th>id</th>
					<th>권한(쓰기/읽기)</th>
					<th>새글/총개수</th>
					<th>게시물관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="i">
					<tr>
						<td>${ i. board_type}</td>
						<td>${i.board_whov }</td>
						<td>${i.board_id }</td>
						<td>${ i.board_readable}/${i.board_writtable}</td>
						<td>${i.nevv }/${i.total }</td>
						<td><button class="btn btn-default "
								style="border: 1px solid gray;" id="goto"
								onclick="location.href='${pageContext.request.contextPath}/admin/adminInsertNotice.do?notice_who=${i.board_who }&notice_whov=${i.board_whov }'">글쓰기</button>
						</td>
					</tr>
				</c:forEach>

				<%-- <tr>
					<td>이용안내FAQ</td>
					<td>hairshop</td>
					<td>admin/hairshop</td>
					<td>${new }/${total }</td>
					<td><button>글보기</button>
						<button>글삭제</button>
						<button>고정</button></td>
				</tr> --%>
			</tbody>

		</table>
	</div>
	</div>
</body>
</html>