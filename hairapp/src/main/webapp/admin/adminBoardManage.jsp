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

<script type="text/javascript" src="adminBoardManage.js">
	
</script>
</head>
<body>
	<h2 class="heading">매출결산</h2>
	<form method="POST"
		action="${pageContext.request.contextPath}/hairshop/salesStatisticsResult.do">
		<!--  search -->
		<div class="form-group">

			<div class="control">
				<label for="name">기간 </label>
				<button type="button" value="0" class='dateBtn' id="today">오늘
				</button>
				<button type="button" value="3" class='dateBtn' id="three">3일
				</button>
				<button type="button" value="7" class='dateBtn' id="seven">7일
				</button>
				<button type="button" value="30" class='dateBtn' id="month">1개월
				</button>
				<input type="date" id="start"> -<input type="date" id="end">
			</div>
		
		
			<div class="control">
				<label for="name">게시판 선택 </label> <select name="board" id="board">
					<option>전체목록</option>
					<option id="notice" value="1">공지</option>
					<option id="q" value="2">QnA</option>
				</select> <select name="category" id="category">
					<option>전체카테고리 </option>
				</select>

			</div>
			<div class="control">
				<label for="name">게시글 찾기 </label> <select name="searchType" id="searchType">
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="writer">작성자</option>
					<option value="id">ID</option>
				</select> <input type="text" id="searchVal">

			</div>



			<div class="control">
				<label for="name">답변상태 </label> <input type="checkbox" name="answer" id="answer"
					value="y">답변완료 <input type="checkbox" name="answer" value="n">답변대기

			</div>
			<div class="control">


				<button type="button" value="Submit" id="submit" class="col-1-4">Submit</button>
			</div>
		</div>
	</form>
	<!--  result -->
	<!-- 매출 -->



	<h2 class="heading">지출합계</h2>
	<div class="form-group" id="result"></div>
	<!-- <button type="button" id="excel">excel</button> -->





</body>
</html>