<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	var clickcnt = 0;
	var thisTr;
	$(function() {
		$("#emp_list_tbody").on("click","tr",function(){
			if(clickcnt == 0){
				thisTr = $(this);
				setTimeout(function(){
					clickcnt = 0;
				}, 500);
				clickcnt++;
			} else if(clickcnt == 1 && $(this).attr("id") == thisTr.attr("id")){
				$("#myModal").modal('toggle');	
				clickcnt = 0;
			} else if(clickcnt == 1 && $(this).attr("id") != thisTr.attr("id")){
				clickcnt = 0;
			}
				
		})
		
		
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
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>
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
				<tr id="22">
							<td id="2">2</td>
							<td>{emp.position}</td>
							<td>{emp.designer_name}</td>
							<td>{emp.designer_phone}</td>
							<td>{emp.hire_date}</td>
							<td>{emkp.designer_dayoff}</td>
						</tr>
							<tr id="22q">
							<td id="2">2</td>
							<td>{emp.position}</td>
							<td>{emp.designer_name}</td>
							<td>{emp.designer_phone}</td>
							<td>{emp.hire_date}</td>
							<td>{emkp.designer_dayoff}</td>
						</tr>
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
		<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">디자이너 상세 정보 - 여기엔 직원번호도들어</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <div class="container">
         	<div>
         		디자이너번호
         		이름
         		전화번호
         		이메일
         		휴무일
         		근무시작시간
         		근무종료시간
         		직급
         		
         	</div>
         </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
	</div>
</body>
</html>