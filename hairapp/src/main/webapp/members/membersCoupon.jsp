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
#wrap3 {
	border: 2px dashed #bcbcbc;
	margin: 10px;
	float: left;
}

/* 쿠폰박스 */
.demo-card-square.mdl-card {
    width: 320px;
    height: 320px;
    float: left;
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
	<h2>쿠폰</h2>
	<hr width="1000px" style="border: solid 1px">
	<br><br>
	
	<!-- 쿠폰 내역 -->
	<form method="post" action="membersCoupon.do" name="form" id="form">
		<div id="wrap1">
			<h3>보유 쿠폰 내역</h3>	
			<hr style="border: solid 1px">
			
				<!-- 보유중인 -->
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
			
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br>
		
		<div id="wrap2">
			<h3>사용한 쿠폰 내역</h3>	
			<hr style="border: solid 1px">

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
</div> <!-- warp 끝 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<div id="mypage">
<%@include file="/decorator/membersMypage.jsp" %>
</div>

</body>
</html>