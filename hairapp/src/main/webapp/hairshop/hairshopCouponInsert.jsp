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
button {
	margin: 10px;
}
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
			<form method="post" action="${pageContext.request.contextPath}"
				id="frm" name="frm" onsubmit="return checkValue();">
				<input type="hidden" name="designer_no"
					value="${ designer.designer_no}"> <br> <label for="">쿠폰명</label><input
					type="text"><br>
				<br> <label for="">쿠폰발급생성일</label><input type="date"><br>
				<br> <label for="">쿠폰발급만료일</label><input type="date"><br>
				<br> <label for="">쿠폰개수</label> <select name="count" id="count">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select><br>
				<br> <label for="">최대할인금액</label><input type="text"
					onKeyup="inputNumberAutoComma(this);" value=""
					style="text-align: center;" /><br>
				<br> <label for="">할인율(%)</label><input type="number" min="0"
					name="hsc_discount_rate" style="text-align: center;"> <br>
				<br>

				<div>
					<button>등록하기</button>
					<button type="reset">초기화</button>
					<!-- onclick="location.href='/designer/designerMyPageOutput.jsp'" -->
				</div>
			</form>
		</div>
	</div>
</body>
</html>