
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
<style>
.hide {
	visibility: hidden;
}
</style>
<script>
	$(function() {
		var str = document.getElementById('qna_category').value;
		console.log(str);
		if (str !== "답변") {
			$('.parent *').prop('readonly', true);
		} else {
			$(".form-control").append
					
		($("<input />").attr({type:"submit",text:"수정"}))
									
					;
				
			}

		}
	)
</script>
<!-- <script type="text/javascript" 

src="adminQnaView.js"></script> -->
</head>
<body>
	<c:if test="${vo.qna_category=='m5' }"></c:if>
	<h2 class="heading">qna</h2>
	<form
		action="${pageContext.request.contextPath}/admin/adminQnaAnswer.do">
		<div class="form-control">
			<div class="parent">

				<div class="control">
					<label for="name">글번호: </label> <input type="text" name="qna_no"
						value="${vo.qna_no }">

				</div>

				<div class="control">

					<select name="qna_who" id="qna_who">
						<option value="${vo.qna_who }">${vo.qna_whov }</option>
					</select> <input id="qna_category" name ="qna_category"value="${vo.qna_categoryv }">



				</div>
				<div class="control">
					<label for="name">제목 : </label> <input type="text" name="qna_title"
						value="${vo.qna_title }">

				</div>

				<div>
					<textarea name="qna_contents">
					${vo.qna_contents }</textarea>
				</div>
				<div class="control">
					<label for="name">답변상태 </label> <input value="${vo.answerStatus }">



				</div>

				<div class="control">
					<label for="name">작성자</label><input type="text"
						name="qna_shop_customer_no" value="${vo.qna_shop_customer_no }">

				</div>
				<div class="control">
					<label for="name">작성일</label><input type="text"
						name="qna_writedate" value="${vo.qna_writedate }">

				</div>
				<div class="control">
					<label for="name">조회수</label><input type="text" name="qna_hits"
						value=" ${vo.qna_hits }">

				</div>



			</div>

			<h2 class="heading">답변</h2>

			<div <c:if test="${vo.qna_category=='m5' }">class="hide"</c:if>
				id="result">
				<div>
					<label>title</label> <input type="text" value="title"
						name="answer_title">
				</div>
				<div>
					<label>contents</label>
					<textarea name="answer_contents">contents</textarea>
				</div>


				<div class="control modi">


					<button type="submit" value="Submit" id="submit" class="col-1-4">Submit</button>
				</div>
			</div>
		</div>
	</form>

</body>
</html>