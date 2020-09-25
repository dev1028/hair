<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>비회원 예약</h3>
	<form method="post"
		action="${pageContext.request.contextPath}/designer/customerJoinCtrl.do">
		<div>
			<input type="hidden" name="guest" value="search">
			 이름 :
			<input type="text" id="hg_name" name="hg_name">${guest.hg_name}
			전화번호: <input name="hg_phone">
			<button>조회</button>
			<!-- 			<label><input type="radio" name="options" > 회원</label> 
			<label> <input type="radio" name="options" > 비회원</label> -->
		</div>
		<br>
		<table>
			<tr>
				<td>예약번호</td>
				<td><input type="text"></td>
			</tr>

			<tr>
				<td>예약일자</td>
				<td><input type="date"></td>
				<td><label><input type="text" placeholder="시간"></label>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input type="text" id="hg_phone" name="hg_phone">${guest.hg_phone }</td>
			</tr>
			<tr>
				<td><button>예약</button>
					<button>뒤로가기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>