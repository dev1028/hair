<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 리뷰</title>
</head>
<body>
	<form>
		<div>
			<div>
				<label>제목:</label>
				<input type="text">
			</div>
			<div>
				<label>별점:</label>
				<select>
					<option value="1">★</option>
					<option value="2">★★</option>
					<option value="3">★★★</option>
					<option value="4">★★★★</option>
					<option value="5">★★★★★</option>
				</select>
			</div>
		</div>
		<div>
			<textarea id="w3review" name="w3review" rows="10" cols="50">
			</textarea>
		</div>
		<div>
			<button>등록</button>
			<input type="reset">
		</div>
	</form>
</body>
</html>