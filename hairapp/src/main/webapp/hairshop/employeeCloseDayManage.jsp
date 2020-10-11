<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="hairshopCoupon.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<style>
.button {
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}

.button1:hover {
	background-color: #4CAF50;
	color: white;
}

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
}

.button2:hover {
	background-color: #008CBA;
	color: white;
}
</style>
<body>
<script>
$(function(){
	$(".designer_list").hide();
})

function designer_show_button(){
	$(".designer_list").show();
	$(".hairshop").hide();
}

function hairshop_show_button(){
	$(".designer_list").hide();
	$(".hairshop").show();
}

function toggle(){
	if($('.designer_list').is(':visible')){
		$(".designer_list").hide();
		$(".hairshop").show();
	}else{
		$(".designer_list").show();
		$(".hairshop").hide();
	}
}
</script>

	<div class="container">
	<div class="row">
			<br> <br> <br>
	</div>
	<div>
			<button class="button button1" onclick="hairshop_show_button();">미용실</button>
			<button class="button button2" onclick="designer_show_button();">디자이너</button>
	</div>
		
	<div class="designer_list">
		

		<div class="row">
			<h3>디자이너 휴무일 관리</h3>
		</div>
		<br>
		<table>
			<thead>
				<tr>
					<th scope="row">직원번호</th>
					<th scope="row">직급</th>
					<th scope="row">성명</th>
					<th scope="row">전화번호</th>
					<th scope="row">입사일</th>
					<th scope="row">휴무일</th>
				</tr>
			</thead>
			<tbody id="tbody" class="tbody">
				<c:forEach items="${emplist }" var="e">
					<tr id="${e.designer_no }">
						<td>${e.designer_no }</td>
						<td>${e.position }</td>
						<td>${e.designer_name }</td>
						<td>${e.designer_phone }</td>
						<td>${e.hire_date }</td>
						<td>${e.designer_dayoff }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br><br>
	</div>
	
	<div class="hairshop">
	<div class="row">
		<h3>미용실 휴무 수정</h3>
			<br> <br> <br>
	</div>
		<div class="row">
<!-- 		<table>
			<tr>
			 <td>대표</td>
			 <td>
			</tr>
			
		</table> -->
		
		<div >
			${hairshop.hs_no }
			${hairshop.hs_name }
			${hairshop.hs_dayoff }
		
		</div>
			
			<div>
				<form action="${pageContext.request.contextPath}/hairshop/HairshopCloseDayManageU.do" method="post">
					<input type="checkbox" id='mon' name='dayoff' value='0'><label for='mon'>일요일</label>
					<input type="checkbox" name='dayoff' value='1'>월
					<input type="checkbox" name='dayoff' value='2'>화
					<input type="checkbox" name='dayoff' value='3'>수
					<input type="checkbox" name='dayoff' value='4'>목
					<input type="checkbox" name='dayoff' value='5'>금
					<input type="checkbox" name='dayoff' value='6'>토
					
					<button id="btn"  class="btn btn-primary">변경</button>
				
				</form>
			</div>
			
<!-- 			<select id="dayoff" name="dayoff"> -->
<!-- 				<option>휴무일 선택</option> -->
<%-- 				<%for(int i=0; i<=6; i++){ %> --%>
<%-- 				<option value="<%=i %>"><%=i %></option> --%>
<%-- 				<%} %> --%>
<!-- 			</select> -->

			</div>
		</div>
	</div>
	<br>
	<div></div>
</body>
</html>