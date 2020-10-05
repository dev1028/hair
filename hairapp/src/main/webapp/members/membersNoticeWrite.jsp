<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersNoticeWrite</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
function inputCheck() {
	
	
	if(!frm.notice_categoryname.value) {
		window.alert("카테고리 입력");
		frm.notice_categoryname.focus();
		return false;
	}
	
	if(!frm.notice_title.value) {
		window.alert("제목 입력");
		frm.notice_title.focus();
		return false;
	}
	
	if(!frm.notice_contents.value) {
		window.alert("내용 입력");
		frm.notice_contents.focus();
		return false;
	
}
	return true;
}

</script>
</head>
<body>
<div class="contatiner">

<form method="post" name="frm" id="frm" action="membersNoticeW.do" onsubmit="return inputCheck()" enctype="multipart/form-data">
<h4 class="page_title">공지사항 등록</h4>
<hr>

	<div class="col-5">
		<label for="category">대분류</label>
  		<select class="form-control" id="notice_categoryname" name="notice_categoryname">
  		<option value="">선택</option>
    	<option value="b1">전체공지</option>
    	<option value="b2">미용실공지</option>
    	<option value="b3">일반회원공지</option>
    	<option value="b4">이벤트공지</option>
  		</select>
  		<br>
  	</div>
	<div class="col-auto">
		<label for=title>제목</label>
		<input type="text" class="form-control" id="notice_title" name="notice_title">
  		<br>
	</div>
	<div class="col-auto">
		<label for="contents">내용</label>
  		<textarea class="form-control" id="notice_contents" name="notice_contents" rows="3" cols="30">내용</textarea>
  		<br>
  	</div>
  	<div>
  		<label for="image">첨부 파일 추가</label>
  		<input type="file" class="form-control-file" name="notice_image" size=30 accept=".gif, .jpg, .png"><br>
	</div>
	<br>
  	<div>
  		<button type="reset" class="btn btn-outline-warning">초기화</button>
		<button type="submit" class="btn btn-outline-info">등록</button>
	</div>
</form>



</div>
</body>
</html>