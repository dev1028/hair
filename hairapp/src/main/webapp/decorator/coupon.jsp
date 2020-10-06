<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.min.js"></script>
<link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.blue-orange.min.css">
<!-- Material Design icon font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
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

  <!-- 사용한  -->
  <div class="mdl-card mdl-shadow--2dp demo-card-square">
    <div class="mdl-card__title mdl-card__accent mdl-card--expand">
      <h2 class="mdl-card__title-text">미용실이름</h2>
    </div>
    <div class="mdl-card__supporting-text">
    	<p>사용 가능한 미용실 : </p>
		<p>할인률 : %</p>
		<p>최대 할인 금액 : 원</p>
		<p>쿠폰 유효 기간 : ~ </p>
    </div>
  </div>
  
  <!-- 보유중인 -->
  <div class="mdl-card mdl-shadow--2dp demo-card-square">
    <div class="mdl-card__title mdl-card--expand">
      <h2 class="mdl-card__title-text">미용실이름</h2>
    </div>
    <div class="mdl-card__supporting-text">
      	<p>사용 가능한 미용실 : </p>
		<p>할인률 : %</p>
		<p>최대 할인 금액 : 원</p>
		<p>쿠폰 유효 기간 : ~ </p>
    </div>
  </div>
  

</body>
</html>