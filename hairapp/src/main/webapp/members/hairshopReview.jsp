<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 리뷰</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>

function closeSelf(){
	//document.forms['certform'].submit();
    //close();
}
$(function(){
	$('#hr_rate').val("${reviewVo.hr_rate}").prop("selected", true);
})
</script>
</head>
<body>
	<form name="certform" action="../members/hairshopReviewInsert.do" onsubmit="return closeSelf(this)">
		<div>
			<div>
				<label>별점:</label>
				<select id="hr_rate" name="hr_rate">
					<option value="1">★</option>
					<option value="2">★★</option>
					<option value="3">★★★</option>
					<option value="4">★★★★</option>
					<option value="5">★★★★★</option>
				</select>
			</div>
		</div>
		<div>
			<textarea id="w3review" name="hr_contents" rows="10" cols="50">${reviewVo.hr_contents }</textarea>
		</div>
		<div>
			<button>등록</button>
			<input type="reset">
		</div>
	</form>
</body>
</html>