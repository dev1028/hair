<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어샵예약-디자이너 선택</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="../css/membersHairshop.css">

<link rel="stylesheet" type="text/css" href="../css/designerCard.css">
<link rel="stylesheet" href="../decorator/membersDesigner.css">
<style>
.ui-timepicker-container{ 
     z-index:1151 !important; 
}

/* 슬라이더 */
input.set { display:none; }

#slide1:checked ~ .mask .overflow { margin-left:0; }
#slide2:checked ~ .mask .overflow { margin-left:-100%; }

#slides { margin:35px auto; width:80%; position:relative; 
text-align:center; font-family:Helvetica; font-size:3em; color:white;}

#slides .mask { width:90%; overflow:hidden; margin:auto; }

#slides .overflow { width:400%; -webkit-transform:translateZ(0); -webkit-transition:all 0.5s ease-out; -moz-transition:all 0.5s ease-out; -o-transition:all 0.5s ease-out; transition:all 0.5s ease-out; }

#slides .slide { width:25%; height:200px; line-height:200px; float:left; background:#fff; }

#controls { width:100%; }

#controls label { display:none; width:5%; height:60px; opacity:0.3; position:absolute; top:50%; margin-top:-30px; cursor:pointer; background:#000; }

#controls label:hover { opacity:0.8; }

#slide1:checked ~ #controls label:nth-child(2) { right:0; display:block; }

#slide2:checked ~ #controls label:nth-child(1), #slide3:checked ~ #controls label:nth-child(2) { left:0; display:block; }
/* 슬라이더끝 */

/* 버튼 */
.custom-btn {
  width: 171px;
  height: 60px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-6 {
  background: rgb(247,150,192);
background: radial-gradient(circle, rgba(247,150,192,1) 0%, rgba(118,174,241,1) 100%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-6 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-6:before,
.btn-6:after {
  position: absolute;
  content: "";
  height: 0%;
  width: 1px;
 box-shadow:
   -1px -1px 20px 0px rgba(255,255,255,1),
   -4px -4px 5px 0px rgba(255,255,255,1),
   7px 7px 20px 0px rgba(0,0,0,.4),
   4px 4px 5px 0px rgba(0,0,0,.3);
}
.btn-6:before {
  right: 0;
  top: 0;
  transition: all 500ms ease;
}
.btn-6:after {
  left: 0;
  bottom: 0;
  transition: all 500ms ease;
}
.btn-6:hover{
  background: transparent;
  color: #76aef1;
  box-shadow: none;
}
.btn-6:hover:before {
  transition: all 500ms ease;
  height: 100%;
}
.btn-6:hover:after {
  transition: all 500ms ease;
  height: 100%;
}
.btn-6 span:before,
.btn-6 span:after {
  position: absolute;
  content: "";
  box-shadow:
   -1px -1px 20px 0px rgba(255,255,255,1),
   -4px -4px 5px 0px rgba(255,255,255,1),
   7px 7px 20px 0px rgba(0,0,0,.4),
   4px 4px 5px 0px rgba(0,0,0,.3);
}
.btn-6 span:before {
  left: 0;
  top: 0;
  width: 0%;
  height: .5px;
  transition: all 500ms ease;
}
.btn-6 span:after {
  right: 0;
  bottom: 0;
  width: 0%;
  height: .5px;
  transition: all 500ms ease;
}
.btn-6 span:hover:before {
  width: 100%;
}
.btn-6 span:hover:after {
  width: 100%;
}

/* 버튼끝 */

/* 디자이너ui */
#shopdata {
    position: absolute;
    left: 2%;
    top: 10%
}
#menubar2 {
	width:1200px;
	height:100px;
	background-color: #b0b4c2;
}
#shopdata2 {
    position: absolute;
    left: 29%;
    top: 1.5%;
}
.datePick {
	height:60px;
	border-style: unset;
}

</style>
<script src="../js/designerBookmark.js"></script>

<script>
$(function() {
	$("#date").datepicker({
		dateFormat : 'yy-mm-dd',
		minDate: 0,
	//	onSelect: changeDesigner
		beforeShowDay: function(date){
			var day = date.getDay();
 			return [("${sessionScope.hs_dayoff}".indexOf(day) == -1)]
			//return [(day != 0 && day != 1 && day != 3 && day != 4 && day != 6)];
		}
	});
	$("#date").datepicker( "setDate", new Date());
	$('#timepicker_start').timepicker({
		timeFormat: 'HH',
		interval: 60,
		change: changeHour
	});
	
	//changeDesigner();
});
function numFormat(variable) { 
	variable = Number(variable).toString(); 
	if(Number(variable) < 10 && variable.length == 1)
		variable = "0" + variable;
	return variable;
}

function changeHour(){
	var endTime = parseInt($("input[name='hs_starttime']").val()) + parseInt("${total_hour }");
	$("input[name='hs_endtime']").val(numFormat(endTime));
}

$(function(){
	changeHour();
})

function check(frm){
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date($("input[name='date']").val()).getDay()];
	var dayoff = frm.dayoff.value;
		
	if(dayoff.indexOf(dayOfWeek) != -1) {
		alert("휴무일입니다.");
		return false;
	}
	
	work_start_time = parseInt(frm.work_start_time.value);
	work_end_time = parseInt(frm.work_end_time.value);
	
	startHour = parseInt($("input[name='hs_starttime']").val());
	endHour = parseInt($("input[name='hs_endtime']").val());
	
	if( startHour >= work_start_time && startHour < work_end_time &&
		endHour > work_start_time && endHour <= work_end_time){
	}else{
		alert('예약 불가능한 시간입니다.');
		return false;
	}
	
	frm.date.value = $("#date").val();
	frm.hs_starttime.value = $("#timepicker_start").val();
	return true;
}

</script>
</head>
<style>
.out {
 width: 100%;
 text-align: center;
 }
.in {
 display: inline-block;
 }
</style>
<body>
<!-- 맨위에 선 -->
<div id="headerLine">
</div>

<!-- 슬라이더 -->
<div id="slides">
  <input checked type="radio" name="slider" id="slide1" class="set" />
  <input type="radio" name="slider" id="slide2" class="set" />
  <input type="radio" name="slider" id="slide3" class="set" />
  <input type="radio" name="slider" id="slide4" class="set" />  
		  
  <div class="mask">    
    <div class="overflow">
      
      <div class="slide" style="background:lightsteelblue;">${shop.hs_name} 입니다</div>
      <div class="slide" style="background:#85b;">${shop.hs_profile}</div>
      
    </div>    
  </div>

  <div id="controls" onclick="">  
    <label for="slide1"></label>
    <label for="slide2"></label>
    <label for="slide3"></label>
    <label for="slide4"></label>    
  </div>
</div>
			

<!-- 미용실정보 -->
<br>
<div id="shopInfo">
	<div id="shopName">
		<div id="hsname">
			<h4><b>${shop.hs_name}</b></h4>
		</div>
			<h6>${shop.hs_fulladdr}</h6>
	</div>
	<div id="shopStar1">
		<c:choose>
			<c:when test="${shop2.hr_rate > 4.5}">
	        	★★★★★
	        </c:when>
	        <c:when test="${shop2.hr_rate > 3.5}">
	        	★★★★☆
	        </c:when>
	        <c:when test="${shop2.hr_rate > 2.5}">
	        	★★★☆☆
	        </c:when>
	        <c:when test="${shop2.hr_rate > 1.5}">
	        	★★☆☆☆
	        </c:when>
	        <c:when test="${shop2.hr_rate > 0.5}">
	        	★☆☆☆☆
	        </c:when>
	        <c:when test="${empty shop2.hr_rate}">
	        	☆☆☆☆☆
	        </c:when>
        </c:choose>
	</div>
	<div id="shopStar2">
		<c:choose>
			<c:when test="${empty shop2.hr_rate}">
	        	<br><h4>0.0</h4>
	        </c:when>
	        <c:when test="${shop2.hr_rate > 0.0}">
	        	<br><h4>${shop2.hr_rate}</h4>
	        </c:when>
	    </c:choose>
	</div>
	<div id="reviewBook">
		<c:choose>
			<c:when test="${shop2.hs_no > 0}">
	        	리뷰수 : ${shop2.hs_no} +<br>
	        </c:when>
	        <c:when test="${empty shop2.hs_no}">
	        	리뷰수 : 리뷰가 없습니다<br>
	        </c:when>
	    </c:choose>
		<c:choose>
			<c:when test="${shop3.hs_no > 0}">
				북마크 : ${shop3.hs_no} +
			</c:when>
			<c:when test="${empty shop3.hs_no}">
				북마크 : 북마크가 없습니다
			</c:when>
		</c:choose>
	</div>
</div>

<!-- 바디안에 메뉴바 -->
<br>
<div id="menubar">
<div id="shopdata">
	<img src="../images/members/step2.png" style="width: 80px; height: 40px;"> 디자이너 선택하기
	</div>
</div>




<!-- 여기서부터 본문. div shopbody 부터 본문시작-->
<div id="shopbody">

<!-- 본문쓰면됨 여기에 -->


<div class="container">
	<div id="menubar2">
		<div id="shopdata2">
	    	<form action="designerSelect.do" method="post">
	    		<img src="../images/members/date.png" style="width: 70px; height: 70px;">
	    		&emsp;&emsp;
			    <input autocomplete="off" type="text" name="date" id="date" size="12" class="datePick" />
			    &emsp;&emsp;
				<input autocomplete="off" id="timepicker_start"  type="text" name="hs_starttime" value="00" style="width:100px" class="datePick">
				&emsp;-&emsp;
				<input disabled type="text" name="hs_endtime" value="${total_hour }" style="width:100px" class="datePick">
				&emsp;&emsp;
			</form>
		</div>
	</div>
	<br>

<!--     <form action="designerSelect.do" method="post"> -->
<!-- 	    <input autocomplete="off" type="text" name="date" id="date" size="12" /> -->
<!-- 		<input autocomplete="off" id="timepicker_start"  type="text" name="hs_starttime" value="00" style="width:80px">- -->
<%-- 		<input disabled type="text" name="hs_endtime" value="${total_hour }" style="width:80px"> --%>
<!-- 		<button>검색</button> -->
<!-- 	</form> -->
    <div class="row">
    	<c:if test="${empty list }">
    		등록된 디자이너가 없습니다.
    	</c:if>
    	
    	<c:forEach items="${list}" var="designerInfo" >
    		<form class="col-md-3 col-sm-6" action="../members/designerSelectResult.do" method="post" onsubmit="return check(this)">
		            <div class="product-grid4">
		                <div class="product-image4">
		                <!-- <img src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/hairshop/${hairshop.hs_no}/profile&img_name=${hs.hsp_file}"> -->
		                	<img class="pic-1" src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/designer/${designerInfo.designer_no}/profile&img_name=${designerInfo.file_name}"
		                					   onerror="this.src='http://bestjquery.com/tutorial/product-grid/demo6/images/img-4.jpg'">
		                </div>
		                <div class="product-content">
		                	<c:if test="${not empty sessionScope.login }">
			                	<a href='javascript: like_func("${designerInfo.designer_no}")'>
									<c:if test="${designerInfo.designer_book == 1 }">
										<img class="img-${designerInfo.designer_no}" src="../images/bookmark/heart.png" width="30" height="30">
									</c:if>
									<c:if test="${designerInfo.designer_book != 1 }">
										<img class="img-${designerInfo.designer_no}" src="../images/bookmark/empty_heart.png" width="30" height="30">
									</c:if>
								</a>
							</c:if>
							<span class="title">${designerInfo.designer_name} </span><br>
							<span class="title">프로필: ${designerInfo.designer_profile} </span><br>
							<span class="title">직책: ${designerInfo.position} </span><br>
							<span class="title">시간: ${designerInfo.work_start_time}시 - ${designerInfo.work_end_time}시 </span><br>
							<span class="title">휴일: ${designerInfo.designer_dayoff} </span><br>
							
							<button class="add-to-cart">예약하기</button>
							
<%-- 		                    <h3 class="title"><a href="#">${hairInfo.hhi_name}</a></h3> --%>
<%-- 		                    <h3 class="title"><a href="#">${hairInfo.hhi_time}시간</a></h3> --%>
<%-- 		                    <div class="price">${hairInfo.hhi_price}원</div> --%>
<!-- 		                    <a class="add-to-cart" href="">예약하기</a>
<!-- 		                     <button class="add-to-cart">예약하기</button> -->
		                </div>
		            </div>
		            <div>
						<input type="hidden" name="designerNo" value="${designerInfo.designer_no}">
						<input type="hidden" name="hsNo" value="${hairInfo.hs_no}">
						<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
						
						<!-- for check -->
						<input type="hidden" name="work_start_time" value="${designerInfo.work_start_time}">
						<input type="hidden" name="work_end_time" value="${designerInfo.work_end_time }">
						<input type="hidden" name="dayoff" value="${designerInfo.designer_dayoff}">
						
						<input type="hidden" name="date" value="">
						<input type="hidden" name="hs_starttime" value="">
						
					</div>
	        </form>
        </c:forEach>
    </div>
</div>
<hr>


</div> <!-- shopbody끝 -->

<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>

</body>
</html>