<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>
var rsvjsonlist = ${rsvjsonlist};
	var salesjsonlist = ${salesjsonlist};
	var ratejsonlist = ${ratejsonlist};
$(function(){


	
	chart();

	})
	function chart() {
	
	
	
	
	
	
	
	
	
	
	

	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	google.charts.setOnLoadCallback(drawChartrsv);
	google.charts.setOnLoadCallback(drawChartsales);
	google.charts.setOnLoadCallback(drawChartrate);
	

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
	
	
	



	for( datas of  rsvjsonlist ){
	
	
			console.log(datas);
		
				datatable.push([ datas.rank + "위",
						parseInt(datas.rsv), datas.hs_name ]);
			
			//
		}

	data.addRows(datatable);

	// Set chart options
	var options = {
		'title' : '미용실 예약순위  ',
		'width' :400,
		'height' : 300
	};

	// Instantiate and draw our chart, passing in some options.
	var chart = new google.visualization.ColumnChart(document
			.getElementById('chart_div'));
	chart.draw(data, options);
	
}
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
						parseInt(datas.sales),  datas.hs_name  ]);
			
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
						parseInt(datas.rate),  datas.hs_name  ]);
			


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
</script>
</head>
<body>
	<div class="container">

		<form method="POST" id="frm"
			action="${pageContext.request.contextPath}/admin/analysisByHairshopCount.do">

			<div class="row">
				<div class="col">
					<input type="month" class="form-control " name="month"
						value="2020-10">
				</div>
				<div class="col">

					<button type="submit" value="Submit" id="submit"
						class="btn btn-default col-3" style="border: 1px solid gray;">검색</button>
				</div>
			</div>
		</form>

	</div>

	<div id="chart_div"></div>
	<div id="chart_divsales"></div>
	<div id="chart_divrate"></div>
</body>
</html>