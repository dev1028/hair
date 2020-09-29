<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/designerCard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="../decorator/membersDesigner.css">

<script>
$(function(){
	$('#timepicker_start').timepicker({
		timeFormat: 'HH',
		interval: 60
	});
	$('#timepicker_end').timepicker({
		timeFormat: 'HH',
		interval: 60
	});
})
</script>
</head>
<body>

<div class="container">
    <h3 class="h3">헤어 정보</h3>
    <div class="row">
    	<c:forEach items="${list}" var="designerInfo" >
    		<form class="col-md-3 col-sm-6" action="../members/designerSelectResult.do" method="post">
		            <div class="product-grid4">
		                <div class="product-image4">
	                        <img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo6/images/img-3.jpg">
	                        <img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo6/images/img-4.jpg">
		                </div>
		                <div class="product-content">
							<span class="title">이름: ${designerInfo.designer_name} </span><br>
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
					</div>
	        </form>
        </c:forEach>
    </div>
</div>
<hr>

<!-- 	<div> -->
<%-- 		<%@include file="/decorator/membersLeftMenu.jsp" %> --%>
<!-- 	</div> -->
	<form action="../members/designerSearch.do" method="post">
		<input autocomplete="off" id="timepicker_start"  type="text" name="hs_starttime" style="width:80px"> -
		<input autocomplete="off" id="timepicker_end"  type="text" name="hs_endtime" style="width:80px" > 영업시간
		<button>검색</button>
	</form>
	    	
	<c:forEach items="${list}" var="designerInfo" >
		<form action="../members/designerSelectResult.do" method="post">
			<div class="horizontal-card">
				<img src="http://via.placeholder.com/200x100" />
				<div class="horizontal-card-body">
					<span class="card-text">ID: ${designerInfo.designer_no} </span>
					<span class="card-text">이름: ${designerInfo.designer_name} </span>
					<span class="card-text">프로필: ${designerInfo.designer_profile} </span>
					<span class="card-text">직책: ${designerInfo.position} </span>
					<span class="card-text">시간: ${designerInfo.work_start_time}시 - ${designerInfo.work_end_time}시 </span>
					<span class="card-text">휴일: ${designerInfo.designer_dayoff} </span>
					<h4 class="card-title"></h4>
					<span class="card-text"></span>
				</div>
				<div class="horizontal-card-footer">
					<span>Image Title</span> 
					<a class="card-text status">#View</a>
					<a class="card-text status">#Save</a>
					<!-- 예약은 로그인 상태만 가능 -->
					<c:if test="${not empty sessionScope.login }">
						<button>예약</button>
					</c:if>
				</div>
				
				<div>
					<input type="hidden" name="designerNo" value="${designerInfo.designer_no}">
					<input type="hidden" name="hsNo" value="${hairInfo.hs_no}">
					<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
				</div>
			</div>
		</form>
	</c:forEach>
</body>
</html>