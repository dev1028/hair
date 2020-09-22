<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퇴사자 현황</title>

<script type="text/javascript">
var employeelist = null;
$(function(){
 	$("#btnfiremodal").on("click", function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/ajax/findEmployees.do", 
			data : {hs_no : "${sessionScope.hsno}"},
			dataType : "json",
			method : "post",
			success : function(data) {
				employeelist = data;

				for(var i = 0; i<data.length; i++){
					var trForFire = $("<tr>").attr("id", data[i].designer_no);
					trForFire.append($("<td>").text(data[i].designer_no));
					trForFire.append($("<td>").text(data[i].position));
					trForFire.append($("<td>").text(data[i].designer_name));
					trForFire.append($("<td>").text(data[i].designer_phone));
					$("#selectForFire").append(trForFire);
				}
					
			}
		});// end of ajax 
		
		$("#staticBackdrop").modal();
	});//endof btnfiremodal
	
	$("#staticBackdrop").on('hide.bs.modal', function(){
			$("#fireemployeefrm").find("input").val("");
			employeelist = null;
			$("#selectForFire").html("");
			$("#fireemployeediv").attr("hidden","hidden");
			$("#tableForFire").removeAttr("hidden");
			
			$("#btnDesignerFire").removeAttr("hidden");
			$("#btnDesignerFireFin").attr("hidden","hidden");
	});
	
	$("#btnDesignerFire").on("click",function(){
		if(empidForFire != null){
			let today = new Date();
			for(var i = 0; i<employeelist.length; i++){
				if(employeelist[i].designer_no == empidForFire){
					$("#firedesigner_no").val(employeelist[i].designer_no);
					$("#firefin_position").val(employeelist[i].position);
					$("#firedesigner_name").val(employeelist[i].designer_name);
					$("#firehire_date").val(employeelist[i].hire_date);
					$("#firedli_leave_date").val(today.getFullYear()+"/"+(today.getMonth()+1)+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds());
				}
			}
			
			$("#tableForFire").attr("hidden","hidden");
			$("#btnDesignerFireFin").removeAttr("hidden");
			$("#btnDesignerFire").attr("hidden","hidden");
			$("#fireemployeediv").removeAttr("hidden");
		} else {
			alert("직원을 선택해 주세요.");
		}
	});
	
 	$("#btnDesignerFireFin").on("click", function(){
		if($("#firedli_reason").val() != ""){
			console.log("dddd");
			$("#fireemployeefrm").submit();			
		} else {
			alert("퇴사사유를 입력하세요.");
		}
	}); 
	
	var empidForFire = null;
	var empidTr = null;
	$("#selectForFire").on("click","tr",function(){
		if(empidTr != null){
			empidTr.css("background-color","");
		}
		empidTr = $(this);
		empidForFire = $(this).attr("id");
		$(this).css("background-color","yellow");
	});
	
});	
</script>
</head>
<body>
	<div class="container">
		<h3 class="font-weight-bold">퇴사자 목록</h3>
		<div class="row">
			<div class="col-sm">
				<hr>
				<div class="btn-group btn-group-sm" role="group"
					aria-label="Basic example">
					<button type="button" class="btn btn-primary"  id="btnfiremodal">퇴사 처리</button>
					<form
						action="${pageContext.request.contextPath}/hairshop/employeeList.do">
						<button type="submit" class="btn btn-info"
							id="btnretiredEmployeeList">직원목록으로 이동</button>
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
						<th scope="row">성명</th>
						<th scope="row">전화번호</th>
						<th scope="row">이메일</th>
						<th scope="row">최종직급</th>
						<th scope="row">입사일</th>
						<th scope="row">퇴사일</th>
						<th scope="row">퇴사사유</th>
					</tr>
				</thead>
				<tbody id="retiredEmp_list_tbody" class="table table-striped">
					<c:if test="${empty rlist}">
						<tr id="emptyEmp">
							<td colspan="8"><span>퇴사한 직원이 없습니다.</span></td>
						</tr>
					</c:if>
					<c:if test="${!empty rlist}">
						<c:forEach items="${rlist}" var="emp">
							<tr id="${emp.designer_no}">
								<td>${emp.designer_no}</td>
								<td>${emp.designer_name}</td>
								<td>${emp.designer_phone}</td>
								<td>${emp.designer_email}</td>
								<td>${emp.fin_position}</td>
								<td>${emp.hire_date}</td>
								<td>${emp.dli_leave_date}</td>
								<td>${emp.dli_reason}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>

	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">퇴사 처리</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<table id="tableForFire" class="table table-bordered table-hover table-sm text-center">
							<thead class="thead-dark">
								<tr>
									<th scope="row">직원번호</th>
									<th scope="row">직급</th>
									<th scope="row">이름</th>
									<th scope="row">전화번호</th>
								</tr>
							</thead>
							<tbody id="selectForFire">
							</tbody>
						</table>
					<div id="fireemployeediv" class="container"  hidden="hidden">
					<form  id="fireemployeefrm"
						action="${pageContext.request.contextPath}/hairshop/fireEmployee.do"
						method="post">
						<div class="form-group">
							<label for="firedesigner_name">디자이너 이름</label> 
							<input
								type="text" class="form-control" id="firedesigner_name"
								name="designer_name" placeholder="디자이너 이름을 입력해주세요." autocomplete="off" >
						</div>
						<div class="form-group">
							<label for="firefin_position">최종 직급</label> <input
								type="text" class="form-control" id="firefin_position" placeholder="-"
								name="fin_position" readonly> <small id="firefin_positionsm"
								class="form-text text-muted" >최종 직급이 다를경우 수정 후 다시 처리하세요.</small>
						</div>
						<div class="form-group">
							<label for="firehire_date">입사일</label> <input
								type="text" class="form-control" id="firehire_date" placeholder="-"
								name="hire_date" readonly>
						</div>
						<div class="form-group">
							<label for="firedli_leave_date">퇴사일</label> <input
								type="text" class="form-control" id="firedli_leave_date" placeholder="-"
								name="dli_leave_date"
								readonly> <small id="firedli_leave_datesm"
								class="form-text text-muted">퇴사일은 신청일 기준으로 반영됩니다.</small>
						</div>
						<div class="form-group">
							<label for="firedli_reason">퇴사사유</label> <input
								type="text" class="form-control" id="firedli_reason"
								name="dli_reason" 
								> <small id="firedli_reasonsm"
								class="form-text text-muted">퇴사사유를 간략하게 적어주세요.</small>
								<input type="hidden" name = "designer_no" id="firedesigner_no">
						</div>
					</form>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						id="btnDesignerFire">선택</button>
					 <button type="button" class="btn btn-danger"
						id="btnDesignerFireFin" hidden="hidden">퇴사</button> 
				</div>
			</div>
		</div>
	</div>
</body>
</html>