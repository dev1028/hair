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
$(function(){

	chart();

	})
	function chart() {

		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});

		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			// Create the data table.
			var data = new google.visualization.DataTable();
			data.addColumn('string', '순위');
			data.addColumn('number', '예약');
			data.addColumn({
				type : 'string',
				role : 'annotation'
			});

			var datatable = [];
			//ajax
			$.ajax({
				async : false,
				url : "/hairapp/ajax/admin/analysisByHairshopCount.do",
				dataType : "json",
				success : function(datas) {
					console.log(datas);
					for (i = 0; i < datas.length; i++) {
						datatable.push([ datas[i].rank + "위",
								parseInt(datas[i].cnt), datas[i].hs_name ]);
					}
					//
				}
			});
			data.addRows(datatable);

			// Set chart options
			var options = {
				'title' : '인기헤어순위 ',
				'width' : 1500,
				'height' : 700
			};

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.ColumnChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
	}
</script>
</head>
<body>

</body>
</html>