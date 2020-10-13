<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/designerCard.css">
<link rel="stylesheet" href="../decorator/membersDesigner.css">
<style>
.ui-timepicker-container{ 
     z-index:1151 !important; 
}
</style>
<script src="../js/designerBookmark.js"></script>

<script>
$(function() {
	$("#date").datepicker({
		dateFormat : 'yy-mm-dd',
		minDate: 0,
	//	onSelect: changeDesigner
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
<div class="container">
    <h3 class="h3">예약시간 설정</h3>
    <div class="out">
    	<div class = "in">
		    <input autocomplete="off" type="text" name="date" id="date" size="12" />
		    <input autocomplete="off" id="timepicker_start"  type="text" name="hs_starttime" value="00" style="width:80px">시 -
		    <input disabled type="text" name="hs_endtime" value="${total_hour }" style="width:80px">시
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
						
					</div>
	        </form>
        </c:forEach>
    </div>
</div>
<hr>

</body>
</html>