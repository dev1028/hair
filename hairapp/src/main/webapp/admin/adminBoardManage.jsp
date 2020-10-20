
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/decorator/ges/dist/js/scripts.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/decorator/ges/dist/assets/demo/datatables-demo.js"></script>




<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#answerDiv").hide();
		$("#category").hide();
		$("#start").attr('value', '');
		var date = new Date();
		endDate(date);

		$(".dateBtn").on("click", function() {
			if ($(this).is("#today") === true) {
				today();
			} else if ($(this).is("#three") === true) {
				three();
			} else if ($(this).is("#seven") === true) {
				week();
			} else if ($(this).is("#month") === true) {
				mon();
			} else {
				$("#start").attr('value', '');
				var date = new Date();
				endDate(date);

			}
		})
		$("#boardType").change(function() {

			if (($(this).children("option:selected").is("#qna")) === true) {
				$("#category").show();
				$("#answerDiv").show();

			} else {
				$("#category").hide();
				$("#answerDiv").hide();
			}
		});

		function startDate(d) {
			$("#start").attr('value', moment(d).format('YYYY-MM-DD'));
		}
		function endDate(d) {
			$("#end").attr('value', moment(d).format('YYYY-MM-DD'));
		}
		function today() {
			var d = new Date();

			startDate(d);
			endDate(d);
			console.log(d);

		}
		function three() {
			var d = new Date();
			endDate(d);
			d.setDate(d.getDate() - 3);
			startDate(d);
			console.log(d);

		}
		function week() {
			var d = new Date();
			endDate(d);
			startDate(d.setDate(d.getDate() - 7));
			console.log(d);

		}

		function mon() {
			var d = new Date();
			endDate(d);

			startDate(d.setMonth(d.getMonth() - 1));
			console.log(d);

		}

		$("#all").on("click", function() {

			var check = $("#all").prop("checked");
			$("input[class=chk]").prop("checked", check);
		})
		$(document)
				.on(
						"click",
						"#excel",
						function() {

							var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
							var table_html = encodeURIComponent(document
									.getElementById('table').outerHTML);

							var a = document.createElement('a');
							a.href = data_type + ',%EF%BB%BF' + table_html;
							a.download = 'test' + '_excel' + '.xls';
							a.click();

						})

	});
</script>
</head>
<body>
	<h2 class="heading">매출결산</h2>
	<form
		action="${pageContext.request.contextPath}/admin/adminBoardManageFind.do">

		<div class="form-group">

			<div class="control">
				<label for="name">기간 </label>
				<button type="button" value="0" class='dateBtn' id="all">전체
				</button>
				<button type="button" value="0" class='dateBtn' id="today">오늘
				</button>
				<button type="button" value="3" class='dateBtn' id="three">3일
				</button>
				<button type="button" value="7" class='dateBtn' id="seven">7일
				</button>
				<button type="button" value="30" class='dateBtn' id="month">1개월
				</button>
				<input type="date" id="start" name="startDate"> - <input
					type="date" id="end" name="endDate">
			</div>
			<div class="control">
				<label for="name">게시판 선택 </label> <select name="boardType"
					id="boardType">

					<option id="notice" value="notice">공지</option>
					<option id="qna" value="qna">QnA</option>
				</select> <select name="category" id="category">
					<option value="all">전체카테고리</option>
					<option value="a1">입점문의</option>
					<option value="a2">단순문의</option>
					<option value="a3">불만문의</option>
				</select>

			</div>
			<div class="control">
				<select name="who" id="who">
					<option value="j1">미용실</option>
					<option value="j2">일반회원</option>
					<option value="j3">디자이너</option>
				</select>

			</div>

			<div class="control">
				<label for="name">게시글 찾기 </label> <select name="searchType"
					id="searchType">
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="writer">작성자</option>
					<option value="id">ID</option>
				</select> <input type="text" id="searchVal" name="searchVal">

			</div>



			<div class="control" id="answerDiv">
				<label for="name">답변상태 </label> <input type="checkbox" name="answer"
					id="answer" value="y">답변완료 <input type="checkbox"
					name="answer" value="n">답변대기

			</div>
			<div class="control">


				<button type="submit" value="Submit" id="submit" class="col-1-4">Submit</button>
			</div>
		</div>
	</form>



	<h2 class="heading">result</h2>
	<div class="table-responsive" id="result">
		<table class="table table-bordered" id="dataTable" width="100%"
			cellspacing="0">
			<thead>
				<tr>
					<th><input type="checkbox" name="all" id="all" class="chk"></th>
					<th>번호</th>
					<th>분류
						<button type="button" name="designer_no" class="asc">↑</button>
						<button type="button" name="designer_no" class="des">↓</button>
					</th>
					<th>제
						<button type="button" name="designer_no" class="asc">↑</button>
						<button type="button" name="designer_no" class="des">↓</button>
					</th>
					<th>답변상태
						<button type="button" name="designer_no" class="asc">↑</button>
						<button type="button" name="designer_no" class="des">↓</button>
					</th>
					<th>답변하기</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수
						<button type="button" name="designer_no" class="asc">↑</button>
						<button type="button" name="designer_no" class="des">↓</button>
					</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${list }" var="l">
					<tr>

						<td><input type="checkbox" class="chk"></td>
						<td>${ l.b_no}</td>
						<td>${ l.b_category}</td>
						<td>${ l.b_title}</td>
						<td>${ l.b_as}</td>
						<td>${ l.b_a}</td>
						<td>${ l.b_writer}</td>
						<td>${ l.b_wd}</td>
						<td>${ l.b_hits}</td>
						<td>${ l.b_who}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button id="excel">excel</button>
	</div>
	<!-- <button type="button" id="excel">excel</button> -->

</body>
</html>