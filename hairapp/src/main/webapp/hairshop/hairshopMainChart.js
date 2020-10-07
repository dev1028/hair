//Load the Visualization API and the corechart package.
google.charts.load('current', {
	'packages' : [ 'corechart' ]
});

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {

	// Create the data table.
	var data = new google.visualization.DataTable();
	data.addColumn('string', '디자이너');
	data.addColumn('number', '오늘예약금액합계');/* 
	        data.addColumn('number', '임원수'); */
	var datatable = [];
	//ajax
	$.ajax({
		async : false,
		url : "/hairapp/ajax/hairshop/chart.do",
		dataType : "json",
		success : function(datas) {
			console.log(datas);
			for (i = 0; i < datas.length; i++) {
				datatable.push([ datas[i].name, parseInt(datas[i].ammount) ]);
			}
			//
		}
	});
	data.addRows(datatable
	/* 	[
	['인사', 10,3],
	['개발새발',5, 1],
	['기획', 2,1],
	] */

	);

	// Set chart options
	var options = {
		'title' : '일별 총 예약금액 ',
		'width' : 1000,
		'height' : 700
	};

	// Instantiate and draw our chart, passing in some options.
	var chart = new google.visualization.ColumnChart(document
			.getElementById('chart_div'));
	chart.draw(data, options);
}