<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원리스트</title>

<script>
	$(function() {
		$("#dialog").dialog({
			autoOpen : false,
			height : 400,
			width : 350,
			modal : true,
			draggable: false,
			dialogClass: "dialogcla"
		});
		$(".dialogcla .ui-dialog-titlebar").css("display", "none");
		$(".ui-dialog,.ui-dialog,.ui-widget, .ui-widget-content, .dialogcla, .ui-draggable, .ui-resizable").css("background-color", "white");
		$(".ui-corner-all").css("background-color", "black");

		$("#emp_list_tbody").on("dblclick", "tr", function() {
			$("#dialog").dialog("open");
		});
		
		
	});
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
					<button type="button" class="btn btn-primary">직원등록</button>
					<button type="button" class="btn btn-info">퇴사자현황</button>
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
							<td>${emp.designer_no}</td>
							<td>${emp.position}</td>
							<td>${emp.designer_name}</td>
							<td>${emp.designer_phone}</td>
							<td>${emp.hire_date}</td>
							<td>${emkp.designer_dayoff}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
		<div id="dialog" title="카테고리 수정" style="border: 1px solid black">
			<div class="container">
				<form action="${pageContext.request.contextPath}/categoryUpdate.do"
					method="get">

					<input type="hidden" id="cate4" name="middle_group_no">
					<div class="form-group">
						<label>카테고리명</label> <input class="form-control" type="text"
							id="cate1" name="middle_group_category" value="" required>
					</div>
					<div class="form-group">
						<label>카테고리설명</label>
						<textarea class="form-control" id="cate2" name="middle_group_info"></textarea>
					</div>
					<div class="form-group">
						<label>대분류선택</label> <select class="form-control" id="cate3"
							name="secondary_code">
							
								<option value="fs">sd</option>
						</select>
					</div>
					<div class="btn-group" role="group">
						<button class="btn btn-secondary" id="updateCate">수정</button>
						<button class="btn btn-secondary">취소</button>
					</div>
				</form>
			</div>
		</div>
</body>
</html>