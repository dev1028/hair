


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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script type="text/javascript">
	$(function() {
		$("#all").on("click", function() {

			var check = $("#all").prop("checked");
			$("input[class=chk]").prop("checked", check);
		})
		
		
	
		
		$("#all2").on("change",function(){
			if($(this).val()==="all"){
				$(".unc").show();
				$(".com").show();
			}else if($(this).val()==="-1"){
				$(".unc").show();
				$(".com").hide();
			}else{
				$(".unc").hide();
				$(".com").show();
			}
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
	})
</script>




<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>
var hairshoplist = ${hairshoplist};
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
			for(var key of hairshoplist){
				if(key.hs_no == thisTr.attr("id")){
					empOne = key;
				}
			}
			
			$("#modal_title").text(empOne.hs_name+" 상세정보");
			$("#hs_no").val(empOne.hs_no);
			$("#hs_name").val(empOne.hs_name);
			$("#hs_tel").val(empOne.hs_tel);
			$("#hs_email").val(empOne.hs_email);
			$("#hs_comp_no").val(empOne.hs_comp_no);
			$("#hs_owner").val(empOne.hs_owner);
			$("#hs_pw").val(empOne.hs_pw);
			$("#hs_fulladdr").val(empOne.hs_fulladdr);
			$("#hs_approval").val(empOne.hs_approval);
			
			$("#myModal").modal('toggle');
			
			$("#option1").attr("checked",true);
			$("#infoFrm").show();
			clickcnt = 0;
		} else if(clickcnt == 1 && $(this).attr("id") != thisTr.attr("id")){
			clickcnt = 0;
		}
			
	});//tr on click event
	
	$("#myModal").on('hide.bs.modal', function(){
		$("#modal_title").text("");
		empOne = null;
		$("#infoFrm").hide();
		$("#profileFrm").hide();
		$("#jobFrm").hide();
		$("#moneyFrm").hide();
		$("input:radio[name='options']").removeAttr("checked");
		
		$("#empUpdatefrm").find("input").each(function(index){
			$(this).val(arrayBeforeUpdate[index]);
		});
		$("#empprofile").attr("readonly", true);
		$("#empUpdatefrm").find("input").attr("readonly", true);
		$("#empUpdatefrm").find("label").css('color', 'black');
		$("#radioForFrms").find("label").attr("class","btn btn-secondary")
		$("#changeFormToUpdate").attr("class", "btn btn-warning").text("승인");
	 });
	
	
	
	
	$("#staticBackdrop").on('hide.bs.modal', function(){
		$("#inserths_phoneSpan").remove();
		$("#inserths_pwSpan").remove();
		$("#inserths_emailSpan").remove();
		$("#inserths_nameSpan").remove();
	 });
	
	var arrayBeforeUpdate = [];

	
});	
</script>
</head>
<body>
	<div class="container">
		<h3 class="font-weight-bold">신규 헤어샵 관리</h3>

		<div class="row">
			<div class="col-sm">
				<hr>
				<div class="btn-group btn-group-sm" role="group"
					aria-label="Basic example">

					<div class="control">
						<select name="find" id="all2">
							<option value="all">전체조회</option>
							<option value="0">인증완료</option>
							<option value="-1">미인증</option>

						</select>
					</div>






				</div>
				<hr>
			</div>
			<div class="col-sm"></div>
		</div>
	</div>
	<div class="container">


		<div class="table-responsive" id="result">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th><input type="checkbox" name="all" id="all" class="chk"></th>
						<th>헤어샵번호</th>
						<th>헤어샵이름</th>
						<th>헤어샵아이디</th>
						<th>대표자명</th>
						<th>전화번호</th>
						<th>지역</th>
						<th>등록일</th>
						<th>인증상태</th>

					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${list }" var="l">
						<tr id="${l.hs_no}"
							<c:choose>

									<c:when test="${ l.hs_approval=='0'}">class="com"
									
									</c:when>
									<c:when test="${ l.hs_approval=='-1'}">class="unc"</c:when>
								</c:choose>>

							<td><input type="checkbox" class="chk"></td>
							<td>${ l.getHs_no()}</td>
							<td>${ l.hs_name}</td>
							<td>${ l.hs_email}</td>
							<td>${ l.hs_owner}</td>
							<td>${ l.hs_tel}</td>
							<td>${ l.hs_fulladdr}</td>
							<td>${ l.hs_regdate}</td>
							<td><c:choose>

									<c:when test="${ l.hs_approval=='0'}">인증완료<button
											onclick="location.href='${pageContext.request.contextPath}/admin/adminNewHairshopApproval.do?hs_no=${l.hs_no}'">승인</button>
									</c:when>
									<c:when test="${ l.hs_approval=='-1'}">미인증</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>

		<div>



			<button id="excel">excel</button>
			<button id="email">email</button>
		</div>


		<div class="modal fade" id="myModal" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title" id="modal_title">상세 정보</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div class="container">

							<form id="empUpdatefrm"
								action="${pageContext.request.contextPath}/hairshop/newHairshopApproval.do">
								<div class="card">
									<div class="card-body">
										<div class="form-group">
											<div class="form-group">
												<label for="hs_name">헤어샵번호</label> <input
													class="form-control" type="text" name="hs_name" id="hs_no"
													value="" />
											</div>
											<label for="hs_name">이름</label> <input class="form-control"
												type="text" name="hs_name" id="hs_name" value="" />
										</div>
										<div class="form-group">
											<label for="hs_comp_no">사업자번호</label> <input
												class="form-control" type="text" name=hs_comp_no
												id="hs_comp_no" value="" />
										</div>
										<div class="form-group">
											<label for="hs_owner">대표자명</label> <input
												class="form-control" type="text" name="hs_owner"
												id="hs_owner" value="" />
										</div>
										<div class="form-group">

											<label for="hs_email">이메일</label> <input class="form-control"
												type="email" name="hs_email" id="hs_email" value=""
												placeholder="이메일을 입력하세요." /> <span id="emailChecking"></span>
										</div>
										<div class="form-group">
											<label for="hs_pw">비밀번호</label> <input class="form-control"
												type="text" name="hs_pw" id="hs_pw" value=""
												placeholder="비밀번호를 입력하세요." />
										</div>
										<div class="form-group">
											<label for="hs_name">주소</label> <input class="form-control"
												type="text" name="hs_name" id="hs_fulladdr" value="" />
										</div>
										<div class="form-group">
											<label for="hs_name">승인여부</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
										</div>
										<div class="form-group">
											<label for="hs_tel">전화번호</label> <input class="form-control"
												type="text" name="hs_tel" id="hs_tel" value=""
												placeholder="전화번호를 입력하세요." />
										</div>


									</div>
								</div>
							</form>


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
	</div>

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
</body>
</html>