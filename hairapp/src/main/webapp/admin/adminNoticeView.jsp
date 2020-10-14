
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style>.hide{
visibility: hidden;}</style>
<!-- <script type="text/javascript" 

src="adminQnaView.js"></script> -->
</head>
<body>
	<h2 class="heading">notice</h2>
	<form
		action="${pageContext.request.contextPath}/admin/adminQnaAnswer.do">

		<div class="form-group">

			<div class="control">
				<label for="name">글번호: </label> <input type="text" name="notice_no"
					value="${vo.notice_no }">

			</div>

			<div class="control">

				<select name="notice_who">
					<option value="${vo.notice_who }">${vo.notice_whov }</option>
				</select> 



			</div>
			<div class="control">
				<label for="name">제목 : </label> <input type="text" name="notice_title"
					value="${vo.notice_title }">

			</div>
			내용 
			<div>

				<p>${vo.notice_contents }</p>
			</div>
		

			<div class="control">
				<label for="name">작성자:${vo.emp_alias }</label>

			</div>
			<div class="control">
				<label for="name">작성일:${vo.notice_writedate }</label>

			</div>
			<div class="control">
				<label for="name">조회수: ${vo.notice_hits }</label>

			</div>





		</div>
	</form>

</body>
</html>