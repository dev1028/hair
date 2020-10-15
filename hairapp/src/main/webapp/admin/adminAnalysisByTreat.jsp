<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawStuff);

	function drawStuff() {
		//     	  var datatable = [];
		// 			//ajax
		// 			$.ajax({
		// 				async : false,
		// 				url : "/hairapp/ajax/admin/analysisByHairshopCount.do",
		// 				dataType : "json",
		// 				success : function(datas) {
		// 					console.log(datas);
		// 					for (i = 0; i < datas.length; i++) {
		// 						datatable.push([ datas[i].rank + "위",
		// 								parseInt(datas[i].cnt), datas[i].hs_name ]);
		// 					}
		// 					//
		// 				}
		// 			});
		// 			data.addRows(datatable);

		datatable = [];
		$.ajax({
			async : false,
			url : "../ajax/adminAnalysisByTreatRank.do",
			dataType : "json",
			success : function(datas) {
				console.log(datas);
				datatable.push(['Move', 'count'])
				for(i=0; i<datas.length; ++i){
					datatable.push( [datas[i].hhi_name, parseInt(datas[i].cnt)]);
				}
				console.log(datatable);

				data = new google.visualization.arrayToDataTable(datatable);
				var options = {
				          width: 800,
				          legend: { position: 'none' },
				          chart: {
				            title: 'Chess opening moves',
				            subtitle: 'popularity by percentage' },
				          axes: {
				            x: {
				              0: { side: 'top', label: 'White to move'} // Top x-axis.
				            }
				          },
				          bar: { groupWidth: "90%" }
				        };

				var chart = new google.charts.Bar(document.getElementById('top_x_div'));
		        // Convert the Classic options to Material options.
		        chart.draw(data, google.charts.Bar.convertOptions(options));
			}
		});
		console.log(datatable);

		
	};
</script>
</head>
<body>
	<div id="top_x_div" style="width: 800px; height: 600px;"></div>
	<div id="table">
	</div>
</body>
</html>