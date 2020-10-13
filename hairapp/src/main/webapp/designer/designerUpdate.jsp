<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//비밀번호 확인
	/* function isSame() {
	 var pw = document.twin.wUserPW.value;
	 var confirmPW = document.twin.wUserPWConfirm.value;
	 if (pw.length < 6 || pw.length > 16) {
	 window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
	 document.getElementById('pw').value=document.getElementById('pwCheck').value='';
	 document.getElementById('same').innerHTML='';
	 }
	 if(document.getElementById('pw').value!='' && document.getElementById('pwCheck').value!='') {
	 if(document.getElementById('pw').value==document.getElementById('pwCheck').value) {
	 document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
	 document.getElementById('same').style.color='blue';
	 }
	 else {
	 document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
	 document.getElementById('same').style.color='red';
	 }
	 }
	 }
	
	 /* 	function inputCheck() {
	 // 필수입력 체크
	 if (frm.phone.value == "") {
	 window.alert("번호 입력 ㄱ");
	 frm.phone.focus();
	 return false;
	 }
	 if (frm.holiday.value == "") {
	 alert("휴무일 입력ㄱ");
	 frm.holiday.focus();
	 return false;
	 }
	 if (frm.workstart.value == "") {
	 alert("근무시작시간 입력 ㄱ");
	 frm.workstart.focus();
	 return false;
	
	 if (frm.workend.value == "") {
	 alert("근무종료시간 입력ㄱ");
	 frm.workend.focus();
	 return false;
	 }
	 return true;
	 } */
</script>

</head>
<body>
	<div class="container">

		<div class="row">
			<br>
			<br>
			<br>
		</div>

		<h3>디자이너 정보 업데이트</h3>
		<div class="row">
			<form method="post"
				action="${pageContext.request.contextPath}/designer/designerUpdate.do"
				id="frm">
				<input type="hidden" name="designer_no"
					value="${ designer.designer_no}">
				<table>
					<tr>
						<td>디자이너 번호</td>
						<td>${designer.designer_no}</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${designer.designer_name}</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input id="designer_phone" name="designer_phone"
							type="text" value="${designer.designer_phone }"></td>
					</tr>
					<tr>
						<td>Email</td>
						<td>${designer.designer_email}</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="designer_pw"
							id="designer_pw" onchange="isSame()"></td>
					</tr>
					<!-- 			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="wUserPWConfirm" id="pwCheck" onchange="isSame()" />&nbsp;&nbsp;<span id="same"></span></td>
			</tr> -->
					<tr>
						<td>휴무일</td>
						<td><input type="text" id="designer_dayoff"
							name="designer_dayoff" value="${designer.designer_dayoff }"></td>
					</tr>
					<tr>
						<td>근무시작시간</td>
						<td><input id="work_start_time" name="work_start_time"
							type="text" value="${designer.work_start_time}"></td>
					</tr>
					<tr>
						<td>근무종료시간</td>
						<td><input id="work_end_time" name="work_end_time"
							type="text" value="${designer.work_end_time}"></td>
					</tr>
					<tr>
						<td>입사날짜</td>
						<td><input id="hire_date" name="hire_date" type="date"></td>
					</tr>
					<tr>
						<td>프로필</td>
						<td><textarea id="designer_profile" name="designer_profile"></textarea></td>
					</tr>
				</table>
				<div class="row">
					<button>수정하기</button>
					<button type="reset">초기화</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>