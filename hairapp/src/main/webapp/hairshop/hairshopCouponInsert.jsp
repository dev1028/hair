<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.alert-success {
	width: 360px;
}
</style>
<script>
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
	// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
	function inputNumberWithComma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
	}
	// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
	function inputNumberRemoveComma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, "");
	}
	
	// 필수 입력정보인 쿠폰정보
	function checkValue() {
		if (document.frm.hsc_name.value == "") {
			alert("쿠폰명 입력하세요")
			document.frm.hsc_name.focus();
			return false;
		}
		//유효기간 입력여부 체크
		if (document.frm.hsc_issuedate.value == "") {
			alert("유효기간 입력하세요.")
			document.frm.hsc_issuedate.focus();
			return false;
		}

		//유효기간 입력여부 체크
		if (document.frm.hsc_expiredate.value == "") {
			alert("유효기간 입력하세요.")
			document.frm.hsc_expiredate.focus();
			return false;
		}
		
		if (document.frm.hsc_coupon_quantity.value == "") {
			alert("쿠폰갯수 입력하세요.")
			document.frm.hsc_coupon_quantity.focus();
			return false;
		}

		if (document.frm.hsc_maxdiscount_pay.value == "") {
			alert("최대할인금액 입력하세요.")
			document.frm.hsc_maxdiscount_pay.focus();
			return false;
		}
		
		if (document.frm.hsc_discount_rate.value == "") {
			alert("할인율 입력하세요")
			document.frm.hsc_discount_rate.focus();
			return false;
		}

		/* 		$(document).on("keyup", ".phoneNumber", function() { 
		 $(this).val( $(this).val().replace(/[^0-9]/g, "")
		 .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
		 */
	}

</script>

<body>
	<div class="container">
		<br> <br> <br>
		<form method="post"
			action="${pageContext.request.contextPath}/hairshop/HairshopCouponInsertCtrl.do"
			id="contact_form" class="well form-horizontal" name="frm"
			onsubmit="return checkValue();">

			<fieldset>

				<!-- Form Name -->
				<legend>쿠폰 등록</legend>
				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">쿠폰명</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="hsc_name"
								placeholder="쿠폰명 입력하세요" class="form-control" type="text">
						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">쿠폰사용 기간</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input
								name="hsc_issuedate" class="form-control" type="date"> <input
								name="hsc_expiredate" class="form-control" type="date">
						</div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">쿠폰갯수</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> <input
								name="hsc_coupon_quantity" min="0" max="100"
								placeholder="쿠폰갯수 입력하세요" class="form-control" type="number">
						</div>
					</div>
				</div>


				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">최대 할인금액</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-earphone"></i></span> <input
								name="hsc_maxdiscount_pay" placeholder="" class="form-control"
								onKeyup="inputNumberAutoComma(this);" value="" type="text">
						</div>
					</div>
				</div>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">할인율(%)</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-home"></i></span> <input
								name="hsc_discount_rate" placeholder="" class="form-control"
								type="number" min="0" max="100">
						</div>
					</div>
				</div>

				<!-- Success message -->
				<div class="alert alert-success" role="alert" id="success_message">
					If the coupon information you entered is correct, press the send
					button. <i class="glyphicon glyphicon-thumbs-up"></i>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<button type="submit" class="btn btn-warning">
							Send <span class="glyphicon glyphicon-send"></span>
						</button>
						<button type="reset" class="btn btn-warning">
							Reset <span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</div>

			</fieldset>
		</form>
	</div>

	<!-- /.container -->
</body>
</html>