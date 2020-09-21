<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퇴사자 현황</title>
</head>
<body>
	<div class="container">
		<h3 class="font-weight-bold">퇴사자 목록</h3>
		<div class="row">
			<div class="col-sm">
				<hr>
				<div class="btn-group btn-group-sm" role="group"
					aria-label="Basic example">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#staticBackdrop">퇴사 처리</button>
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
	<div class="container">
		<h3 class="font-weight-bold">퇴사자 목록</h3>
		<div class="row">
			<div class="col-sm">
				<hr>
			</div>
			<div class="col-sm"></div>
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
					<form id="designerInsertFrm"
						action=""
						method="post">
						<div class="form-group">
							<label for="formGroupExampleInput">디자이너 이름</label> <input
								type="text" class="form-control" id="insertdesigner_name"
								name="designer_name" placeholder="홍길동">
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput">최종 직급</label> <input
								type="email" class="form-control" id="insertdesigner_email"
								name="designer_email" aria-describedby="emailHelp"
								placeholder="name@example.com"> <small id="emailHelp"
								class="form-text text-muted">이메일 인증이 완료되어야 로그인이 가능합니다.</small>
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput">입사일</label> <input
								type="password" class="form-control" id="insertdesigner_pw"
								name="designer_pw" placeholder="디자이너가 로그인할 초기 비밀번호입니다.">
							<small id="emailHelp" class="form-text text-muted">비밀번호는
								디자이너에게 이메일로 안전하게 전달됩니다.</small>
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">퇴사일</label> <input
								type="text" class="form-control" id="insertdesigner_phone"
								name="designer_phone" placeholder="010-0000-0000">
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">퇴사 사유</label> <input
								type="text" class="form-control" id="insertdesigner_phsne"
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