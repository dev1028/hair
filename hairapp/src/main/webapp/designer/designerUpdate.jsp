<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/cover/">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link href="${pageContext.request.contextPath}/hairshop/product.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="${pageContext.request.contextPath}/hairshop/product.css" rel="stylesheet">













<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css'
	rel='stylesheet' />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/locales-all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	
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
function inputNumberAutoComma(obj) {
	// 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
	var deleteComma = obj.value.replace(/\,/g, "");
	// 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
	if (isFinite(deleteComma) == false) {
		alert("문자는 입력하실 수 없습니다.");
		obj.value = "";
		return false;
	}
	// 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
	obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
}


//근무시간 test
function inputNumberAuto(obj) {
	// 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
	var deleteComma = obj.value.replace(/\,/g, "");
	// 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
	if (isFinite(deleteComma) == false) {
		alert("문자는 입력하실 수 없습니다.");
		obj.value = "";
		return false;
	}
}


// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
function inputNumberWithComma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{1})+(?!\d))/g, "$1,");
}
// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
function inputNumberRemoveComma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, "");
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
		
		//근무시간 test
		function inputNumberAuto(obj) {
			// 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
			var deleteComma = obj.value.replace(/\,/g, "");
			// 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
			if (isFinite(deleteComma) == false) {
				alert("문자는 입력하실 수 없습니다.");
				obj.value = "";
				return false;
			}
		}
		
		
		

		/* 		$(document).on("keyup", ".phoneNumber", function() { 
		 $(this).val( $(this).val().replace(/[^0-9]/g, "")
		 .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
		 */
	}
</script>
</head>
<body>
			<nav class="site-header sticky-top py-1">
		<div
			class="container d-flex flex-column flex-md-row justify-content-between">
			<a class="py-2" href="#" aria-label="Product"> </a> <a class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/hairshopReturnToLogin.do">Home</a> <a
				class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/aboutUs.do">Among Us</a> <a
				class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/hairshopNotice.do">공지사항</a> <a
				class="py-2 d-none d-md-inline-block" href="${pageContext.request.contextPath}/ajax/hairshopQna.do">QnA</a>
		</div>
	</nav>
	
	<div class="container">
		<br> <br> <br>

		<form method="post" action="${pageContext.request.contextPath}/designer/designerUpdate.do"
			id="frm" name="frm" onsubmit="return checkValue();">
			<input type="hidden" name="designer_no"
				value="${designer.designer_no}">

			<h3>디자이너 정보 입력</h3>
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
							onKeyup="inputNumberAutoComma(this);" maxlength ="12"
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
							onKeyup="inputNumberAuto(this);" maxlength="2"
							id="work_start_time" value="${designer.work_start_time}">
					</div>
					<div>
						<input name="work_end_time" class="form-control" type="text"
						onKeyup="inputNumberAuto(this);" maxlength="2"
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