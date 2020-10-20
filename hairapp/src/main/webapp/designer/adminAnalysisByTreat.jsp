<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {

		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawStuff);
	});

	function drawStuff() {
		

		var today = new Map();
		var yesterday = new Map();
		var tomorrow = new Map();

		today.set("rsv", 0);
		today.set("sales", 0);
		yesterday.set("rsv", 0);
		yesterday.set("sales", 0);
		tomorrow.set("rsv", 0);
		tomorrow.set("sales", 0);


		var datatable = [];
		$.ajax({
			async : false,
			url : "/hairapp/ajax/designer/designerChart.do",
			dataType : "json",
			success : function(datas) {

				console.log(datas);
				for (var i = 0; i < datas.length; i++) {

					if (datas[i].date === '오늘') {
						today.set("rsv", parseInt(datas[i].rsv));
						today.set("sales", parseInt(datas[i].sales));
					} else if (datas[i].date === '내일') {
						tomorrow.set("rsv", parseInt(datas[i].rsv));
						tomorrow.set("sales", parseInt(datas[i].sales));
					} else if (datas[i].date === '어제') {
						yesterday.set("rsv", parseInt(datas[i].rsv));
						yesterday.set("sales", parseInt(datas[i].sales));
					}
				}
			}

		});

		var data = google.visualization.arrayToDataTable([
				[ 'day', '매출', '예약자수' ],
				[ '어제', yesterday.get("sales"), yesterday.get("rsv") ],
				[ '오늘', today.get("sales"), yesterday.get("rsv") ],
				[ '내일', tomorrow.get("sales"), tomorrow.get("rsv") ] ]);

		data.addRows(datatable);
		// Set chart options
		var options = {
				//height: 800,
			title : '',
			vAxis : {
				0: {format: 'currency'},
				1: {}
				},
			hAxis : {
				
			},
			//seriesType : 'bars',
			series : {
				0:{ type: "bars", targetAxisIndex: 0 },
	               1: { type: "line", targetAxisIndex: 1}
			}
		};

		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);

	}
</script>
</head>
<body>
	<div id="top_x_div"
		style="width: 800px; height: 600px; margin-left: auto; margin-right: auto;"></div>

	<div id="chart_div"></div>
</body>
</html>