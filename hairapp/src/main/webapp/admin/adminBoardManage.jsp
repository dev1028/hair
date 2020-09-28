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
				<button type="button" value="0" class='search' id="period">오늘
				</button>
				<button type="button" value="3" class='search' id="year">3일
				</button>
				<button type="button" value="7" class='search' id="quarter">7일
				</button>
				<button type="button" value="30" class='search' id="month">1개월
				</button>
				<input type="date" id="start"> <input type="date" id="end">
			</div>
			<div class="control">
				<label for="name">페이지 </label>
				<input type="radio" name="who"
					value="s">샵  <input type="radio" name="who" value="m">유저 
					<input type="radio" name="who" value="d">ds

			</div>
			<div class="control">
				<label for="name">게시판 선택 </label> <select name="board" id="board">
					<option>전체목록</option>
					<option id="notice" value="1">공지</option>
					<option id="q" value="2">QnA</option>
				</select> <select name="category" id="category">
					<option>전체카테고</option>
				</select>

			</div>
			<div class="control">
				<label for="name">게시글 찾기 </label> <select name="ds">
					<option>제목</option>
					<option value="">내용</option>
					<option value="">작성자</option>
					<option value="">ID</option>
				</select> <input type="text">

			</div>



			<div class="control">
				<label for="name">답변상태 </label> <input type="radio" name="answer"
					value="y">답변완료 <input type="radio" name="answer" value="n">답변대기

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