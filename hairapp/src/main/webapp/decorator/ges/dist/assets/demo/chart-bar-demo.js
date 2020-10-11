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
	$("#find").trigger("click");
	$("#find").on(
			"click",
			function() {
				$("#gender").html("");
				console.log($("#date").val());

				for (i = 0; i < 3; i++) {

					(function(x) {
						setTimeout(function() {

							if (x == 0) {
								gender();
							} else if (x == 1) {
								age();
							} else {
								total();
							}

						}, 300 * x);

					})(i);
				}

				function gender() {
					var data = $.ajax({
						url : "/hairapp/ajax/hairshop/analysisGender.do",
						dataType : "json",
						async : false,
						data : {
							date : $("#date").val()
						},
						success : function(obj) {
							obj.forEach(function(o, i, u) {
								male = o.male;
								female = o.female;
							});
						}
					});
					var gctx = document.getElementById("gender");
					var myPieChart = new Chart(gctx, {
						type : 'pie',
						data : {
							labels : [ "여자", "남자" ],
							datasets : [ {
								data : [ male, female ],
								backgroundColor : [ '#007bff', '#dc3545',
										'#ffc107', '#28a745' ],
							} ],
						},
					});
				}

				function total() {
					var label = [];
					var cnt = [];
					var map = new Map();
					var d = new Date($("#date").val());
					// d.setMonth(d.getMonth()-1);
					for (var i = 0; i < 6; i++) {

						map.set(moment(d).format('YY-MM'), 0);
						d.setMonth(d.getMonth() - 1);
					}
					console.log(map);

					var data = $.ajax({
						url : "/hairapp/ajax/hairshop/analysisTotal.do",
						dataType : "json",
						async : false,
						data : {
							date : $("#date").val()
						},
						success : function(obj) {
							console.log(obj);
							obj.forEach(function(o, i, u) {
								map.set(o.date, o.cnt);

							});
						}
					});
					// console.log(total);
					map.forEach(function(value,key){
						label.push(key);
						cnt.push(value);
					})
					
					console.log(cnt);
					console.log(label);
					var tctx = document.getElementById("total");
					var tmyLineChart = new Chart(tctx, {
						type : 'line',
						data : {
							labels : label,

							datasets : [ {
								label : "d",
								backgroundColor : "rgba(2,117,216,1)",
								borderColor : "rgba(2,117,216,1)",
								data : data,
							} ],
						},
						options: {
							responsive: true,
							title: {
								display: true,
								text: 'Chart.js Line Chart'
							},
							tooltips: {
								mode: 'index',
								intersect: false,
							},
							hover: {
								mode: 'nearest',
								intersect: true
							},
							scales: {
								xAxes: [{
									display: true,
									scaleLabel: {
										display: true,
										labelString: 'Month'
									}
								}],
								yAxes: [{
									display: true,
									scaleLabel: {
										display: true,
										labelString: 'Value'
									}
								}]
							}
						}
					});
				}
				function age() {

					amale = [];
					afemale = [];
					for (var i = 0; i < 100; i++) {
						amale[i] = i;
						afemale[i] = i + 9;
					}
					// console.log($("#date").val());

					// Bar Chart Example
					var adata = $.ajax({
						url : "/hairapp/ajax/hairshop/analysisAge.do",
						dataType : "json",
						async : false,
						data : {
							date : $("#date").val()
						},
						success : function(obj) {
							// console.log(obj);
							obj.forEach(function(o, i, u) {
								if (o.gender === "male") {
									amale[o.age] = o.age_cnt;
								} else {
									afemale[o.age] = o.age_cnt;
								}
							});
						}
					});
					// console.log(amale);
					var actx = document.getElementById("age");
					var amyLineChart = new Chart(actx, {
						type : 'bar',
						data : {
							labels : [ "여자", "남자" ],

							datasets : [ {
								label : "0~9",
								backgroundColor : "#f1bdda",
								borderColor : "rgba(2,117,216,1)",
								data : [ amale[0], afemale[0] ],
							}, {
								label : "10~19",
								backgroundColor : "#ddf2f2",
								borderColor : "rgba(2,117,216,1)",
								data : [ amale[10], afemale[10] ],
							}, {
								label : "20~29",
								backgroundColor : "#ffe1e6",
								borderColor : "rgba(2,117,216,1)",
								data : [ amale[20], afemale[20] ],
							}, {
								label : "30~39",
								backgroundColor : "#daecfb",
								borderColor : "rgba(2,117,216,1)",
								data : [ amale[30], afemale[30] ],
							}, {
								label : "40~49",
								backgroundColor : "#fff5de",
								borderColor : "rgba(2,117,216,1)",
								data : [ amale[40], afemale[40] ],
							}, {
								label : "50~59",
								backgroundColor : "#ebe1ff",
								borderColor : "rgba(2,117,216,1)",
								data : [ amale[50], afemale[50] ],
							}, {
								label : "60~69",
								backgroundColor : "#ffecdb",
								borderColor : "rgba(2,117,216,1)",
								data : [ amale[60], afemale[60] ],
							}, {
								label : "70~79",
								backgroundColor : "#f4f5f5",
								borderColor : "rgba(2,117,216,1)",
								data : [ amale[70], afemale[70] ],
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
				}
			});
})
// yAxes : [ {
// ticks : {
// min : 0,
// max : 100,
// callback: function(value){
// return value+"%"
// }
// // maxTicksLimit : 5
// },
