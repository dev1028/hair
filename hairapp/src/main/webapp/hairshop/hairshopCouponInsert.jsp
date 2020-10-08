<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="hairshopCouponInsert.css">
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
</script>
<style>

</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<br> <br> <br> <br> <br>

		</div>
		<div class="row">
			<h3>쿠폰 등록</h3>
		</div>
		<div class="row">
			<form method="post" action="${pageContext.request.contextPath}/hairshop/HairshopCouponInsertCtrl.do"
				id="frm" name="frm" onsubmit="return checkValue();">
				<!-- <input type="hidden" name="hsc_name"value=""> <br>  -->
				<label for="">쿠폰명</label><input type="text" name="hsc_name"><br>
				<br> <label for="">쿠폰발급생성일</label><input type="date" name="hsc_issuedate"><br>
				<br> <label for="">쿠폰발급만료일</label><input type="date" name="hsc_expiredate"><br>
				<br> <label for="">쿠폰개수</label><input type="number" min="0" max="100" name="hsc_coupon_quantity" style="text-align:center;">

				<br> <label for="">최대할인금액</label><input type="text"
					onKeyup="inputNumberAutoComma(this);" value=""
					name="hsc_maxdiscount_pay" style="text-align: center;" /><br>
				<br> <label for="">할인율(%)</label><input type="number" min="0"
					name="hsc_discount_rate" style="text-align: center;"> <br>
				<br>

				<div>
					<button type="submit">등록하기</button>
					<button type="reset">초기화</button>
					<!-- onclick="location.href='/designer/designerMyPageOutput.jsp'" -->
				</div>
			</form>
		</div>
	</div>
</body>
</html>