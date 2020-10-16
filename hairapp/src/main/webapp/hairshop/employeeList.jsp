<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원리스트</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>
var emplistjson = ${emplistjson};
var empOne;
var clickcnt = 0;
var thisTr;
$(function() {
	$("#infoFrm").hide();
	$("#profileFrm").hide();
	$("#jobFrm").hide();
	$("#moneyFrm").hide();
	$("#emp_list_tbody").on("click","tr",function(){
		if(clickcnt == 0){
			thisTr = $(this);
			setTimeout(function(){
				clickcnt = 0;
			}, 500);
			clickcnt++;
		} else if(clickcnt == 1 && $(this).attr("id") == thisTr.attr("id")){
			for(var emp of emplistjson){
				if(emp.designer_no == thisTr.attr("id")){
					empOne = emp;
				}
			}
			
			$("#modal_title").text(empOne.designer_name+" 디자이너 상세정보");
			$("#empno").val(empOne.designer_no);
			$("#empname").val(empOne.designer_name);
			$("#empphone").val(empOne.designer_phone);
			$("#empemail").val(empOne.designer_email);
			$("#emphiredate").val(empOne.hire_date);
			$("#empworkstarttime").val(empOne.work_start_time);
			$("#empworkendtime").val(empOne.work_end_time);
			$("#empdayoff").val(empOne.designer_dayoff);
			$("#desDayoffAtag").attr("href", "${pageContext.request.contextPath}/hairshop/employeeCloseDayManage.do?designer_no="+empOne.designer_no);
			$("#empsalary").val(empOne.salary);
			$("#empincentive").val(empOne.incentive);
			$("#empposition").val(empOne.position);
			$("#empprofile").val(empOne.designer_profile);
			$("#imgDes").attr("src", "${pageContext.request.contextPath}/ajax/imgView.do?img_path=/designer/"+empOne.designer_no+"/profile&img_name="+empOne.file_name)
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
		$("#imgDes").attr("src", "#");
		$("#desDayoffAtag").attr("href", "#");
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
		$("#changeFormToUpdate").attr("class", "btn btn-warning").text("디자이너 정보 수정");
	 });
	
	
	$("#radioForFrms").on("click","input", function(){
		$("#infoFrm").hide();
		$("#profileFrm").hide();
		$("#jobFrm").hide();
		$("#moneyFrm").hide();
		if($(this).attr("id") == "option1"){
			$("#infoFrm").show();
		} else if($(this).attr("id") == "option2"){
			$("#profileFrm").show();
		} else if($(this).attr("id") == "option3"){
			$("#jobFrm").show();
		} else if($(this).attr("id") == "option4"){
			$("#moneyFrm").show();
		}
	});
	
	$("#btnDesignerInsert").on("click", function(){
		var insertnullcheck = 0;
			if($("#insertdesigner_name").val() == ""){
				if($("#insertdesigner_nameSpan") != null){
					$("#insertdesigner_nameSpan").remove();
				}
				$("#insertdesigner_name").after($("<span>").attr("id","insertdesigner_nameSpan").text("디자이너 이름을 입력해주세요.").css('color', 'red'));
				insertnullcheck++;
			}
			if($("#insertdesigner_email").val() == ""){
				if($("#insertdesigner_emailSpan") != null){
					$("#insertdesigner_emailSpan").remove();
				}
				
				$("#insertdesigner_email").after($("<span>").attr("id","insertdesigner_emailSpan").text("디자이너 이메일을 입력해주세요.").css('color', 'red'));
				insertnullcheck++;
			}
			if($("#insertdesigner_pw").val() == ""){
				if($("#insertdesigner_pwSpan") != null){
					$("#insertdesigner_pwSpan").remove();
				}
				$("#insertdesigner_pw").after($("<span>").attr("id","insertdesigner_pwSpan").text("임시비밀번호를 입력해주세요.").css('color', 'red'));
				insertnullcheck++;
			}
			if($("#insertdesigner_phone").val() == ""){
				if($("#insertdesigner_phoneSpan") != null){
					$("#insertdesigner_phoneSpan").remove();
				}
				$("#insertdesigner_phone").after($("<span>").attr("id","insertdesigner_phoneSpan").text("디자이너 전화번호를 입력해주세요.").css('color', 'red'));
				insertnullcheck++;
			}
			
			if(insertnullcheck == 0){
				$("#designerInsertFrm").submit();
			}
			
	});
	$("#staticBackdrop").on('hide.bs.modal', function(){
		$("#insertdesigner_phoneSpan").remove();
		$("#insertdesigner_pwSpan").remove();
		$("#insertdesigner_emailSpan").remove();
		$("#insertdesigner_nameSpan").remove();
	 });
	
	var arrayBeforeUpdate = [];
	
	$("#changeFormToUpdate").on("click", function(){
		if(arrayBeforeUpdate.length != 0){
			if(nCheck($("#empworkstarttime").val()) && nCheck($("#empworkendtime").val())){
				if(parseInt($("#empworkstarttime").val()) < parseInt($("#empworkendtime").val()) &&
				0<=parseInt($("#empworkstarttime").val()) &&
				parseInt($("#empworkendtime").val()) < 24
				) {
					if(nCheck($("#empsalary").val()) || $("#empsalary").val() == ''){
						if($. isNumeric($("#empincentive").val()) ||$("#empincentive").val()==''){
							$("#empUpdatefrm").submit();
						} else{
							alert("인센티브의 값이 적합하지 않습니다.");
						}
					} else {
						alert("기본급여는 숫자만 가능합니다.");
					}
				} else{
					alert("시작시간이 종료시간보다 작아야합니다.");
				}
			} else{
				alert("숫자만 가능합니다.");
			}	
		}
		$("#empUpdatefrm").find("input").each(function(index){
			arrayBeforeUpdate.push($(this).val())
		});
		$("#empprofile").attr("readonly", false);
		$("#empUpdatefrm").find("input").attr("readonly", false);
		$("#empUpdatefrm").find("#empname,#empno,#empemail,#emphiredate,#empdayoff").attr("readonly",true);
		$("#empUpdatefrm").find("label").css('color', 'blue');
		$("#radioForFrms").find("label").attr("class","btn btn-primary")
		$("#changeFormToUpdate").attr("class", "btn btn-danger").text("변경내용 승인");
	});
	
});	

function nCheck(num){
    if(/[^0123456789]/g.test(num)){
        return false;
    }
    return true;
}
</script>
</head>
<body>	
	<div class="container">
		<h3 class="font-weight-bold">직원목록</h3>
		<div class="row">
			<div class="col-sm">
				<hr>
				<div class="btn-group btn-group-sm" role="group"
					aria-label="Basic example">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#staticBackdrop">직원등록</button>
					<form
						action="${pageContext.request.contextPath}/hairshop/retiredEmployeeList.do">
						<button type="submit" class="btn btn-info"
							id="btnretiredEmployeeList">퇴사자목록으로 이동</button>
					</form>
				</div>
				<hr>
			</div>
			<div class="col-sm"></div>
		</div>
	</div>
	<div class="container">
		<div id="codelisttable">
			<table class="table table-bordered table-hover table-sm text-center">
				<thead class="thead-dark">
					<tr>
						<th scope="row">직원번호</th>
						<th scope="row">직급</th>
						<th scope="row">성명</th>
						<th scope="row">전화번호</th>
						<th scope="row">입사일</th>
						<th scope="row">휴무일</th>
					</tr>
				</thead>
				<tbody id="emp_list_tbody" class="table table-striped">
					<c:forEach items="${emplist}" var="emp">
						<tr id="${emp.designer_no}">
							<td><c:if test="${emp.designer_access_status == '-1'}"><span class="badge badge-pill badge-danger">미인증</span></c:if>
							<c:if test="${emp.designer_access_status == '0'}"><span class="badge badge-pill badge-warning">수정전</span></c:if>
							<strong>${emp.designer_no}</strong></td>
							<td>${emp.position}</td>
							<td>${emp.designer_name}</td>
							<td>${emp.designer_phone}</td>
							<td>${emp.hire_date}</td>
							<td>${emp.designer_dayoff}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="modal fade" id="myModal"	data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title" id="modal_title">디자이너 상세 정보</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div class="container">
							<div class="text-center">
								<img id="imgDes" onerror="this.src='../images/no_img.gif'" src="#" class="img-fluid">
							</div>
							<hr>
							<div class="row">
								<div class="col align-self-start">
									<div class="btn-group btn-group-toggle" data-toggle="buttons"
										id="radioForFrms">
										<label class="btn btn-secondary active"> <input
											type="radio" name="options" id="option1" autocomplete="off"
											checked> 기본정보
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="options" id="option2" autocomplete="off"> 프로필정보
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="options" id="option3" autocomplete="off"> 근무정보
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="options" id="option4" autocomplete="off"> 급여정보
										</label>
									</div>
								</div>
							</div>
							<hr>
							<form id="empUpdatefrm" action="${pageContext.request.contextPath}/hairshop/employeeUpdate.do" method="post">
								<div id="infoFrm">
									<div class="form-group row">
										<label for="empno" class="col-sm-4 col-form-label">직원번호</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empno" name="designer_no" value="">
										</div>
									</div>
									<div class="form-group row">
										<label for="empposition" class="col-sm-4 col-form-label">직급</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empposition" name="position" value="">
										</div>
									</div>
									<div class="form-group row">
										<label for="empname" class="col-sm-4 col-form-label">이름</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empname" name="designer_name" value="">
										</div>
									</div>
									<div class="form-group row">
										<label for="empphone" class="col-sm-4 col-form-label">전화번호</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empphone" name="designer_phone" value="">
										</div>
									</div>
									<div class="form-group row">
										<label for="empemail" class="col-sm-4 col-form-label">이메일</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empemail" name="designer_email" value="">
										</div>
									</div>
									<div class="form-group row">
										<label for="emphiredate" class="col-sm-4 col-form-label">입사일</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="emphiredate" name="hire_date" value="">
										</div>
									</div>
								</div>
							
								<div id="profileFrm" class="input-group">
								  
								  <textarea id= "empprofile" name="designer_profile" readonly rows="10" class="form-control" aria-label="With textarea"></textarea>
								</div>
								<div id="jobFrm">
									<div class="form-group row">
										<label for="empworkstarttime" class="col-sm-4 col-form-label">근무시작
											시간</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empworkstarttime" name="work_start_time" value="">
										</div>
									</div>
									<div class="form-group row">
										<label for="empworkendtime" class="col-sm-4 col-form-label">근무종료
											시간</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empworkendtime" name="work_end_time" value="">
										</div>
									</div>
									<div class="form-group row">
										<label for="empdayoff" class="col-sm-4 col-form-label"><a id="desDayoffAtag" href="#" title="디자이너 휴무일 수정페이지로 이동">휴무일</a></label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empdayoff" name="designer_dayoff" value="">
										</div>
									</div>

								</div>
								<div id="moneyFrm">
									<div class="form-group row">
										<label for="empsalary" class="col-sm-4 col-form-label">기본급여</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empsalary" name="salary" value="">
										</div>
									</div>
									<div class="form-group row">
										<label for="empincentive" class="col-sm-4 col-form-label">인센티브</label>
										<div class="col-sm-6">
											<input type="text" readonly class="form-control-plaintext"
												id="empincentive" name="incentive" value="">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<div class="row">
							<button type="button" class="btn btn-warning"
								id="changeFormToUpdate">디자이너 정보 수정</button>
							<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">직원등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="designerInsertFrm"
						action="${pageContext.request.contextPath}/hairshop/employeeSimpleJoin.do"
						method="post">
						<div class="form-group">
							<label for="formGroupExampleInput">디자이너 이름</label> <input
								type="text" class="form-control" id="insertdesigner_name"
								name="designer_name" placeholder="홍길동">
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput">이메일</label> <input
								type="email" class="form-control" id="insertdesigner_email"
								name="designer_email" aria-describedby="emailHelp"
								placeholder="name@example.com"> <small id="emailHelp"
								class="form-text text-muted">이메일 인증이 완료되어야 로그인이 가능합니다.</small>
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput">임시 비밀번호</label> <input
								type="password" class="form-control" id="insertdesigner_pw"
								name="designer_pw" placeholder="디자이너가 로그인할 초기 비밀번호입니다.">
							<small id="emailHelp" class="form-text text-muted">비밀번호는
								디자이너에게 이메일로 안전하게 전달됩니다.</small>
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">전화번호</label> <input
								type="text" class="form-control" id="insertdesigner_phone"
								name="designer_phone" placeholder="010-0000-0000">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						id="btnDesignerInsert">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>