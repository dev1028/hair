
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
<!-- <script type="text/javascript" 

src="adminQnaView.js"></script> -->
</head>
<body>
<div class="container">

	<h2 class="heading">notice</h2>
	<form
		action="${pageContext.request.contextPath}/admin/adminQnaAnswer.do">

		<div class="row">
			<div class="col-6">
				<div class="card">
					<div class="card-body parent">
						<h4 class="card-title">notice 게시글 상세보기</h4>


						<div class="form-group ">
							<label>페이지 </label> <select name="notice_who" id="qna_who"
								class="form-control ">
								<option class="form-control form-check-input"
									value="${vo.notice_who }">${vo.notice_whov }</option>
							</select>

						</div>
						<div class="row">
							<div class="form-group col-6">
								<label>글번호 </label> <input v-model="model.post.title"
									class="form-control" name="notice_no" value="${vo.notice_no }" />
							</div>
							<div class="form-group col-6">
								<label>조회수 </label> <input v-model="model.post.title"
									class="form-control" name="qna_hits"
									value=" ${vo.notice_hits }">
							</div>
						</div>
						<div class="row"></div>

						<div class="row">
							<div class="form-group col-6">
								<label>작성자 </label> <input v-model="model.post.title"
									class="form-control" name="qna_shop_customer_no"
									value="${vo.emp_name }">

							</div>
							<div class="form-group col-6">
								<label>작성일</label> <input v-model="model.post.friendlyUrl"
									type="text" class="form-control" name="qna_writedate"
									value="${vo.notice_writedate }" />
							</div>
						</div>
						<div class="form-group">
							<label>제목</label> <input v-model="model.post.friendlyUrl"
								type="text" class="form-control" name="notice_title"
								value="${vo.notice_title }" />
						</div>


						<div class="form-group">
							<label>내용</label>
							<textarea v-model="model.post.body" name="qna_contents"
								class="col-12 form-control" rows="10">${vo.notice_contents }</textarea>
						</div>
						<div class="form-group ">


							<button type="submit" value="Submit" id="update"
								class="btn btn-default col-12" style="border: 1px solid gray;">수정</button>
						</div>
					</div>
				</div>
			</div>




		</div>
	</form>
</div>
</body>
</html>