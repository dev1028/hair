<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersNotice.jsp</title>
<script>
function inputCheck() {
	
	if(frm.notice_categoryname.value == "") {
		alert("카테고리 입력");
		frm.notice_category.focus();
		return false;
	}
	
	if(frm.notice_title.value == "") {
		window.alert("제목 입력");
		frm.notice_title.focus();
		return false;
	}
	
	if(frm.notice_contents.value == "") {
		window.alert("내용 입력");
		frm.notice_contents.focus();
		return false;
	
	return true;
	
}

</script>
</head>
<body>
<div class="contatiner">

<form method="post" name="frm" id="frm" action="membersNoticeW.do" onsubmit="return inputCheck()" enctype="multipart/form-data">
<h4 class="page_title">공지사항 등록</h4>
<hr>
	<div>
		<label for="notice_categoryname">대분류</label>
  		<select id="notice_categoryname" name="notice_categoryname" onchange="">
  		<option value="">선택</option>
    	<option value="b1">전체공지</option>
    	<option value="b2">미용실공지</option>
    	<option value="b3">일반회원공지</option>
    	<option value="b4">이벤트공지</option>
  		</select>
  		<br>
  	</div>
	<div>
		<label for=notice_title>제목</label>
		<input type="text" id="notice_title" name="notice_title">
  		<br>
	</div>
	<div>
		<label for="notice_contents">내용</label>
  		<textarea id="notice_contents" name="notice_contents" rows="3" cols="30">내용</textarea>
  		<br>
  	</div>
  	<div>
  		<label for="notice_image">첨부 파일 추가</label>
  		<input type="file" name="notice_image" size=30 accept=".gif, .jpg, .png"><br>
	</div>
  	<div>
  		<button type="reset">초기화</button>
		<button type="submit">등록</button>
	</div>
</form>



</div>
</body>
</html>