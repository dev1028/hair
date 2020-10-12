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

label.btn {
  font-size: 1.5em ;
}

label input[type="radio"] ~ i.fa.fa-circle-o{
    color: #c8c8c8;    display: inline;
}
label input[type="radio"] ~ i.fa.fa-dot-circle-o{
    display: none;
}
label input[type="radio"]:checked ~ i.fa.fa-circle-o{
    display: none;
}
label input[type="radio"]:checked ~ i.fa.fa-dot-circle-o{
    color: #7AA3CC;    display: inline;
}
label:hover input[type="radio"] ~ i.fa {
color: #7AA3CC;
}

label input[type="checkbox"] ~ i.fa.fa-square-o{
    color: #c8c8c8;    display: inline;
}
label input[type="checkbox"] ~ i.fa.fa-check-square-o{
    display: none;
}
label input[type="checkbox"]:checked ~ i.fa.fa-square-o{
    display: none;
}
label input[type="checkbox"]:checked ~ i.fa.fa-check-square-o{
    color: #7AA3CC;    display: inline;
}
label:hover input[type="checkbox"] ~ i.fa {
color: #7AA3CC;
}

div[data-toggle="buttons"] label.active{
    color: #7AA3CC;
}

div[data-toggle="buttons"] label {
display: inline-block;
padding: 6px 12px;
margin-bottom: 0;
/* font-size: 14px; */
font-weight: normal;
line-height: 2em;
text-align: left;
white-space: nowrap;
vertical-align: top;
cursor: pointer;
background-color: none;
border: 0px solid 
#c8c8c8;
border-radius: 3px;
color: #c8c8c8;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
-o-user-select: none;
user-select: none;
}

div[data-toggle="buttons"] label:hover {
color: #7AA3CC;
}

div[data-toggle="buttons"] label:active, div[data-toggle="buttons"] label.active {
-webkit-box-shadow: none;
box-shadow: none;
}


</style>
<body>
<script>
$(function(){
	$(".hairshop").hide();
})

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

/* function toggle(){
	if($('.designer_list').is(':visible')){
		$(".designer_list").hide();
		$(".hairshop").show();
	}else{
		$(".designer_list").show();
		$(".hairshop").hide();
	}
} */
</script>

	<div class="container">
	<div class="row">
			<br> <br> <br>
	</div>
	<div>
			<button class="button button1" onclick="hairshop_show_button();">미용실</button>
			<button class="button button2" onclick="designer_show_button();">디자이너</button>
	</div>
	<br>
	<div class="designer_list">
		
	<!--디자이너 페이지  -->
		<div class="row">
			<h3>디자이너 휴무일 관리</h3>
		</div>
		<br>
		<table class="table-bordered table-hover table-sm text-center">
			<thead>
				<tr>
					<th scope="row">직원번호</th>
					<th scope="row">직급</th>
					<th scope="row">성명</th>
					<th scope="row">전화번호</th>
					<th scope="row">입사일</th>
					<th scope="row">휴무일</th>
					<th scope="row">Edit</th>
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
						<td><a href="" class="btn btn-primary">수정</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br><br>
  				<p>여기는 디자이너 수정버튼눌렀을때 나오는곳</p>
		  <div class="row">
  				<br>
  				<table>
  					<tr>
  						<td>디자이너 번호: </td>
  						<td></td>
  					</tr>
  					
  					<tr>
  						<td>디자이너 이름: </td>
  						<td></td>
  					</tr>
  					
  					<tr>
  						<td>휴무일: </td>
  						<td></td>
  					</tr>
  				</table>
  				<br>
  				 <div class="btn-group btn-group" data-toggle="buttons">
  				 <br>
				  <form action="${pageContext.request.contextPath}/hairshop/employeeCloseDayManageU.do" method="post">
				  
				    <label class="btn" for='a'>
				    <input type="checkbox" name='dayoff' id='a' value='0'> 일요일 <i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='b'>
				      <input type="checkbox" name='dayoff' id='b' value='1'> 월요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i> 
				    </label>
				    
				    <label class="btn" for='c'>
				      <input type="checkbox" name='dayoff' id='c' value='2'> 화요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='d'>
				      <input type="checkbox" name='dayoff' id='d' value='3'> 수요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='e'>
				      <input type="checkbox" name='dayoff' id='e' value='4'> 목요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='f'>
				      <input type="checkbox" name='dayoff' id='f' value='5'> 금요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='g'>
				      <input type="checkbox" name='dayoff' id='g' value='6'> 토요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
					<button id="btn"  class="btn btn-primary">수정</button>
					</form>
				  </div>
<!--   				<div>
  					<label>디자이너 번호</label>
  					<input id="designer_no" name="designer_name">
  				</div>
				<div>
  					<label>디자이너 이름</label>
  					<input id="designer_name" name="designer_name">
  				</div>
				<div>
  					<label>휴무일</label>
  					<input id="designer_dayoff" name="designer_dayoff">
  				</div> -->
  		</div>
	</div>

	<!-- 미용실 휴무쪽 -->		
	<div class="hairshop">
	<div class="row">	
	<h3> 미용실 휴무 수정</h3>
	</div>
	<div class="row">
		수정하실 휴무일을 체크해주세요
	</div>
	  <br>
			<div >
			<table>
				<thead>
				<tr>
					<td>미용실 이름 : ${hairshop.hs_name }</td>
				</tr>
				<tr>
					<td>현재 휴무일 : ${hairshop.hs_dayoff }</td>
				</tr>
				</thead>
			</table>
			</div><br>
				  <div class="btn-group btn-group" data-toggle="buttons">
				  <form action="${pageContext.request.contextPath}/hairshop/HairshopCloseDayManageU.do" method="post">
				  
				    <label class="btn" for='a'>
				    <input type="checkbox" name='dayoff' id='a' value='0'> 일요일 <i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='b'>
				      <input type="checkbox" name='dayoff' id='b' value='1'> 월요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i> 
				    </label>
				    
				    <label class="btn" for='c'>
				      <input type="checkbox" name='dayoff' id='c' value='2'> 화요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='d'>
				      <input type="checkbox" name='dayoff' id='d' value='3'> 수요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='e'>
				      <input type="checkbox" name='dayoff' id='e' value='4'> 목요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='f'>
				      <input type="checkbox" name='dayoff' id='f' value='5'> 금요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
				    <label class="btn" for='g'>
				      <input type="checkbox" name='dayoff' id='g' value='6'> 토요일<i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i>
				    </label>
				    
					<button id="btn"  class="btn btn-primary">수정</button>
					</form>
				  </div>
				  
	
 		 <!--test  -->
			</div>
	</div>
</body>
</html>