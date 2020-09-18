<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function inputCheck() {
		// 필수입력 체크
		if (frm.phone.value == "") {
			window.alert("휴대폰번호 입력 ㄱ");
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
		}
		if (frm.workend.value == "") {
			alert("근무종료시간 입력ㄱ");
			frm.workend.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h3>디자이너 정보 업데이트</h3>
	<form method="post" action="/designer/designerUpdate.do" id="frm"
		onclick="return inputCheck()">
		<table>
			<tr>
				<td>디자이너 번호</td>
				<td>${mem.mem_no}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${mem.mem_name}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input id="phone" name="phone" type="text"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td>${mem.mem_email}</td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="password"></td>
			</tr>
			<tr>
				<td>휴무일</td>
				<td><input id="holiday" name="holiday" type="text"></td>
			</tr>
			<tr>
				<td>근무시작시간</td>
				<td><input id="workstart" name="workstart" type="text"></td>
			</tr>
			<tr>
				<td>근무종료시간</td>
				<td><input id="workend" name="workstart" type="text"></td>
			</tr>
			<tr>
				<td>프로필</td>
				<td><textarea id="profile" name="profile"></textarea></td>
			</tr>
		</table>
		<div>
			<button>수정하기</button>
			<button type="reset">초기화</button>
		</div>
	</form>
</body>
</html>