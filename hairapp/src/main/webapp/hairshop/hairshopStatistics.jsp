<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="hairshopStatistics.css">


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
	function range() {
		$("#range").html("");
		$("#range").append($("<input />").attr({
			'type' : 'date',
			'id' : 'start'
		}), $("<span />").html(' - '), $("<input />").attr({
			'type' : 'date',
			'id' : 'end'
		}), $("<button />").html("당일 "), $("<button />").html("어제 "),
				$("<button />").html("최근1주 "), $("<button />").html("최근1달 ")

		);
	}
	function year() {
		$("#range").html("");
		select = $("<select/>");
		for (var i = 2020; i > 2000; i--) {

			select.append($("<option />").text(i + "년"));

		}
		$("#range").append(select);
	}
	function quater() {
		$("#range").html("");
		year = $("<select/>");
		for (var i = 2020; i > 2000; i--) {

			year.append($("<option />").text(i + "년"));

		}
		$("#range").append(year);
		quarter = $("<select/>");

		quarter.append($("<option />").text("1/4 분기"));
		quarter.append($("<option />").text("2/4 분기"));
		quarter.append($("<option />").text("3/4 분기"));
		quarter.append($("<option />").text("4/4 분기"));
		$("#range").append(quarter);

	}
	function mon() {
		$("#range").html("");
		year = $("<select/>");
		for (var i = 2020; i > 2000; i--) {

			year.append($("<option />").text(i + " 년"));
		}
		$("#range").append(year);
		mon = $("<select/>");
		for (var i = 1; i < 13; i++) {

			mon.append($("<option />").text(i + " 월"));
		}
		$("#range").append(mon);
	}
</script>
</head>
<body>
	<h2 class="heading">매출결산</h2>
	<form method="POST"
		action="${pageContext.request.contextPath}/hairshop/salesStatisticsResult.do">
		<!--  search -->
		<div class="form-group">

			<div class="control">
				<label for="name">검색구분 </label>
				<button type="button" value="Submit" onclick="range()">기간내결산</button>
				<button type="button" value="Submit" onclick="year()">년도별
					결산</button>
				<button type="button" value="Submit" onclick="quater()">분기별
					결산</button>
				<button type="button" value="Submit" onclick="mon()">월별 결산</button>
			</div>

			<div class="control">
				<label for="name">기간선택 </label>
				<div class="controls" id="range"></div>
			</div>

			<div class="control">
				<label for="name">직원선택 </label> <select>
					<option>전체직원</option>
					<option>kim</option>
				</select>
				<div class="controls"></div>
			</div>

			<button type="submit" value="Submit" class="col-1-4">Submit</button>
		</div>
	</form>
	<!--  result -->
	<!-- 매출 -->
	<div class="form-group">
		<h2 class="heading">지출합계</h2>
		<table id="income" border = "1">

			<tr>
				<th>구분</th>
				<th>현금</th>
				<th>카드</th>
				<th>카카오</th>
				<th>계좌</th>
				<th>기타</th>
				<th>총합</th>
			</tr>
			
			

				<tr>
				<th>시술매출</th>
					<td>${vo.cash }</td>

					<td>${vo.card }</td>
					<td>${vo.kakao }</td>
					<td>${vo.account }</td>
					<td>${vo.etc }</td>
					<td>${vo.sum }</td>
				</tr>
		
		</table>

	</div>






</body>
</html>