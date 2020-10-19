<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>월별 결산</title>
<link
	href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/decorator/ges/dist/js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
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
		$("#find").on("click", start());
		function start() {

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
					labels : [ "남자", "여자" ],
					datasets : [ {
						data : [ male, female ],
						backgroundColor : [ '#57A9BD', '#E29A35', '#ffc107',
								'#28a745' ],
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
			map.forEach(function(value, key) {
				label.unshift(key);
				cnt.unshift(value);
			})

			console.log(cnt);
			console.log(label);
			var tctx = document.getElementById("total");
			var tmyLineChart = new Chart(tctx, {
				type : 'line',
				data : {
					labels : label,

					datasets : [ {
						label : "월 예약수 합산",
						borderColor	 : "rgb(241, 209, 219)",
						backgroundColor : "#E5DBF7",
						data : cnt,
					} ],
				},
				options : {
					responsive : true,
					title : {
						display : true,
						text : '최근 6개월 예약자수 추이'
					}
				},
				tooltips : {
					mode : 'index',
					intersect : false,
				},
				hover : {
					mode : 'nearest',
					intersect : true
				},
				scales : {
					xAxes : [ {
						display : true,
						scaleLabel : {
							display : false,
							labelString : 'Month'
						}
					} ],
					yAxes : [ {
						display : true,
						scaleLabel : {
							display : false,
							labelString : 'Value'
						}
					} ]
				}
			})
		}

		function age() {

			amale = [];
			afemale = [];
			for (var i = 0; i < 100; i++) {
				amale[i] = 0;
				afemale[i] = 0;
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
					labels : [ "남자", "여자" ],

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
</script>
</head>
<body class="sb-nav-fixed">
	<br><br><br>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">월별결산</h1>
				<input type="month" id="date" value="2020-10">
				<input type="month" id="date" value="2020-09">
				<button id="find">조회</button>







				<!-- 
                        
                        고객분석	성별, 연령대별, 전월대비 접객수, 우리지역 헤어샵 인기순위,방문수추, 
                        시술분석 인기헤어 성별별 인기, 연령대별 기장별 인기순위, 시술별 평
                        매출분석 매출추이, ㅏ시술별 매출, 디자이너별 매출, 
                        고객만족도 고객 재방문율,리뷰개수 추이, 평점추이,  
                        디자이너 분석 매출순위, 접객순위, 리뷰개수, 평점, 재예약
                        -->

				<div class="col-lg-6">
					<div class="card mb-4">


						<canvas id="total" width="100%" height="50"></canvas>


					</div>
				</div>

				<div class="row">

					<div class="col-lg-6">
						<div class="card mb-4">
							예약고객 성별비율
							<div class="card-body">
								<canvas id="gender" width="100%" height="50"></canvas>
							</div>
							<!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
						</div>
					</div>



					<div class="col-lg-6">
						<div class="card mb-4">
							연령대별 예약고객분석
							<div class="card-body">
								<canvas id="age" width="100%" height="50"></canvas>
							</div>

						</div>
					</div>


				</div>
			</div>
		</main>

	</div>
	</div>


</body>
</html>
