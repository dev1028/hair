<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersCoupon</title>
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.min.js"></script>
<link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.blue-orange.min.css">
<!-- Material Design icon font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
#mypage {
	display: flex;
	position: absolute;
	top:50px;
	left:0px;
}

#wrap{
	top:50px;
	left:400px;
    position: absolute;
    margin:0 auto;
} 

#wrap2{
	top:100%;
    margin:0 auto;
} 

#wrap3 {
	border: 2px dashed #bcbcbc;
	margin: 10px;
	float: left;
}
#form {
	background: #e9edff;
	border: 1px solid #6d7fcc;
	width:1300px;
}

/* 쿠폰박스 */
.demo-card-square.mdl-card {
    width: 320px;
    height: 320px;
    margin: 1rem;
    position: relative;
  }
  
  .demo-card-square.mdl-card:hover {
    box-shadow: 0 8px 10px 1px rgba(0, 0, 0, .14), 0 3px 14px 2px rgba(0, 0, 0, .12), 0 5px 5px -3px rgba(0, 0, 0, .2);
  }
  
  .demo-card-square > .mdl-card__title {
    color: #fff;
    background: #03a9f4;
  }
  
  .demo-card-square > .mdl-card__accent {
    background: #ff9800;
  }

</style>
</head>
<body>
<div id="wrap">
	<br> <br> <h4 style="font-weight: bold;">나의 쿠폰</h4>
	<hr style="border: 2px solid #6d7fcc;"><br>
	
	<div id="row">
	<!-- 쿠폰 내역 -->
	<form method="post" action="membersCoupon.do" name="form" id="form">
		<div id="wrap1">
			<h5 style="font-weight: bold;">&nbsp;<img src="../images/members/square.png" style="width: 35px; height: 35px;"> 보유쿠폰내역</h5>
			<hr style="border: 1px solid #6d7fcc;"><br>
			
				<!-- 보유중인 -->
				<c:if test="${ empty holdingCoupon }">	<%-- c:if 했을때 empty는 booking == null과 같은거 --%>
					<h5>&nbsp;보유중인 쿠폰내역이 없습니다</h5>
				</c:if>
				<c:forEach items="${holdingCoupon}" var="holding">
				<div class="mdl-card mdl-shadow--2dp demo-card-square">
					<div class="mdl-card__title mdl-card--expand">
						<h2 class="mdl-card__title-text">${holding.hsc_name}</h2>
					</div>
					<div class="mdl-card__supporting-text">
						<p>사용 가능한 미용실 : ${holding.hs_name}</p>
						<p>할인률 : ${holding.hsc_discount_rate}%</p>
						<p>최대 할인 금액 : ${holding.hsc_maxdiscount_pay}원</p>
						<p>쿠폰 유효 기간 : ${holding.mc_issuedate} ~ ${holding.mc_expiredate} </p>
					</div>
				</div>
				</c:forEach>

			</div>
			
		
		<div id="wrap2">
		<br><br><br><br><br><br>
			<h5 style="font-weight: bold;">&nbsp;<img src="../images/members/square.png" style="width: 35px; height: 35px;"> 사용한 쿠폰내역</h5>
			<hr style="border: 1px solid #6d7fcc;"><br>

				<!-- 사용한  -->
				<c:forEach items="${usedCoupon}" var="used">
				<div class="mdl-card mdl-shadow--2dp demo-card-square">
					<div class="mdl-card__title mdl-card__accent mdl-card--expand">
						<h2 class="mdl-card__title-text">${used.hsc_name}</h2>
					</div>
					<div class="mdl-card__supporting-text">
						<p>사용 가능한 미용실 : ${used.hs_name}</p>
						<p>할인률 : ${used.hsc_discount_rate}%</p>
						<p>최대 할인 금액 : ${used.hsc_maxdiscount_pay}원</p>
						<p>쿠폰 유효 기간 : ${used.mc_issuedate} ~ ${used.mc_expiredate} </p>
					</div>
				</div>
				</c:forEach>

			</div>
	
	</form>
	
	</div>
</div> <!-- warp 끝 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<div id="mypage">
<%@include file="/decorator/membersMypage.jsp" %>
</div>

</body>
</html>