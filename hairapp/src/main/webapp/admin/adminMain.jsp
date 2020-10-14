<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
	$(function() {

		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';
		var map = new Map();
		var label = [];
		var cnt = [];
		var d = new Date();
		// d.setMonth(d.getMonth()-1);
		for (var i = 0; i < 6; i++) {

			map.set(moment(d).format('YY-MM'), 0);
			d.setMonth(d.getMonth() - 1);

		}
		// Area Chart Example
		var data = $.ajax({
			url : "/hairapp/ajax/admin/analysisByNew.do",
			dataType : "json",
			async : false,

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
		var ctx = document.getElementById("myAreaChart");
		var myLineChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : label,
				datasets : [ {
					label : "신규입접헤어샵",
					lineTension : 0.3,
					backgroundColor : "rgba(2,117,216,0.2)",
					borderColor : "rgba(2,117,216,1)",
					pointRadius : 5,
					pointBackgroundColor : "rgba(2,117,216,1)",
					pointBorderColor : "rgba(255,255,255,0.8)",
					pointHoverRadius : 5,
					pointHoverBackgroundColor : "rgba(2,117,216,1)",
					pointHitRadius : 50,
					pointBorderWidth : 2,
					data : cnt,
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'date'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 7
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max : 50,
							maxTicksLimit : 5
						},
						gridLines : {
							color : "rgba(0, 0, 0, .125)",
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
	})
</script>
<body>	<div class="container">
	<div class="container">
	<div class="card mb-4">

		<div class="card-body">
		<h4>신규 입점 헤어샵 추이 </h4>
			<canvas id="myAreaChart" width="100%" height="30"></canvas>
		</div>

	</div>


	<div class="table-responsive" id="result">
	<h5>헤어샵 입점요청 현황</h5>
		<table class="table table-bordered" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>미용실번호</th>
					<th>헤어샵이름</th>
					<th>인증상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="i">
					<tr>
						<td>${i.hs_no }</td>
						<td>${i.hs_name }</td>
						<td><c:choose>

								<c:when test="${i .hs_approval=='0'}">인증완료
									</c:when>
								<c:when test="${ i.hs_approval=='-1'}">미인증</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	</div>
</body>
</html>