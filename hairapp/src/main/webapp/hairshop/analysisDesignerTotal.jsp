<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	padding: 10px;
}

/* change border radius for the tab , apply corners on top*/
#exTab3 .nav-pills>li>a {
	border-radius: 4px 4px 0 0;
}

#exTab3 .tab-content {
	color: white;
	background-color: gray;
	padding: 5px 15px;
}
</style>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
var rsvjsonlist = ${rsvjsonlist};
var salesjsonlist = ${salesjsonlist};var ratejsonlist = ${ratejsonlist};



function chart() {

	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	google.charts.setOnLoadCallback(drawChartrsv);
	google.charts.setOnLoadCallback(drawChartsales);
	google.charts.setOnLoadCallback(drawChartrate);

	function drawChartsales() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', '순위');
		data.addColumn('number', '매출 ');
		data.addColumn({
			type : 'string',
			role : 'annotation'
		});

		var datatable = [];
		

		for( datas of salesjsonlist){
		
		
				console.log(datas);
			
					datatable.push([ datas.rank + "위",
							parseInt(datas.sales), datas.designer_name ]);
				
				//
			}
	
		data.addRows(datatable);

		// Set chart options
		var options = {
			'title' : '매출순 ',
			'width' :400,
			'height' : 300
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart_divsales'));
		chart.draw(data, options);
	}
	function drawChartrate() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', '순위');
		data.addColumn('number', '평점');
		data.addColumn({
			type : 'string',
			role : 'annotation'
		});

		var datatable = [];
		

		for( datas of ratejsonlist){
		
		
				console.log(datas);
			
					datatable.push([ datas.rank + "위",
							parseInt(datas.hr_rate), datas.designer_name ]);
				
				//
			}
	
		data.addRows(datatable);

		// Set chart options
		var options = {
			'title' : '평점순위 ',
			'width' :400,
			'height' : 300
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart_divrate'));
		chart.draw(data, options);
	}
	function drawChartrsv() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', '순위');
		data.addColumn('number', '예약');
		data.addColumn({
			type : 'string',
			role : 'annotation'
		});

		var datatable = [];
		

		for( datas of rsvjsonlist){
		
		
				console.log(datas);
			
					datatable.push([ datas.rank + "위",
							parseInt(datas.cnt), datas.designer_name ]);
				
				//
			}
	
		data.addRows(datatable);

		// Set chart options
		var options = {
			'title' : '인기헤어순위 ',
			'width' :400,
			'height' : 300
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart_divrsv'));
		chart.draw(data, options);
	}
}
	$(function() {
		chart();
		
		period();

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





	<div class="container">
		<h2>Example 3</h2>
	</div>
	<div id="exTab3" class="container">
		<ul class="nav nav-pills">
			<li class="active"><a href="#1b" data-toggle="tab">예약수</a></li>
			<li><a href="#2b" data-toggle="tab">매출 </a></li>
			<li><a href="#3b" data-toggle="tab"> 리뷰평점 </a></li>
		</ul>

		<div class="tab-content clearfix">
			<div class="tab-pane active" id="1b">
				<div id="chart_divrsv"></div>
				<div class="table-responsive" id="result">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">

						<thead>
							<tr>
								<th>순위</th>
								<th>사진</th>
								<th>이름</th>
								<th>예약수</th>

								<th>전월대비</th>
								<th>전월대비순위</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${rsvlist }" var="l">
								<tr>

									<td>${ l.rank}</td>
									<td>사진</td>
									<td>${ l.designer_name}</td>

									<td>${l.cnt }</td>



								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button id="excel">excel</button>
					<button id="email">email</button>
				</div>



			</div>
			<div class="tab-pane" id="2b">
				<div id="chart_divsales"></div>
				<div class="table-responsive" id="result">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">

						<thead>
							<tr>
								<th>순위</th>
								<th>사진</th>
								<th>이름</th>
								<th>매출</th>

								<th>전월대비</th>
								<th>전월대비순위</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${saleslist }" var="l">
								<tr>

									<td>${ l.rank}</td>
									<td>사진</td>
									<td>${ l.designer_name}</td>

									<td>${l.sales }</td>



								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button id="excel">excel</button>
					<button id="email">email</button>
				</div>
			</div>
			<div class="tab-pane" id="3b">
				<div id="chart_divrate"></div>
				<div class="table-responsive" id="result">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">

						<thead>
							<tr>
								<th>순위</th>
								<th>사진</th>
								<th>이름</th>
								<th>평점</th>

								<th>전월대비</th>
								<th>전월대비순위</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${ratelist }" var="l">
								<tr>

									<td>${ l.rank}</td>
									<td>사진</td>
									<td>${ l.designer_name}</td>

									<td>${l.hr_rate }</td>



								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button id="excel">excel</button>
					<button id="email">email</button>
				</div>
			</div>
			<div class="tab-pane" id="4b">
				<h3>We use css to change the background color of the content to
					be equal to the tab</h3>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>







</body>
</html>