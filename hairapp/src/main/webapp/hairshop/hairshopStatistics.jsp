<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	/* text-align: center; */
	font-family: 'Lato', 'sans-serif';
	font-weight: 400;
}

header, form {
	padding: 4em 10%;
}

.form-group {
	margin-bottom: 20px;
	border-top: 1px solid #999;
}

h2.heading {
	font-size: 18px;
	text-transform: uppercase;
	font-weight: 300;
	text-align: left;
	border-bottom: 1px solid;
	padding-bottom: 3px;
	margin-bottom: 20px;
}

.controls {
	border-bottom: 1px solid #999;
	padding: .5em 1em;
}

label {
	position: relative;
	/*  right: 100px; */
	/* left: 8px; */
	/* top: 12px;  */
	/* width: 60%; */
	/* color: #999; */
	font-size: 16px;
	display: inline-block;
	padding: 4px 10px;
	margin-left: 20px;
	margin-right: 30px;
	font-weight: 400;
	background-color: rgba(255, 255, 255, 0); @ include transition(color
	.3s, top .3s, background-color .8s);
	background-color: rgba(255, 255, 255, 1);
	font-weight: 400;
}

button {
	border-radius: .5em;
	cursor: pointer;
	background-color: white;
	border: 1px solid;
	color: black;
	padding: 8px 12px;
	margin: 0em 1em;
	/* float: right; */
	color: black;
}
</style>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
function range(){
	$("#range").html("");
	$("#range").append(
			$("<input />").attr({'type':'date', 'id':'start'}),
			$("<span />").html(' - '),
			$("<input />").attr({'type':'date', 'id':'end'}),
			$("<button />").html("당일 "),
			$("<button />").html("어제 "),
			$("<button />").html("최근1주 "),
			$("<button />").html("최근1달 ")
			
			);
}
function year(){
	$("#range").html("");
	$("#range").append(
			$("<select />").append(
					$("<option />").text("1")));
}
function quater(){
	$("#range").html("");	$("#range").append($("<button />").html("re"));
}
function month(){
	$("#range").html("");$("#range").append($("<button />").html("re"));
}
</script>
</head>
<body>
	<h2 class="heading">매출결산</h2>
	<form>
		<!--  General -->
		<div class="form-group">
			<div class="controls">
				<label for="name">검색구분 </label>
				<button type="button" value="Submit" onclick="range()">기간내결산</button>
				<button type="button" value="Submit" onclick="year()">년도별
					결산</button>
				<button type="submit" value="Submit" onclick="quater()">분기별
					결산</button>
				<button type="submit" value="Submit" onclick="mon()">월별 결산</button>
			</div>

			<div class="controls" id="range">
				<label for="name">기간선택 </label>
				<!-- <div id="range"></div> -->
				<!-- <button type="submit" value="Submit">기간내결산</button>
				<button type="submit" value="Submit">기간내결산</button>
				<button type="submit" value="Submit">기간내결산</button>
				<button type="submit" value="Submit">기간내결산</button> -->
			</div>
			<div class="controls">
				<label for="name">직원선택 </label>

			</div>


		</div>
		<!--  Details -->
		<div class="form-group">
			<h2 class="heading">지출합계</h2>

			<button type="submit" value="Submit" class="col-1-4">Submit</button>
		</div>
		</div>
		<!-- /.form-group -->
	</form>
</body>
</html>