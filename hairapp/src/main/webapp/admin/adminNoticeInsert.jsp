
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style>
.hide {
	visibility: hidden;
}
</style>
<!-- <script type="text/javascript" 

src="adminQnaView.js"></script> -->
</head>
<body>
	<h2 class="heading">notice</h2>
	<form
		action="${pageContext.request.contextPath}/admin/adminNoticeInsertSubmit.do">

		<div class="form-group">


			<div class="control">

				<select name="notice_who">
					<option value="${notice_who }">${notice_whov}</option>

				</select>
			</div>
			<div>
				<label>title</label> <input type="text" value="title"
					name="notice_title">
			</div>
			<div>
				<label>contents</label>
				<textarea name="notice_contents">contents</textarea>
			</div>


			<div class="control">


				<button type="submit" value="Submit" id="submit" class="col-1-4">Submit</button>
			</div>
		</div>

	</form>

</body>
</html>