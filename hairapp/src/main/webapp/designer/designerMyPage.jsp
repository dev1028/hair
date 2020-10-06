<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		//비밀번호 입력여부 체크
		if (document.frm.designer_pw.value == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			document.frm.designer_pw.focus();
			return false;
		}

		//비밀번호 길이 체크(4~8자 까지 허용)
		if (document.frm.designer_pw.value.length<4 || document.frm.designer_pw.value.length>12) {
			alert("비밀번호를 4~12자까지 입력해주세요.")
			document.frm.designer_pw.focus();
			document.frm.designer_pw.select();
			return false;
		}
		//비밀번호와 비밀번호 확인 일치여부 체크
		if (document.frm.designer_pw.value != document.frm.designer_pw2.value) {
			alert("비밀번호가 일치하지 않습니다")
			document.frm.designer_pw2.value = ""
			document.frm.designer_pw2.focus();
			return false;
		}
		if (document.frm.designer_dayoff.value == "") {
			alert("휴무일 입력하지 않았습니다.")
			document.frm.designer_dayoff.focus();
			return false;
		}
		if (document.frm.work_start_time.value == "") {
			alert("근무시작시간  입력하지 않았습니다.")
			document.frm.work_start_time.focus();
			return false;
		}
		if (document.frm.work_end_time.value == "") {
			alert("근무종료시간 입력하지 않았습니다.")
			document.frm.work_end_time.focus();
			return false;
		}
	}
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<br> <br> <br>
		</div>
		<div class="row">
			<h3>디자이너 개인정보 수정</h3>
		</div>
		<div class="row">
			<form method="post"
				action="${pageContext.request.contextPath}/designer/designerMyPageUpdateCtrl.do"
				id="frm" name="frm" onsubmit="return checkValue();"
				enctype="multipart/form-data">
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
							id="designer_pw"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="designer_pw2"
							id="designer_pw2" /><span></span></td>

					</tr>

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
						<td>프로필</td>
						<td><textarea id="designer_profile" name="designer_profile"></textarea></td>
					</tr>

				</table>
				<br> <br>
				<!-- 				<div>
					<label for="image">첨부 파일 </label> <input type="file"
						class="form-control-file" name="file_name" size=30
						accept=".gif, .jpg, .png" onchange="setThumbnail(event);"><br>
				</div>
 -->
				<input type="file" id="image" name="file_name"
					accept=".gif, .jpg, .png" onchange="setThumbnail(event);" />
				<div id="image_container"></div>
				<script>
					function setThumbnail(event) {
						var reader = new FileReader();
						reader.onload = function(event) {
							var img = document.createElement("img");
							img.setAttribute("src", event.target.result);
							document.querySelector("div#image_container")
									.appendChild(img);
						};
						reader.readAsDataURL(event.target.files[0]);
					}
				</script>
				<div>
					<button>수정하기</button>
					<button type="reset">초기화</button>
					<!-- onclick="location.href='/designer/designerMyPageOutput.jsp'" -->
				</div>
			</form>
		</div>
	</div>
</body>
</html>