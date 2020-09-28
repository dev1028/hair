<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<script>
function inputCheck() {
	
	if(frm.poster.value == "") {
		alert("작성자 입력");
		frm.poster.focus();
		return false;
	}
	
	if(frm.subject.value == "") {
		window.alert("제목 입력");
		frm.subject.focus();
		return false;
	}
	
	if(frm.contents.value == "") {
		window.alert("내용 입력");
		frm.contents.focus();
		return false;
	}
	
	// 회원가입 폼 제출
	// frm.submit();
	return true;
	
}

</script>
<body>
<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>공지사항 글올리기</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="notice_name">작성자</label>  
  <div class="col-md-4">
  <input id="notice_name" name="notice_name" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="notice_title">제목</label>  
  <div class="col-md-4">
  <input id="notice_title" name="notice_title" type="text" placeholder="제목" class="form-control input-md">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="notice_contents">내용</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="notice_contents" name="notice_contents">내용을 입력하세요</textarea>
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="notice_image">첨부파일추가</label>
  <div class="col-md-4">
    <input id="notice_image" name="notice_image" class="input-file" type="file">
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="btn1"></label>
  <div class="col-md-8">
    <button id="btn1" name="btn1" class="btn btn-default">초기화</button>
    <button id="btn2" name="btn2" class="btn btn-primary">등록</button>
  </div>
</div>

</fieldset>
</form>

<!-- <form method="post" name="frm" id="frm" action="#" onsubmit="return inputCheck()" enctype="multipart/form-data">
<h3 class="page_title">게시글 등록</h3>
	<div class="regist">
		<label for="poster">작성자</label>
		<input type="text" id="poster" name="poster">
		<br>
	</div>
	<div>
		<label for=subject>제목</label>
		<input type="text" id="subject" name="subject">
  		<br>
	</div>
	<div>
		<label for="contents">내용</label>
  		<textarea id="contents" name="contents" rows="3" cols="30">내용</textarea>
  		<br>
  	</div>
  	<div>
  		<label for="filename">첨부 파일 추가</label>
  		<input type="file" name="filename" size=30><br>
	</div>
  	<div>
  		<button type="reset">초기화</button>
		<button>등록</button>
	</div>
</form> -->
</body>
</html>