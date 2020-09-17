// Load the Visualization API and the corechart package.
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
	data.addColumn('string', '부서');
	data.addColumn('number', '사원수');

	var datatable = [];
	$.ajax({
		async : false,
		url : "ajax/ChartData.do",
		dataType : "json",
		success : function(datas) {
			for (i = 0; i < datas.length; i++) {
				var innertb = [ datas[i].name, parseInt(datas[i].cnt) ];
				datatable.push(innertb);
			}
		}

	});

	data.addRows(datatable);

	// Set chart options
	var options = {
		'title' : '매장 현황',
		'width' : 500,
		'height' : 500
	};

	// Instantiate and draw our chart, passing in some options.
	var chart = new google.visualization.BarChart(document
			.getElementById('chart_div'));
	chart.draw(data, options);
}
