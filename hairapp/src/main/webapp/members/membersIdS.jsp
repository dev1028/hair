<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script>
	function winClose() {
		window.close();
	}
</script>
</head>
<body>
<div id="wrap">
	<form method="POST" name="searchFrm" action="">
	<h3>ID(email) 찾기</h3><br>
		<div class="row1">
			회원가입 시 사용한 ID(email)는 ${members.mem_email} 입니다.
		</div>
		<input type="button" value="닫기" onclick="winClose()">
	</form>
</div>

</body>
</html>