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
								//gender();
							} else if (x == 1) {
								//age();
							} else {
								//total();
								treatRankMale();
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
				function treatRankMale() {
					var male = new Map();
					var female = new Map();
					amale = [];
					afemale = [];
					for (var i = 0; i < 100; i++) {
						amale[i] = i;
						afemale[i] = i + 9;
					}
					// console.log($("#date").val());

					// Bar Chart Example
					var adata = $.ajax({
						url : "/hairapp/ajax/hairshop/analysisTreatGender.do",
						dataType : "json",
						async : false,
						data : {
							date : $("#date").val()
						},
						success : function(obj) {
							// console.log(obj);
							obj.forEach(function(o, i, u) {

								if (o.gender === "male") {
									
									male.set( o.rank,o.cnt);
//									male.set("cnt", o.cnt);
//									male.set("hhi_name", o.hhi_name);
								} else {
									female.set(o.rank,o.cnt+o.hhi_name);
//									female.set("cnt", o.cnt);
//									female.set("hhi_name", o.hhi_name);
//									afemale[o.age] = o.age_cnt;
								}
							});
						}
					});
					// console.log(amale);
					var actx = document.getElementById("rank");
					var amyLineChart = new Chart(actx, {
						type : 'bar',
						data : {
							labels : [ "1","2","3","4","5" ],

							datasets : [ {
								label : "남자",
								backgroundColor : "#f1bdda",
								borderColor : "rgba(2,117,216,1)",
								data : [ male.get("1"),male.get("2"),male.get("3"),male.get("4"),male.get("5"),],
							}, {
								label : "2",
								backgroundColor : "#daecfb",
								borderColor : "rgba(2,117,216,1)",
								data : [ 1,2 ,9,8,7],
							} ],
						},
						options : {
							scales : {
								xAxes : [ {
//									stacked : true,

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
//									stacked : true,

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
