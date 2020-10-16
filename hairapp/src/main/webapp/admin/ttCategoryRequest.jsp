<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {

 		$("#approval").on("click", function(){
 			var $finTr = $(this).closest("tr").children();
 			console.log($finTr);
 			console.log($(this));
 			var finUpdate1 = $finTr.eq(0).text();
 			console.log(finUpdate1);
 			

 			$.ajax({
 				url : "${pageContext.request.contextPath}/ajax/admin/tmicUpdate.do",
 				data : {
 							tmic_no : finUpdate1,
 							tmic_status : 1
 						},
 						type : "post",
 						dataType : "json",
 					});
 		})
 		$("#reject").on("click", function(){
 			var $finTr = $(this).closest("tr").children();
 			console.log($finTr);
 			console.log($(this));
 			var finUpdate1 = $finTr.eq(0).text();
 			console.log(finUpdate1);
 			

 			$.ajax({
 				url : "${pageContext.request.contextPath}/ajax/admin/tmicUpdate.do",
 				data : {
 							tmic_no : finUpdate1,
 							tmic_status : 3
 						},
 						type : "post",
 						dataType : "json",
 					});
 		})
 		$("#hold").on("click", function(){
 			var $finTr = $(this).closest("tr").children();
 			console.log($finTr);
 			console.log($(this));
 			var finUpdate1 = $finTr.eq(0).text();
 			console.log(finUpdate1);
 			

 			$.ajax({
 				url : "${pageContext.request.contextPath}/ajax/admin/tmicUpdate.do",
 				data : {
 							tmic_no : finUpdate1,
 							tmic_status : 2
 						},
 						type : "post",
 						dataType : "json",
 					});
 		})
	});

	function status() {
		var $finTr = $(this).closest("tr").children();
		console.log($finTr);
		console.log($(this));
		var finUpdate1 = $finTr.eq(0).text();
		console.log(finUpdate1);
		

		$.ajax({
			url : "${pageContext.request.contextPath}/ajax/admin/tmicUpdate.do",
			data : {
						tmic_no : finUpdate1,
						tmic_status : tmic_status
					},
					type : "post",
					dataType : "json",
				});
	}
</script>
</head>
<body>
<body>
	<div class="container">
		<br>
		<h3 class="font-weight-bold">중분류 신청 현황</h3>
		<hr>

		<div class="table-box-wrap">





			<div id="codelisttable" class="dataTables_scrollHeadInner">
				<table
					class="table table-bordered table-hover table-sm text-center TABLE table-bordered"
					id="dataTable1" width="100%" cellspacing="0">
					<thead class="thead-dark">
						<tr>
							<th scope="row">중분류번호</th>
							<th scope="row">대분류</th>
							<th scope="row">중분류 설명</th>
							<th scope="row">상태</th>
							<th scope="row">수정/삭제</th>
						</tr>

					</thead>

					<tbody id="codelisttable_tbody" class="table table-striped  ">
						<c:forEach items="${list}" var="a">
							<tr>
								<td>${a.tmic_no}</td>
								<td>${a.tmac_name }</td>
								<td>${a.tmic_explication}</td>
								<td><c:choose>

										<c:when test="${a.tmic_status ==0 }">미승인</c:when>
										<c:when test="${a.tmic_status ==2 }">보류</c:when>
										<c:when test="${a.tmic_status ==3 }">거절</c:when>

									</c:choose></td>
								<td><div class="btn-group btn-group-sm" role="group"
										aria-label="Basic example">
										<button id="approval">승인</button>
										<button id="reject">거절</button>

										<button id="hold">보류</button>
										<button type="button" class="btn btn-secondary btncodeUpdate">수정</button>
										<button type="button" class="btn btn-danger btncodeDelete">삭제</button>
									</div></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>