<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnaReply</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
function inputCheck() {	
	if(frm.qna_category.value == "") {
		window.alert("문의유형 선택");
		frm.qna_category.focus();
		return false;
	}
	if(frm.qna_title.value == "") {
		window.alert("제목 입력");
		frm.qna_title.focus();
		return false;
	}
	if(frm.qna_contents.value == "") {
		window.alert("내용 입력");
		frm.qna_contents.focus();
		return false;
	}		
	if(frm.qna_openstatus.value == "") {
		window.alert("공개여부 선택");
		frm.qna_openstatus.focus();
		return false;
}
	return true;
}

</script>
</head>
<body>
<div class="contatiner">

<form method="post" name="frm" id="frm" action="hairshopQnaRe.do?page=${page}" onsubmit="return inputCheck()">
<h4 class="page_title">답변 등록</h4>
<hr>

	<input type="hidden" name="qna_writer" value="${re.qna_writer}"/>
    <input type="hidden" name="qna_no" value="${re.qna_no}"/>
    <input type="hidden" name="qna_ref" value="${re.qna_ref}"/>
    <input type="hidden" name="qna_level" value="${re.qna_level}"/>
    <input type="hidden" name="qna_repos" value="${re.qna_repos}"/>

	<div class="col-5">
		<label for="category">문의유형 선택</label>
  		<select class="form-control" name="qna_category" id="qna_category" onchange="">
  		<option value="">선택</option>
    	<option value="m5">답변</option>
  		</select>
  		<br>
  	</div>
	<div class="col-auto">
		<label for=title>제목</label>
		<input type="text" class="form-control" id="qna_title" name="qna_title">
  		<br>
	</div>
	<div class="col-auto">
		<label for="contents">내용</label>
  		<textarea class="form-control" id="qna_contents" name="qna_contents" rows="3" cols="30">내용</textarea>
  		<br>
  	</div>
  	<div>
  		<label for="openstatus">공개 여부</label>
  		<select class="form-control" name="qna_openstatus" id="qna_openstatus">
  		<option value="">선택</option>
    	<option value="1">공개</option>
    	<option value="0">비공개</option>
    	</select>
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