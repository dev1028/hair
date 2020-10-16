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
					if(key.designer_no == thisTr.attr("id")){
						empOne = key;
					}
				}
				
				$("#modal_title").text(empOne.designer_name+" 상세정보");
				$("#designer_no").val(empOne.designer_no);
				$("#designer_name").val(empOne.designer_name);
				$("#designer_phone").val(empOne.designer_phone);
				$("#designer_email").val(empOne.designer_email);
				$("#designer_pw").val(empOne.designer_pw);
				
				
				
				$("#designer_dayoff").val(empOne.designer_dayoff);
				$("#work_start_time").val(empOne.work_start_time);
			
				$("#work_end_time").val(empOne.work_end_time);
				$("#position").val(empOne.position);
				$("#salary").val(empOne.salary);
				
				
				$("#incentive").val(empOne.incentive);
				$("#hire_date").val(empOne.hire_date);
			
				$("#hs_name").val(empOne.hs_name);
				$("#designer_profile").val(empOne.desginer_profile);
				$("#designer_access_status").val(empOne.designer_access_status);
				
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
			$("#insertdesigner_phoneSpan").remove();
			$("#insertdesigner_pwSpan").remove();
			$("#insertdesigner_emailSpan").remove();
			$("#insertdesigner_nameSpan").remove();
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
		<h2 class="heading">디자이너관리</h2>
		<form
			action="${pageContext.request.contextPath}/admin/adminDesignerManageFind.do">
			<%-- 	<div class="form-group">
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
 --%>
		</form>
		<div class="table-responsive" id="result">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th><input type="checkbox" name="all" id="all" class="chk"></th>
						<th>회원번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>헤어샵이름</th>
						<th>전화번호</th>

						<th>입사일</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${list }" var="l">
						<tr id="${l.designer_no }">

							<td><input type="checkbox" class="chk"></td>
							<td>${ l.designer_no}</td>
							<td id="name">${ l.designer_name}</td>
							<td id="email">${ l.designer_email}</td>
							<td>${ l.hs_name}</td>
							<td>${ l.designer_phone}</td>
							<td>${ l.hire_date}</td>
							<%-- 	<td>${ k}</td> --%>
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
											<label for="designer_name">디자이너번호</label> <input
												class="form-control" type="text" name="designer_name"
												id="designer_no" value="" />
										</div>
										<label for="designer_name">이름</label> <input
											class="form-control" type="text" name="designer_name"
											id="designer_name" value="" />
									</div>
									<div class="form-group">
										<label for="designer_email">이메일</label> <input
											class="form-control" type="text" name=designer_email
											id="designer_email" value="" />
									</div>
									<div class="form-group">
										<label for="designer_owner">비밀번호</label> <input
											class="form-control" type="text" name="designer_pw"
											id="designer_pw" value="" />
									</div>
									<div class="form-group">

										<label for="designer_phone">전화번호</label> <input
											class="form-control" type="email" name="designer_phone"
											id="designer_phone" value="" placeholder="이메일을 입력하세요." /> <span
											id="emailChecking"></span>
									</div>
									<div class="form-group">
										<label for="designer_sex">휴무일</label> <input
											class="form-control" type="text" name="designer_sex"
											id="designer_dayoff" value="" placeholder="비밀번호를 입력하세요." />
									</div>
									<div class="form-group">
										<label for="designer_name">근무시작시간</label> <input
											class="form-control" type="text" name="designer_name"
											id="work_start_time" value="" />
									</div>
									<div class="form-group">
										<label for="designer_name">종료시간</label> <input
											class="form-control" type="text" name="designer_name"
											id="work_end_time" value="" />
									</div>
									<div class="form-group">
										<label for="designer_tel">직급</label> <input
											class="form-control" type="text" name="designer_tel"
											id="position" value="" />
									</div>
									<div class="form-group">
										<label for="designer_comp_no">월급</label> <input
											class="form-control" type="text" name=designer_comp_no
											id="salary" value="" />
									</div>
									<div class="form-group">
										<label for="designer_comp_no">인센티브</label> <input
											class="form-control" type="text" name=designer_comp_no
											id="incentive" value="" />
									</div>
									<div class="form-group">
										<label for="designer_name">입사일</label> <input
											class="form-control" type="text" name="designer_name"
											id="hire_date" value="" />
									</div>
									<div class="form-group">
										<label for="designer_name">미용실 이름</label> <input
											class="form-control" type="text" name="designer_name"
											id="hs_name" value="" />
									</div>
									<div class="form-group">
										<label for="designer_tel">프로필 </label>
										<textarea id="designer_profile"></textarea>
									</div>
									<div class="form-group">
										<label for="designer_comp_no">사진</label> <input
											class="form-control" type="text" name=designer_comp_no
											id="designer_addr" value="" />
									</div>
									<div class="form-group">
										<label for="designer_comp_no">인증상태 </label> <input
											class="form-control" type="text" name=designer_comp_no
											id="designer_access_status" value="" />
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