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
var jsonlist = ${jsonlist};
var empOne;
var clickcnt = 0;
var thisTr;
	$(function() {

		$("#tbody").on("click","tr",function(){
			if(clickcnt == 0){
				thisTr = $(this);
				setTimeout(function(){
					clickcnt = 0;
				}, 500);
				clickcnt++;
			} else if(clickcnt == 1 && $(this).attr("id") == thisTr.attr("id")){
				for(var key of jsonlist){
					if(key.mem_no == thisTr.attr("id")){
						empOne = key;
					}
				}
				
				$("#modal_title").text(empOne.mem_name+" 상세정보");
				$("#mem_no").val(empOne.mem_no);
				$("#mem_name").val(empOne.mem_name);
				$("#mem_phone").val(empOne.mem_phone);
				$("#mem_email").val(empOne.mem_email);
				$("#mem_pw").val(empOne.mem_pw);
				$("#mem_addr").val(empOne.mem_addr);
				$("#mem_regdate").val(empOne.mem_regdate);
				if(empOne.mem_sex === 'female'){
					
				$("#mem_sex").val("여자");
				}else{
					$("#mem_sex").val("남자");
				}
				$("#mem_birth").val(empOne.mem_birth.substring(0,10));
				$("#mem_age").val(empOne.mem_age);
				$("#mem_saved_money").val(empOne.mem_saved_money);
				$("#mem_zip").val(empOne.mem_zip);
				$("#myModal").modal('toggle');
				clickcnt = 0;
			} else if(clickcnt == 1 && $(this).attr("id") != thisTr.attr("id")){
				clickcnt = 0;
			}
				
		});//tr on click event
		
		$("#myModal").on('hide.bs.modal', function(){
			$("#modal_title").text("");
			empOne = null;
		
			
		
		 });
		
		
		
		
		$("#staticBackdrop").on('hide.bs.modal', function(){
			$("#insertmem_phoneSpan").remove();
			$("#insertmem_pwSpan").remove();
			$("#insertmem_emailSpan").remove();
			$("#insertmem_nameSpan").remove();
		 });
		
		var arrayBeforeUpdate = [];
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

			$("#modal_title").text("  상세정보");
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
	<div class="container">
		<h2 class="heading">일반회원관리</h2>

		<div class="table-responsive" id="result">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th><input type="checkbox" name="all" id="all" class="chk"></th>
						<th>회원번호</th>
						<th>회원이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>성별</th>
						<th>나이</th>
						<th>지역</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${list }" var="l">
						<tr id="${l.mem_no }">

							<td><input type="checkbox" class="chk"></td>
							<td>${ l.mem_no}</td>
							<td id="name">${ l.mem_name}</td>
							<td id="email">${ l.mem_email}</td>
							<td>${ l.mem_phone}</td>
							<td><c:choose>
									<c:when test="${ l.mem_sex == 'female'}">여자</c:when>
									<c:when test="${ l.mem_sex == 'male'}">남자</c:when>
								</c:choose></td>
							<td>${ l.mem_age}</td>
							<td>${ l.mem_city}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<button id="excel">excel</button>
			<button id="email">email</button>
		</div>


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

							<div class="card">
								<div class="card-body">
									<div class="form-group">
										<div class="form-group">
											<label for="mem_name">회원번호</label> <input
												class="form-control" type="text" name="mem_name" id="mem_no"
												value="" />
										</div>
										<label for="mem_name">이름</label> <input class="form-control"
											type="text" name="mem_name" id="mem_name" value="" />
									</div>
									<div class="form-group">
										<label for="mem_email">이메일</label> <input class="form-control"
											type="text" name=mem_email id="mem_email" value="" />
									</div>
									<div class="form-group">
										<label for="mem_owner">비밀번호</label> <input
											class="form-control" type="text" name="mem_pw" id="mem_pw"
											value="" />
									</div>
									<div class="form-group">

										<label for="mem_phone">전화번호</label> <input
											class="form-control" type="email" name="mem_phone"
											id="mem_phone" value="" placeholder="이메일을 입력하세요." /> <span
											id="emailChecking"></span>
									</div>
									<div class="form-group">
										<label for="mem_sex">성별</label> <input class="form-control"
											type="text" name="mem_sex" id="mem_sex"  value=""
											placeholder="비밀번호를 입력하세요." />
									</div>
									<div class="form-group">
										<label for="mem_name">생년월일</label> <input class="form-control"
											type="text" name="mem_name" id="mem_birth" value="" />
									</div>
									<div class="form-group">
										<label for="mem_name">나이</label> <input class="form-control"
											type="text" name="mem_name" id="mem_age" value="" />
									</div>
									<div class="form-group">
										<label for="mem_tel">적립금</label> <input class="form-control"
											type="text" name="mem_tel" id="MEM_SAVED_MONEY" value=""
											 />
									</div>
									<div class="form-group">
										<label for="mem_comp_no">주소</label> <input
											class="form-control" type="text" name=mem_comp_no
											id="mem_addr" value="" />
									</div>
									<div class="form-group">
										<label for="mem_comp_no">우편번호</label> <input
											class="form-control" type="text" name=mem_comp_no
											id="mem_zip" value="" />
									</div>

								</div>
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