<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function inputPhoneNumber(obj) {

		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}
		obj.value = phone;
	}

	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (document.frm.designer_phone.value == "") {
			alert("전화번호 입력하지 않았습니다.")
			document.frm.designer_phone.focus();
			return false;
		}
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

		/* 		$(document).on("keyup", ".phoneNumber", function() { 
		 $(this).val( $(this).val().replace(/[^0-9]/g, "")
		 .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
		 */
	}
</script>
</head>
<body>
	<div class="container">
		<br> <br> <br>

		<form method="post" action="${pageContext.request.contextPath}/designer/designerUpdate.do"
			id="frm" name="frm" onsubmit="return checkValue();">
			<input type="hidden" name="designer_no"
				value="${designer.designer_no}">

			<h3>입력하는 순간 노예 시작</h3>
			<hr>
			<div class="form-group">
				<br> <label class="col-md-4 control-label">디자이너번호</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input name="" readonly
							class="form-control" type="text" value="${designer.designer_no}">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">디자이너 이름</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input name="" readonly
							class="form-control" type="text"
							value="${designer.designer_name}">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">Email</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input name="" readonly
							class="form-control" type="text"
							value="${designer.designer_email}">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">전화번호</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input id="phoneNum"
							name="designer_phone" maxlength="13" class="form-control"
							onKeyup="inputPhoneNumber(this);" type="text"
							value="${designer.designer_phone }">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">비밀번호 설정</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input name="designer_pw"
							placeholder="비밀번호를 4~12자까지 입력해주세요." class="form-control"
							type="password" id="designer_pw">
					</div>
					<input name="designer_pw2" class="form-control" type="password"
						id="designer_pw2">
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">휴무일</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input
							name="designer_dayoff" class="form-control" type="text"
							id="designer_dayoff" value="${designer.designer_dayoff }">
					</div>
				</div>
			</div>


			<div class="form-group">
				<label class="col-md-4 control-label">근무시간</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input
							name="work_start_time" class="form-control" type="text"
							id="work_start_time" value="${designer.work_start_time}">
					</div>
					<div>
						<input name="work_end_time" class="form-control" type="text"
							id="work_end_time" value="${designer.work_end_time}">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">입사날짜</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input id="hire_date"
							name="hire_date" class="form-control" type="date">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label">프로필</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-pencil"></i></span>
						<textarea class="form-control" name="designer_profile"
							id="designer_profile" placeholder=""></textarea>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-4 control-label"></label>
				<div class="col-md-4">
					<button class="btn btn-warning">
						Update <span class="glyphicon glyphicon-send"></span>
					</button>
					<button type="reset" class="btn btn-warning">
						Reset <span class="glyphicon glyphicon-send"></span>
					</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>