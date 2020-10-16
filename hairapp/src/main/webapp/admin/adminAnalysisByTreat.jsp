<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	datatable = [];
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawStuff);
	
	function drawStuff() {
		$.ajax({
			async : false,
			url : "../ajax/adminAnalysisByTreatRank.do",
			dataType : "json",
			success : function(datas) {
// 				console.log(datas);
				datatable.push(['Move', 'count'])
				for(i=0; i<datas.length && i < 10; ++i){
					datatable.push( [datas[i].hhi_name, parseInt(datas[i].cnt)]);
				}
// 				console.log(datatable);

				data = new google.visualization.arrayToDataTable(datatable);
				var options = {
				          width: 800,
				          legend: { position: 'none' },
				          chart: {
				            title: '인기헤어순위 ',
				            subtitle: '' },
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
		        
		        for(i=10; i<datas.length; ++i){
					datatable.push( [datas[i].hhi_name, parseInt(datas[i].cnt)]);
				}
			}
		});
		console.log(datatable);
		for(var i=1; i<datatable.length; ++i){
			$(".table > tbody:last").append("<tr><td>" + i +"</td><td>" +  datatable[i][0]  + "</td><td>" +  datatable[i][1] +"</td></tr>")
			
		}
	};
</script>
</head>
<body>
	<div id="top_x_div" style="width: 800px; height: 600px; margin-left: auto; margin-right: auto;"></div>
	
	<table class="table" style="width: 800px; margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<th>순위</th>
				<th>헤어 이름</th>
				<th>예약 수</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
</html>