
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


<!-- BOOTSTRAP -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- VUEJS -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script>
	$(function() {
		var str = document.getElementById('qna_category').value;
		console.log(str);
		if (str !== "답변") {
			$('.parent *').prop('readonly', true);
			$("#update").css("display", "none");
		} else {
			$(".none").css("display", "none");
			$("#update").css("display", "block");
		

		}

	})
</script>

</head>
<body>


<div class="container">








	<div id="app">
		<div class="container">
			<form class="mt-4"
				action="${pageContext.request.contextPath}/admin/adminQnaAnswer.do">
				<div class="row">
					<!-- POST FORM -->

					<div class="col-6">
						<div class="card">
							<div class="card-body parent">
								<h4 class="card-title">qna 게시글 상세보기</h4>


								<div class="form-group ">
									<label>페이지 </label> <select name="qna_who" id="qna_who"
										class="form-control ">
										<option class="form-control form-check-input"
											value="${vo.qna_who }">${vo.qna_whov }</option>
									</select>

								</div>
								<div class="row">
									<div class="form-group col-6">
										<label>글번호 </label> <input v-model="model.post.title"
											class="form-control" name="qna_no" value="${vo.qna_no }" />
									</div>
									<div class="form-group col-6">
										<label>조회수 </label> <input v-model="model.post.title"
											class="form-control" name="qna_hits" value=" ${vo.qna_hits }">
									</div>
								</div>
								<div class="row">
									<div class="form-group col-6">
										<label>카테고리 </label> <input v-model="model.post.title"
											class="form-control " id="qna_category" name="qna_category"
											value="${vo.qna_categoryv }">
									</div>

									<div class="form-group col-6">
										<label>답변상태</label> <input v-model="model.post.friendlyUrl"
											type="text" class="form-control" value="${vo.answerStatus }">
									</div>
								</div>

								<div class="row">
									<div class="form-group col-6">
										<label>작성자 </label> <input v-model="model.post.title"
											class="form-control" name="qna_shop_customer_no"
											value="${vo.qna_shop_customer_no }">

									</div>
									<div class="form-group col-6">
										<label>작성일</label> <input v-model="model.post.friendlyUrl"
											type="text" class="form-control" name="qna_writedate"
											value="${vo.qna_writedate }" />
									</div>
								</div>
								<div class="form-group">
									<label>제목</label> <input v-model="model.post.friendlyUrl"
										type="text" class="form-control" name="qna_title"
										value="${vo.qna_title }" />
								</div>


								<div class="form-group">
									<label>내용</label>
									<textarea v-model="model.post.body" name="qna_contents"
										class="col-12 form-control" rows="10">${vo.qna_contents }</textarea>
								</div>
								<div class="form-group ">


									<button type="submit" value="Submit" id="update"
										class="btn btn-default col-12" style="border: 1px solid gray;">수정</button>
								</div>
							</div>
						</div>
					</div>

					<!-- POST PREVIEW -->
					<div class="col-6 none">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">qna 답변하기</h4>
								<div class="mt-4"
									<c:if test="${vo.qna_category=='m5' }">class="hide"</c:if>
									id="result">

									<div class="form-group">
										<label>제목</label> <input v-model="model.post.friendlyUrl"
											type="text" class="form-control" name="answer_title" />
									</div>


									<div class="form-group">
										<label>내용</label>
										<textarea v-model="model.post.body" name="answer_contents"
											class="col-12 form-control" rows="10"></textarea>
									</div>
									<div class="form-group ">


										<button type="submit" value="Submit" id="submit"
											class="btn btn-default col-12"
											style="border: 1px solid gray;">등록</button>
									</div>

								</div>
							</div>
						</div>
					</div>


				</div>
			</form>
		</div>
	</div>
	</div>










</body>
</html>



