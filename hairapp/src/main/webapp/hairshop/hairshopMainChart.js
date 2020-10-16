//Load the Visualization API and the corechart package.
google.charts.load('current', {
	'packages' : [ 'corechart' ]
});

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

출처: https:
// fruitdev.tistory.com/160 [과일가게 개발자]
function drawChart() {

	// Create the data table.
	var data = new google.visualization.DataTable();
	data.addColumn('string', '디자이너');
	data.addColumn('number', '오늘예약금액합계');
	var datatable = [];
	// ajax
	$.ajax({
		async : false,
		url : "/hairapp/ajax/hairshop/chart.do",
		dataType : "json",
		success : function(datas) {
			var ammount = 0;
			console.log(datas);
			for (i = 0; i < datas.length; i++) {
				ammount += parseInt(datas[i].ammount);
				datatable.push([ datas[i].name, parseInt(datas[i].ammount) ]);
			}

//			$("#str").append(
//					$("<h5/>").text(
//							"오늘의 총 예약금액은 " + numberWithCommas(ammount)
//									+ " 원 입니다"));
			$("#str").append(
					$("<p />").text(
							"오늘의 총 예약금액은 " + numberWithCommas(ammount)
									+ " 원 입니다"));
		}
	});
	data.addRows(datatable

	);

	// Set chart options
	var options = {
		'title' : '일별 총 예약금액 ',

	};

	// Instantiate and draw our chart, passing in some options.
	var chart = new google.visualization.PieChart(document
			.getElementById('chart_div'));
	chart.draw(data, options);
}