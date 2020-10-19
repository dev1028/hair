<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>

	$(function(){
// 		alert("${payVo.realPrice}")
// 		alert("${login.mem_email}")
// 		alert("${login.mem_name}")
// 		alert("${login.mem_phone}")
// 		alert("${login.mem_addr}")
			
			
		startImport();
// 		testSuc();
	});
	
	function testSuc(){
		$.ajax({
			url: "http://localhost/hairapp/members/paymentImport.do",
			type: "POST",
			dataType : "json",
			data: {
				suc: "suc",
				imp_uid: "111",
				merchant_uid: "222",
				paid_amount: "333",
				apply_num: "444"
			},
			success : function(res) {
			}
		})
		location.href="http://localhost/hairapp/members/paymentS.do";
		alert('결제가 완료되었습니다.');
	}
	
	function startImport(){
		var IMP = window.IMP; // 생략가능
		IMP.init('iamport');

		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '우동 결제',
			//amount : "${payVo.realPrice}",
			amount : "100",
			buyer_email : "${login.mem_email}",
			buyer_name : "${login.mem_name}",
			buyer_tel : "${login.mem_phone}",
			buyer_addr : "${login.mem_addr}",
			buyer_postcode : '123-456',
// 			m_redirect_url : 'http://localhost/hairapp/members/paymentImport.do'
		}, function(rsp) {	
			//결제 성공시
			if (rsp.success) {
				//아작스를 통해서 서버에 처리결과를 통보해줌.
				jQuery.ajax({
			          url: "http://localhost/hairapp/members/paymentImport.do",
			          method: "POST",
			          dataType : "json",
			          data: {
			        	  suc: "suc",
			              imp_uid: rsp.imp_uid,
			              merchant_uid: rsp.merchant_uid,
			              paid_amount: rsp.paid_amount,
			              apply_num: rsp.apply_num
			          }
			      }).done(function (data) {
			        // 가맹점 서버 결제 API 성공시 로직
// 					msg += '고유ID : ' + rsp.imp_uid;
// 					msg += '상점 거래ID : ' + rsp.merchant_uid;
// 					msg += '결제 금액 : ' + rsp.paid_amount;
// 					msg += '카드 승인번호 : ' + rsp.apply_num;
				})
				location.href="http://localhost/hairapp/members/paymentS.do";
				var msg = '결제가 완료되었습니다.';
			} else {
				jQuery.ajax({
					url: "http://localhost/hairapp/members/paymentImport.do",
				    method: "POST",
				    dataType : "json",
				    data: {
				    	suc: "failed",
						imp_uid: rsp.imp_uid
				    }
				}).done(function(data){
					
				})
				
				var msg = '결제에 실패하였습니다.';
// 				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	}
	
</script>
<body>

</body>
</html>