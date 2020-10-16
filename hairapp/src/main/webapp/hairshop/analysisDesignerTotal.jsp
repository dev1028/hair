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
	background-color:;
	padding: 5px 15px;
}

.avatar {
	vertical-align: middle;
	width: 50px;
	height: 50px;
	border-radius: 50%;
}

.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons that are used to open the tab content */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
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
function openCity(evt, cityName) {
	  // Declare all variables
	  var i, tabcontent, tablinks;

	  // Get all elements with class="tabcontent" and hide them
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }

	  // Get all elements with class="tablinks" and remove the class "active"
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }

	  // Show the current tab, and add an "active" class to the button that opened the tab
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}















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
			'width' :700,
			'height' : 400,
			annotations: {
			     textStyle: {
			         color: 'black',
			         fontSize: 11,
			     },
			     alwaysOutside: true
			}
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
							parseInt(datas.rate), datas.designer_name ]);
				


				//
			}
	
		data.addRows(datatable);

		// Set chart options
		var options = {
			'title' : '평점순위 ',
			'width' :700,
			'height' : 400,
			annotations: {
			     textStyle: {
			         color: 'black',
			         fontSize: 11,
			     },
			     alwaysOutside: true
			}
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
							parseInt(datas.rsv), datas.designer_name ]);
				
				//
			}
	
		data.addRows(datatable);

		// Set chart options
		var options = {
			'title' : '예약순위 ',
			'width' :700,
			'height' : 400,
			annotations: {
			     textStyle: {
			         color: 'black',
			         fontSize: 11,
			     },
			     alwaysOutside: true
			}
		};
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart_divrsv'));
		chart.draw(data, options);
	}
}
	$(function() {
<<<<<<< HEAD
		
		
		$("#frm").submit();
		chart();
	

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
	
		});
	

		
		
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


$(document).on("click", '#daybtn', function() {
			
		});
$(document).on("click", '#monthbtn', function() {
	
});


var d = new Date();
$("#start").attr('value', moment(d).format('YYYY-MM-DD'));
</script>
</head>
<body>

	<br>
	<br>
	<br>


	<!-- <ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#daytab"><button
					type="button" class="btn btn-default" id="daybtn">일</button></a></li>
		<li><a data-toggle="tab" href="#weektab">
				<button type="button" class="btn btn-default" id="weekbtn">주</button>
		</a></li>
		<li><a data-toggle="tab" href="#monthtab"><button
					type="button" class="btn btn-default" id="monthbtn">월</button></a></li>
	</ul>

	<div class="tab-content">
		<div id="daytab" class="tab-pane fade in active">
			<div class="row">
				<div class="col-4">
					<button type="button" class="btn btn-default" id="weekbtn"><</button>
				</div>
				<div class="col-4">
					<input class="form-control " type="date">
				</div>
				<div class="col-4">
					<button type="button" class="btn btn-default" id="weekbtn">></button>
				</div>
			</div>
		</div>
		<div id="weektab" class="tab-pane fade">
			<div class="row">
				<div class="col-3">
					<button type="button" class="btn btn-default" id="weekbtn"><</button>
				</div>
				<div class="col-3">
					<input type="month" class="form-control ">
				</div>
				<div class="col-3">
					<select name="qna_who" id="qna_who" class="form-control ">
						<option class="form-control form-check-input">1</option>
						<option class="form-control form-check-input">2</option>
						<option class="form-control form-check-input">3</option>
						<option class="form-control form-check-input">4</option>
						<option class="form-control form-check-input">5</option>
					</select>
				</div>
				<div class="col-3">
					<button type="button" class="btn btn-default" id="weekbtn">></button>
				</div>
			</div>
		</div>
		<div id="monthtab" class="tab-pane fade">
			<div class="row">
				<div class="col-4">
					<button type="button" class="btn btn-default" id="weekbtn"><</button>
				</div>
				<div class="col-4">
					<input type="month" class="form-control ">
				</div>
				<div class="col-4">
					<button type="button" class="btn btn-default" id="weekbtn">></button>
				</div>
			</div>
		</div>
	</div>
 -->

	<div class="container">

		<form method="POST" id="frm" 
			action="${pageContext.request.contextPath}/hairshop/analysisDesignerTotal.do">

<div class="row"><div class="col">
					<input type="month" class="form-control " name = "month" value="2020-10">
</div>
<div class="col">

					<button type="submit" value="Submit" id="submit"
						class="btn btn-default col-3" style="border: 1px solid gray;">검색</button>
				</div>
</div>
		</form>

	</div>













	<div class="tab row">
		<div class="col-4">
			<button class="tablinks" onclick="openCity(event, 'London')">예약수</button>
		</div>
		<div class="col-4">
			<button class="tablinks" onclick="openCity(event, 'Paris')">매출순위</button>
		</div>
		<div class="col-4">

			<button class="tablinks" onclick="openCity(event, 'Tokyo')">평점순위</button>
		</div>
	</div>

	<!-- Tab content -->
	<div id="London" class="tabcontent">
		<div id="chart_divrsv"></div>

		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>순위</th>
						<th>디자이너</th>
						<th>예약수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rsvlist }" var="l">
						<tr>
							<td>${ l.rank}</td>
							<td><img id="imgDes"
								onerror="this.src='../images/no_img.gif'"
								src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/designer/${l.designer_no }/profile&img_name=${l.file_name }"
								class="avatar">${ l.designer_name}</td>
							<td>${l.rsv }</td>


						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<div id="Paris" class="tabcontent">
		<div id="chart_divsales"></div>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>순위</th>
						<th>디자이너</th>
						<th>예약수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${saleslist }" var="l">
						<tr>
							<td>${ l.rank}</td>
							<td><img id="imgDes"
								onerror="this.src='../images/no_img.gif'"
								src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/designer/${l.designer_no }/profile&img_name=${l.file_name }"
								class="avatar">${ l.designer_name}</td>
							<td>${l.sales }</td>


						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div id="Tokyo" class="tabcontent">
		<div id="chart_divrate"></div>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>순위</th>
						<th>디자이너</th>
						<th>예약수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ratelist }" var="l">
						<tr>
							<td>${ l.rank}</td>
							<td><img id="imgDes"
								onerror="this.src='../images/no_img.gif'"
								src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/designer/${l.designer_no }/profile&img_name=${l.file_name }"
								class="avatar">${ l.designer_name}</td>
							<td>${l.rate }</td>
		chart();
	

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
	
		});
	

		
		
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


$(document).on("click", '#daybtn', function() {
			
		});
$(document).on("click", '#monthbtn', function() {
	
});


var d = new Date();
$("#start").attr('value', moment(d).format('YYYY-MM-DD'));
</script>
</head>
<body>

	<br>
	<br>
	<br>


	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#daytab"><button
					type="button" class="btn btn-default" id="daybtn">일</button></a></li>
		<li><a data-toggle="tab" href="#weektab">
				<button type="button" class="btn btn-default" id="weekbtn">주</button>
		</a></li>
		<li><a data-toggle="tab" href="#monthtab"><button
					type="button" class="btn btn-default" id="monthbtn">월</button></a></li>
	</ul>

	<div class="tab-content">
		<div id="daytab" class="tab-pane fade in active">
			<div class="row">
				<div class="col-4">
					<button type="button" class="btn btn-default" id="weekbtn"><</button>
				</div>
				<div class="col-4">
					<input class="form-control " type="date">
				</div>
				<div class="col-4">
					<button type="button" class="btn btn-default" id="weekbtn">></button>
				</div>
			</div>
		</div>
		<div id="weektab" class="tab-pane fade">
			<div class="row">
				<div class="col-3">
					<button type="button" class="btn btn-default" id="weekbtn"><</button>
				</div>
				<div class="col-3">
					<input type="month" class="form-control ">
				</div>
				<div class="col-3">
					<select name="qna_who" id="qna_who" class="form-control ">
						<option class="form-control form-check-input">1</option>
						<option class="form-control form-check-input">2</option>
						<option class="form-control form-check-input">3</option>
						<option class="form-control form-check-input">4</option>
						<option class="form-control form-check-input">5</option>
					</select>
				</div>
				<div class="col-3">
					<button type="button" class="btn btn-default" id="weekbtn">></button>
				</div>
			</div>
		</div>
		<div id="monthtab" class="tab-pane fade">
			<div class="row">
				<div class="col-4">
					<button type="button" class="btn btn-default" id="weekbtn"><</button>
				</div>
				<div class="col-4">
					<input type="month" class="form-control ">
				</div>
				<div class="col-4">
					<button type="button" class="btn btn-default" id="weekbtn">></button>
				</div>
			</div>
		</div>
	</div>


	<div class="container">

		<form method="POST"
			action="${pageContext.request.contextPath}/hairshop/AnalysisDesignerTotal.do">





			<button type="button" value="Submit" id="submit" class="col-1-4">Submit</button>

		</form>

	</div>













	<div class="tab row">
		<div class="col-4">
			<button class="tablinks" onclick="openCity(event, 'London')">예약수</button>
		</div>
		<div class="col-4">
			<button class="tablinks" onclick="openCity(event, 'Paris')">매출순위</button>
		</div>
		<div class="col-4">

			<button class="tablinks" onclick="openCity(event, 'Tokyo')">평점순위</button>
		</div>
	</div>

	<!-- Tab content -->
	<div id="London" class="tabcontent">
		<div id="chart_divrsv"></div>

		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>순위</th>
						<th>디자이너</th>
						<th>예약수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rsvlist }" var="l">
						<tr>
							<td>${ l.rank}/${l.prevrank }</td>
							<td><img id="imgDes"
								onerror="this.src='../images/no_img.gif'"
								src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/designer/${l.designer_no }/profile&img_name=${l.file_name }"
								class="avatar">${ l.designer_name}</td>
							<td>${l.rsv }/${l.prevrsv }</td>


						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<div id="Paris" class="tabcontent">
		<div id="chart_divsales"></div>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>순위</th>
						<th>디자이너</th>
						<th>예약수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${saleslist }" var="l">
						<tr>
							<td>${ l.rank}/${l.prevrank-l.rank }</td>
							<td><img id="imgDes"
								onerror="this.src='../images/no_img.gif'"
								src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/designer/${l.designer_no }/profile&img_name=${l.file_name }"
								class="avatar">${ l.designer_name}</td>
							<td>${l.sales }/${l.prevsales }</td>


						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div id="Tokyo" class="tabcontent">
		<div id="chart_divrate"></div>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>순위</th>
						<th>디자이너</th>
						<th>예약수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ratelist }" var="l">
						<tr>
							<td>${ l.rank}/${l.prevrank }</td>
							<td><img id="imgDes"
								onerror="this.src='../images/no_img.gif'"
								src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/designer/${l.designer_no }/profile&img_name=${l.file_name }"
								class="avatar">${ l.designer_name}</td>
							<td>${l.rate }/${l.prevrate }</td>


						</tr>
					</c:forEach>
				</tbody>
			</table>

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