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
<script>
	$(function() {

		var jsonlist = ${jsonlist};
		var empOne;
		var clickcnt = 0;
		var thisTr;
		$("#all").on("click", function() {

			var check = $("#all").prop("checked");
			$("input[class=chk]").prop("checked", check);
		})
		$("#email").on("click", function() {
			var name = [];
			var email = [];
			$("input[class='chk']:checked").each(function() {
				//	console.log($(this).closest('tr').find($("#name").val());
				console.log($(this).parent().eq(2).val());
				name.push($(this).parent().eq(2).val());
				email.push($(this).parent().eq(3).val());
			})

			$("#modal_title").text(" 디자이너 상세정보");
			$("#name").val(name);
			$("#email").val(email);

			$("#myModal").modal('toggle');

			$("#option1").attr("checked", true);
			$("#infoFrm").show();
			clickcnt = 0;
		})
		$(document)
				.on(
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
					<th>회원번호</th>
					<th>회원이름</th>
					<th>이메일</th>
					<th>나이</th>
					<th>전화번호</th>
					<th>지역</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="l">
					<tr>

						<td><input type="checkbox" class="chk"></td>
						<td>${ l.mem_no}</td>
						<td id="name">${ l.mem_name}</td>
						<td id="email">${ l.mem_email}</td>
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





	<div class="modal fade" id="myModal" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id="modal_title">이메일 전송</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container">
						<div class="text-center"></div>
						<hr>
						<form id="empUpdatefrm"
							action="${pageContext.request.contextPath}/admin/sendEmailToCustomer.do">
							<div class="form-group">
								<div class="form-group">
									<label for="no">번호</label> <input type="text" name="no" id="no"
										value="" />
								</div>
								<label for="name">이름</label> <input type="text" name="name"
									id="name" value="" />
							</div>


							<div class="form-group">

								<label for="email">이메일</label> <input type="email" name="email"
									id="email" value="" placeholder="이메일을 입력하세요." /> <span
									id="emailChecking"></span>
							</div>
							<div class="form-group">

								<label for="hs_email">내용</label>



								<textarea rows="" cols=""></textarea>
							</div>

						</form>
						<hr>

					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<div class="row">

						<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>