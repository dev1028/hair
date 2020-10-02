<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>아이디 중복 체크</title>

<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

#cancelBtn {
	visibility: visible;
}

#useBtn {
	visibility: hidden;
}
</style>

<script type="text/javascript">

function pValue(){
    document.getElementById("userId").value = opener.document.formjoin.joinemail.value;
}

	// 아이디 중복체크
	function idCheck() {
		//아이디 중복체크
		var userId = $("#userId").val();
		$.ajax({
			type : "POST",
			url : "../ajax/membersJoinIdCheck.do",
			dataType : "text",
			data : { "id" : userId },
			success : function(data) { //data : checkSignup에서 넘겨준 결과값
				data = $.trim(data)
 				if(data == '0'){
 					alert("중복 아이디");
 					document.getElementById("cancelBtn").style.visibility='visible';
 		            document.getElementById("useBtn").style.visibility='hidden';
 		            document.getElementById("msg").innerHTML ="";
 				}
 				else{
 					alert("사용 가능한 아이디")
 					document.getElementById("cancelBtn").style.visibility='hidden';
 		            document.getElementById("useBtn").style.visibility='visible';
 		            document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
 				}
			}
		})
	}

	// 사용하기 클릭 시 부모창으로 값 전달 
	function sendCheckValue() {
		// 중복체크 결과인 idCheck 값을 전달한다.
		opener.document.formjoin.idDuplication.value = "idCheck";
		// 회원가입 화면의 ID입력란에 값을 전달
		opener.document.formjoin.joinemail.value = document
				.getElementById("userId").value;

		if (opener != null) {
			opener.chkForm = null;
			self.close();
		}
	}
</script>

</head>
<body onload="pValue()">
	<div id="wrap">
		<br> <b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="idinput" id="userId"> 
				<input type="button" value="중복확인" onclick="idCheck()">
			</form>
			<div id="msg"></div>
			<br>
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br> 
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
		</div>
	</div>
</body>
</html>