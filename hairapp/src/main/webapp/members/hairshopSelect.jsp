<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
.horizontal-card {
  position: relative;
  display: flex;
  border: 1px solid gray;
  margin-bottom: 1rem;
}
.horizontal-card img {
  width: 200px;
  height: 130px;
  border-bottom: 30px solid orange;
}
.horizontal-card .horizontal-card-body {
  display: flex;
  flex-direction: column;
  margin-left: 1rem;
}
.horizontal-card .horizontal-card-footer {
  position: absolute;
  left: 0px;
  right: 0px;
  bottom: 0px;
  height: 30px;
  display: flex;
  align-items: center;
}
.horizontal-card .horizontal-card-footer span {
  width: 200px;
  display: inline-block;
}
.horizontal-card .horizontal-card-footer a {
  margin-left: 10px;
}
</style>
<script>
$(function(){
	function createCard(data){
		var html = "";
		html += '<form action="../ajax/hairSelect.do" method="post">'
		html += '<div class="horizontal-card">';
		html += 	'<img src="http://via.placeholder.com/200x100" />'
		html += 	'<div class="horizontal-card-body">'
// 		html += 		'<span class="card-text"> 날짜:' + data.date + '</span>'
		html +=         '<input type="hidden" name="hsNo" value="' + data.value + '">'
		html += 		'<h4 class="card-title">' + data.label + '</h4>'
		html += 		'<span class="card-text">' + data.desc + '</span>'
		html += 	'</div>'
		html += 	'<div class="horizontal-card-footer">'
		html += 		'<span>Image Title</span> <a class="card-text status">#View</a>'
		html += 		'<a class="card-text status">#Save</a>'
		html += 	'<button>예약</button>'
		html += 	'</div>'
		html += '</div>'
		html += '</form>'
		return html
	
	}
	function test(key){
		$.ajax( "../searchRealtime.do", {
				dataType : "json",
				data: {term : key},
				success : function(datas){
					for(i=0; i<datas.length; i++){
						$(".AAA").append(createCard(datas[i]));
						
						//$("<div>SADF<div>").appendTo(".AAA")
					}
				}
		});
	}
	test("${param.term}");
})
</script>
</head>
<body>
	
	<h1>키워드: ${param.term }</h1>
	
	<div class="AAA">
	</div>
	
	
	<!-- 
	<div class="horizontal-card">
		<img src="http://via.placeholder.com/200x100" />
		<div class="horizontal-card-body">
			<span class="card-text">날짜</span>
			<h4 class="card-title">Title</h4>
			<span class="card-text">Subtitle</span>
		</div>
		<div class="horizontal-card-footer">
			<span>Image Title</span> <a class="card-text status">#View</a> <a
				class="card-text status">#Save</a>
		</div>
	</div>
	 -->
</body>
</html>