<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#myTab a:last').tab('show')
		$('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
		period();
		$("button").attr('class', 'btn btn-default');
		$("input").attr('class', 'btn btn-default');
		$(document)
				.on(
						"click",
						"#excel",
						function() {

							var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
							var table_html = encodeURIComponent(document
									.getElementById('test').outerHTML);

							var a = document.createElement('a');
							a.href = data_type + ',%EF%BB%BF' + table_html;
							a.download = 'test' + '_excel' + '.xls';
							a.click();

						})
		$(document).on("click", '#submit', function() {

			if ($("#range").is(".yearResult") === true) {
				yearResult();
			} else if ($("#range").is(".quarter") === true) {
				quarterResult();
			} else if ($("#range").is(".month") === true) {
				monthResult();

			} else if ($("#range").is(".period") === true) {
				periodResult();

			}

		});
		$(document).on("click", '.search', function() {
			console.log($(this).attr('id'));

			if ($(this).is("#year") === true) {
				year();
			} else if ($(this).is("#period") === true) {
				period();
			} else if ($(this).is("#quarter") === true) {
				quarter();
			} else if ($(this).is("#month") === true) {
				month();
			}
		});

		function yearResult() {
			var start = new Date($("#selectYear option:selected").val(), 0);
			var end = new Date($("#selectYear option:selected").val(), 11, 31);

			result(start, end);
		}
		function quarterResult() {
			var start = new Date($("#selectYear option:selected").val(), $(
					"#selectQuarter option:selected").val(), 1);
			var end = new Date(start.getFullYear(), start.getMonth() + 3, 1);
			console.log(start, end);
			result(start, end);
		}
		function monthResult() {
			var start = new Date($("#selectYear option:selected").val(), $(
					"#selectMonth option:selected").val(), 1);
			var end = new Date(start.getFullYear(), start.getMonth() + 1, 0);
			console.log(start, end);
			result(start, end);
		}
		function periodResult() {
			var start = $("#start").val();
			var end = $("#end").val();
			result(start, end);
		}

		function period() {
			$("#range").html("");
			$("#range").attr('class', 'period');
			$("#range").append(
					$("<input />").attr({
						'type' : 'date',
						'name' : 'start',
						'id' : 'start'
					}),
					$("<span />").html(' - '),
					$("<input />").attr({
						'type' : 'date',
						'name' : 'end',
						'id' : 'end'
					}),
					$("<input />").attr('type', 'button').val("당일")
							.click(today),
					$("<input />").attr('type', 'button').val("어제 ").click(
							yester),
					$("<input />").attr('type', 'button').val("최근 1주 ").click(
							week),
					$("<input />").attr('type', 'button').val("최근 1달 ").click(
							mon)

			);
		}
		function year() {
			$("#range").attr('class', 'yearResult');
			$("#range").html("");
			select = $("<select/>").attr('id', 'selectYear');
			for (var i = 2020; i > 2000; i--) {

				select.append($("<option />").val(i).text(i + "년"));

			}
			$("#range").append(select);

		}
		function quarter() {
			$("#range").attr('class', 'quarter');
			$("#range").html("");
			year = $("<select/>").attr('id', 'selectYear');
			for (var i = 2020; i > 2000; i--) {

				year.append($("<option />").text(i + "년").val(i));

			}
			$("#range").append(year);
			quarter = $("<select/>").attr('id', 'selectQuarter');

			quarter.append($("<option />").text("1/4 분기").val(0));
			quarter.append($("<option />").text("2/4 분기").val(3));
			quarter.append($("<option />").text("3/4 분기").val(6));
			quarter.append($("<option />").text("4/4 분기").val(9));
			$("#range").append(quarter);

		}
		function month() {
			$("#range").attr('class', 'month');
			$("#range").html("");
			year = $("<select/>").attr('id', 'selectYear');
			;
			for (var i = 2020; i > 2000; i--) {

				year.append($("<option />").text(i + " 년").val(i));
			}
			$("#range").append(year);
			month = $("<select/>").attr('id', 'selectMonth');
			;
			for (var i = 0; i < 12; i++) {

				month.append($("<option />").text(i + 1 + " 월").val(i));
			}
			$("#range").append(month);
		}
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
		function yester() {
			var d = new Date();
			d.setDate(d.getDate() - 1);
			startDate(d);
			endDate(d);
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

	});
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<h2 class="heading">매출결산</h2>
	<form method="POST"
		action="${pageContext.request.contextPath}/hairshop/salesStatisticsResult.do">
		<!--  search -->
		<div class="form-group">

			<div class="control">
				<label for="name">검색구분 </label>
				<button type="button" value="Submit" class='search' id="period">기간내결산</button>
				<button type="button" value="Submit" class='search' id="year">년도별
					결산</button>
				<button type="button" value="Submit" class='search' id="quarter">분기별
					결산</button>
				<button type="button" value="Submit" class='search' id="month">월별
					결산</button>
			</div>

			<div class="control">
				<label for="name">기간선택 </label>
				<div class="controls" id="range"></div>
			</div>



			<button type="button" value="Submit" id="submit" class="col-1-4">Submit</button>
		</div>
	</form>
	<!--  result -->
	<!-- 매출 -->



	<h2 class="heading">지출합계</h2>
	<div class="form-group" id="result"></div>
	<!-- <button type="button" id="excel">excel</button> -->



	<div role="tabpanel">

		<ul class="nav nav-tabs nav-justified" role="tablist" id="myTab">
			<li role="presentation" class="active"><a href="#home"
				aria-controls="sales" role="tab" data-toggle="tab">매출</a></li>
			<li role="presentation"><a href="#profile"
				aria-controls="customer" role="tab" data-toggle="tab">객수</a></li>
			<li role="presentation"><a href="#messages" aria-controls="rate"
				role="tab" data-toggle="tab">평점</a></li>

		</ul>

		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="sales">

				<div id="salesChart">d</div>
				<div id="salesTable">d</div>

			</div>
			<div role="tabpanel" class="tab-pane" id="customer">

				<div id="customerChart"></div>
				<div id="customerTable"></div>

			</div>
			<div role="tabpanel" class="tab-pane" id="rate">
				<div id="rateChart"></div>
				<div id="rateTable"></div>
			</div>

		</div>

	</div>


</body>
</html>