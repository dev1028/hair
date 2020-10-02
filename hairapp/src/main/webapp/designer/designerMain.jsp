<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어살롱 메인페이지</title>
<script>

</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm">
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
				  <label class="btn btn-secondary active">
				    <input type="radio" name="options" id="option1" checked> 일
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option2"> 주
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option3"> 월
				  </label>
				</div>
			</div>
			<div class="col-sm">
				<div>주</div>
			</div><div class="col-sm">
				<div>일</div>
			</div>
			
		</div>
		<div class="row">	
			<div class="col-9">
				<div id='calendar'></div>
			</div>
			<div class="col-3">
				<div id="chart_div"></div>
				<div class="container-fluid">
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
				  <label class="btn btn-secondary active">
				    <input type="radio" name="options" id="option1" checked> 일
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option2"> 주
				  </label>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>