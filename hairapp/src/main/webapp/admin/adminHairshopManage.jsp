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

<script type="text/javascript">

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
					$("#hs_profile").val(empOne.hs_profile);
					$("#hs_notice").val(empOne.hs_notice);
					$("#hs_latlong").val(empOne.hs_latlong);
					$("#hs_dayoff").val(empOne.hs_dayoff);
					$("#hs_starttime").val(empOne.hs_starttime);
					$("#hs_endtime").val(empOne.hs_endtime);
					$("#hs_parking").val(empOne.hs_parking);
					$("#hs_etc").val(empOne.hs_etc);
					$("#hs_regdate").val(empOne.hs_regdate);
					
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

			
		
		$("#all").on("click", function() {

			var check = $("#all").prop("checked");
			$("input[class=chk]").prop("checked", check);
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
					<th>헤어샵번호</th>
					<th>헤어샵이름</th>
					<th>헤어샵아이디</th>
					<th>대표자명</th>
					<th>전화번호</th>
					<th>지역</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${list }" var="l">
					<tr id = "${l.hs_no }">

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


<div class="form-group">
											<label for="hs_name">프로필</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
										</div><div class="form-group">
											<label for="hs_name">공지사항</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
										</div><div class="form-group">
											<label for="hs_name">위도경도</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
										</div><div class="form-group">
											<label for="hs_name">휴무일</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
										</div><div class="form-group">
											<label for="hs_name">시작시간</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
										</div><div class="form-group">
											<label for="hs_name">영업종료시간</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
										</div><div class="form-group">
											<label for="hs_name">주차장여부</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
										</div><div class="form-group">
											<label for="hs_name">기타</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
										</div><div class="form-group">
											<label for="hs_name">등록일</label> <input class="form-control"
												type="text" name="hs_name" id="hs_approval" value="" />
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
</body>
</html>