<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script>

<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	result('2020-09');
	function chart() {

		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});

		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			// Create the data table.
			var data = new google.visualization.DataTable();
			data.addColumn('string', '순위');
			data.addColumn('number', '남자');
			data.addColumn({
				type : 'string',
				role : 'annotation'
			});
			data.addColumn('number', '여자');
			data.addColumn({
				type : 'string',
				role : 'annotation'
			});
			var datatable = [];
			//ajax
			$.ajax({
				async : false,
				url : "/hairapp/ajax/hairshop/analysisTreatGender.do",
				dataType : "json",
				success : function(datas) {
					console.log(datas);
					for (i = 0; i < datas.length; i++) {
						datatable.push([ datas[i].rank + "위",
								parseInt(datas[i].cntMale),
								datas[i].hhi_nameMale, parseInt(datas[i].cnt),
								datas[i].hhi_nameFemale ]);
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
	function result(start) {

		//$("#result").html("");
		var url = "/hairapp/ajax/hairshop/analysisTreatTable.do"
		var table = $("<table />").attr({
			'border' : '1',
			'id' : 'test'
		});
		var tr = $("<tr />");
		tr.append($("<th>").text("순위 "));
		tr.append($("<th>").text("대분류 "));
		tr.append($("<th>").text("중분류  "));
		tr.append($("<th>").text("시술명  "));
		tr.append($("<th>").text("시술수 "));
		//tr.append($("<th>").text("전월대비  "));
		tr.append($("<th>").text("최다시술디자이너  "));
		tr.append($("<th>").text("평점"));

		table.append(tr);
		console.log(tr);
		console.log(table);
		$.ajax({
			url : url,
			dataType : 'json',
			data : {
				//date: $("#date").val()
				date : start
			},
			success : function(obj) {

				console.log(obj);
				obj.forEach(function(o, i, u) {

					var tr = $("<tr />");
					if (o.gender === "female") {
						tr.append($("<td>").text(o.rank));
						tr.append($("<td>").text(o.tmac_name));
						tr.append($("<td>").text(o.tmic_name));
						tr.append($("<td>").text(o.hhi_name));
						tr.append($("<td>").text(o.cnt));
						tr.append($("<td>").text(o.designer_name));
						tr.append($("<td>").text(o.hr_rate));

						table.append(tr);
					} else {
						tr.append($("<td>").text(o.rank));
						tr.append($("<td>").text(o.tmac_name));
						tr.append($("<td>").text(o.tmic_name));
						tr.append($("<td>").text(o.hhi_name));
						tr.append($("<td>").text(o.cnt));
						tr.append($("<td>").text(o.designer_name));
						tr.append($("<td>").text(o.hr_rate));

						table.append(tr);
					}

					//table.append(tr);
				})

			}
		});
		$("#result").append($(table));
		console.log($("#result"));
		$("#result").append($("<button />").attr('id', 'excel').text("엑셀로 저장"));

	}
</script>

</head>
 
<body>
	<br>
	<br>
	<br>
	<div id="chart_div"></div>
	<div>
		<div id="chartContainer" style="height: 300px; width: 100%;"></div>
	</div>
	<div id="result"></div>

</body>
</html>