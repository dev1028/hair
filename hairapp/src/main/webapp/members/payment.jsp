<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
<script>
$(function() {
	$("#date").datepicker({
		dateFormat : 'yy-mm-dd',
		minDate: 0
	});
	$("#date").datepicker( "setDate", new Date());
	
	$('#timepicker_start').timepicker({
		timeFormat: 'HH',
		interval: 60
	});
});
</script>
</head>
<body>

<form action="paymentMember.do" method="post">
	<input autocomplete="off" type="text" name="date" id="date" size="12" />
	<input autocomplete="off" id="timepicker_start"  type="text" name="hs_starttime" style="width:80px"> 예약시간 <br>
	
	<hr>
	고객정보를 입력해 주세요 <br>
	예약자 이름: ${login.mem_name }<br>
	전화 번호: ${login.mem_phone }<br>
	
	<hr>
	<b>미용실 이름:  </b> ${sessionScope.selHairshopVo.hs_name } <br>
	<b>헤어 이름   :  </b> ${sessionScope.selHairInfoVo.hhi_name } <br>
	<b>디자이너 이름: </b> ${sessionScope.selDesignerVo.designer_name } <br>
	
	<hr>
	고객에게 확인 사항(알림말) <br>
	
	<hr>
	쿠폰등록 정보 <br>
	
	원가: ${sessionScope.selHairInfoVo.hhi_price }<br>
	마일리지 사용: <input type="text" name="firstname" value=""> / ${sessionScope.login.mem_saved_money}원<br>
	쿠판할인 금액: <br>
	실제결제 금액: <br> 
	
	<hr>
	결제선택 <br>
	
	<button>결제하기</button>
	
	
</form>
</body>
</html>