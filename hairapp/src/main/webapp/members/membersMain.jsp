<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<!-- 추가한거 -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->



<style>
body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인화면</title>


<style>
#project-label {
	display: block;
	font-weight: bold;
	margin-bottom: 1em;
}

#project-icon {
	float: left;
	height: 32px;
	width: 32px;
}

#project-description {
	margin: 0;
	padding: 0;
}
</style>


<script>
	$(function() {
		$("#project").autocomplete({
			minLength : 1,
			source : "../ajax/searchRealtime.do",
			focus : function(event, ui) {
				$("#project").val(ui.item.label);
				return false;
			},
			select : function(event, ui) {
				$("#project").val(ui.item.label);
				$("#project-id").val(ui.item.value);
				$("#project-description").html(ui.item.desc);
				//$("#project-icon").attr("src", "images/" + ui.item.icon);

				return false;
			}
		}).autocomplete("instance")._renderItem = function(ul, item) {
			return $("<li>").append(
					"<div>" + item.label + "<br>" + item.desc + "</div>")
					.appendTo(ul);
		};
	});
</script>
</head>
<body>
	<div class="myForm">
		<form action="../members/membersMainResult.do" method="post" style="margin:auto;max-width:300px">
			<!--  <img id="project-icon" src="images/transparent_1x1.png" class="ui-state-default" alt="">-->
			<!-- 여기서도 term을 보낸다. -->
			<input id="project" type="text" placeholder="Search.." name="term">
			<button type="submit" name="detail"><i class="fa fa-search"></i></button>
			<input type="hidden" id="project-id">
			<p id="project-description"></p>
		</form>
	</div>
</body>
</html>