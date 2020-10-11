// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
function set_cookie(name, value) {
	document.cookie = name + '=' + value + '; Path=/;';
}
function delete_cookie(name) {
	document.cookie = name
			+ '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

$(function() {
	$("#find").on("click", function() {
male=[];
female=[];
		console.log($("#date").val());

		// Bar Chart Example
		var data = $.ajax({
			url : "/hairapp/ajax/hairshop/analysisAge.do",
			dataType : "json",
			async : false,
			data : {
				date : $("#date").val()
			},
			success : function(obj) {
				
				obj.forEach(function(o, i, u) {
					if(o.gender==="male"){
						male[o.age]=o.age_cnt;
					}else{
						female[o.age]=o.age_cnt;
					}
				});
			}
		});
		console.log(male);
		var ctx = document.getElementById("age");
		var myLineChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "여자", "남자" ],

				datasets : [ {
					label : "0~10",
					backgroundColor : "rgba(2,117,216,1)",
					borderColor : "rgba(2,117,216,1)",
					data : [ male[0], female[0] ],
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						stacked : true,

						time : {
							unit : 'month'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 6
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max : 100,
							maxTicksLimit : 5
						},
						stacked : true,

						gridLines : {
							display : true
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
	});
})