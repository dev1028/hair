<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	// 인코딩 처리
request.setCharacterEncoding("euc-kr");
%>
<title>로그인 화면</title>

<!-- css 파일 분리 -->
<!-- <link href='../../css/join_style.css' rel='stylesheet' style='text/css' /> -->

<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.email.value) {
			alert("이메일을 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요");
			inputForm.password.focus();
			return false;
		}
	}

	// 메인페이지로
 	function goJoinForm() {
		location.href = "${pageContext.request.contextPath}/hairshop/hairshopDesignerLogin.jsp";
	} 
</script>

</head>
<body>
	<div id="wrap">
		<form name="loginInfo" method="post" action="${pageContext.request.contextPath}/designer/designerLogin.do"
			onsubmit="return checkValue()">
			<table>
				<tr>
					<td bgcolor="skyblue">이메일</td>
					<td><input type="text" name="email" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="pw" maxlength="50"></td>
				</tr>
			</table>
			<br> <input type="submit" value="로그인" /> 
 			<input type="button"
				value="메인페이지로" onclick="goJoinForm()" /> 
		</form>
${errormsg }
<%-- 		<%
			// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
		// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
		String msg = request.getParameter("msg");

		if (msg != null && msg.equals("0")) {
			out.println("<br>");
			out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
		} else if (msg != null && msg.equals("-1")) {
			out.println("<br>");
			out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
		}
		%> --%>
	</div>
</body>

</html>