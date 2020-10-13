<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="hairshopCoupon.css">


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

</head>
<body>
	<div class="container">
	<!-- 미용실 휴무쪽 -->		
	<div class="hairshop">
	<br><br><br>
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