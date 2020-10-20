<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 메인페이지</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>
document
.addEventListener(
		'DOMContentLoaded',
		function() {

			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawStuff);
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(
					calendarEl,
					{
						schedulerLicenseKey : 'CC-Attribution-NonCommercial-NoDerivatives',
						initialView : 'timeGridDay',
						handleWindowResize : false,
						expandRows : true,
						businessHours : {
							daysOfWeek : '${desDayoff.daysOfWeek}', //이것도 디자이너꺼
							startTime : '${desDayoff.startTime}', //이건 자기꺼
							endTime : '${desDayoff.endTime}'
						},
						slotMinTime : '${start}', // 이건 미용실실꺼
						slotMaxTime : '${end}',
						scrollTime : '${start}',
						locale : 'ko',

						events : function(info, successCallback,
								failureCallback) {

							$.ajax({
										url : "${pageContext.request.contextPath}/ajax/desDailyReservationListAj.do",
										type : "POST",
										data : {
											startDate : info.startStr,
											endDate : info.endStr
										},
										dataType : "json",
										success : function(res) {
											successCallback(res);
											var i2 = 0;
											var i3 = 0;
											var i4 = 0;
											for(var i=0; i<res.length; i++){
												if(res[i].backgroundColor =="#5cb85c"){
													i2++;
												} else if(res[i].backgroundColor =="#5bc0de"){
													i3++;
												} else if(res[i].backgroundColor =="#6c757d"){
													i4++;
												}
											}
											
											var countDailyAll = 0;
											if (res.length == 0) {
												countDailyAll = 0;
												$("#countDailyAll").removeClass();
												$("#countDailyAll").addClass("badge badge-light");
											} else {
												countDailyAll = res.length;
												$("#countDailyAll").removeClass();
												$("#countDailyAll").addClass("badge badge-danger");
											}
											$("#countDailyAll").text(countDailyAll);
											
											if (i2 == 0) {
												$("#countDailyi2").removeClass();
												$("#countDailyi2").addClass("badge badge-light");
											} else {
												$("#countDailyi2").removeClass();
												$("#countDailyi2").addClass("badge badge-success");
											}
											$("#countDailyi2").text(i2);
											if (i3 == 0) {
												$("#countDailyi3").removeClass();
												$("#countDailyi3").addClass("badge badge-light");
											} else {
												$("#countDailyi3").removeClass();
												$("#countDailyi3").addClass("badge badge-info");
											}
											$("#countDailyi3").text(i3);
											if (i4 == 0) {
												$("#countDailyi4").removeClass();
												$("#countDailyi4").addClass("badge badge-light");
											} else {
												$("#countDailyi4").removeClass();
												$("#countDailyi4").addClass("badge badge-secondary");
											}
											$("#countDailyi4").text(i4);
										}
									});

						},

						eventClick : function(info) {
							window
									.open(
											"${pageContext.request.contextPath}/ajax/desMemberReservationInfo.do?mdrNo="
													+ info.event.id,
											"pop",
											"width=700,height=750, scrollbars=yes, resizable=yes");
						},
						nowIndicator : true, //현재 시간 바
					/* selectable: true, // 화면 선택가능
					select: function(info) {
						calendar.addEvent({
							resourceId : info.resource.id,
					          title: '이발',
					          start: info.startStr,
					          end: info.endStr
					        });
					    alert('selected ' + info.startStr + ' to ' + info.endStr);
					  },
					  headerToolbar: {
					      center: 'addEventButton'
					    },
					    customButtons: {
					      addEventButton: {
					        text: 'add event...',
					        click: function() {
					          var dateStr = prompt('Enter a date in YYYY-MM-DDT00:00 format');
					          var date = new Date(dateStr + ':00'); // will be in local time
					          dateS1tr = prompt('Enter a date in YYYY-MM-DDT00:00 format');
								var enddate = new Date(dateS1tr + ':00');
					          if (!isNaN(date.valueOf())) { // valid?
					            calendar.addEvent({
					            	resourceId : 'b',
					              title: 'dynamic event',
					              start: date,
					              end: enddate
					             // allDay: true 
					            });
					            alert('Great. Now, update your database...');
					          } else {
					            alert('Invalid date.');
					          }
					        }
					      }
					    } */
					});
		calendar.render();

		});

function getFormatDate(date) {
var year = date.getFullYear(); //yyyy
var month = (1 + date.getMonth()); //M
month = month >= 10 ? month : '0' + month; //month 두자리로 저장
var day = date.getDate(); //d
day = day >= 10 ? day : '0' + day; //day 두자리로 저장
return year + '/' + month + '/' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}



function drawStuff() {
	

	var today = new Map();
	var yesterday = new Map();
	var tomorrow = new Map();

	today.set("rsv", 0);
	today.set("sales", 0);
	yesterday.set("rsv", 0);
	yesterday.set("sales", 0);
	tomorrow.set("rsv", 0);
	tomorrow.set("sales", 0);


	var datatable = [];
	$.ajax({
		async : false,
		url : "/hairapp/ajax/designer/designerChart.do",
		dataType : "json",
		success : function(datas) {

			console.log(datas);
			for (var i = 0; i < datas.length; i++) {

				if (datas[i].date === '오늘') {
					today.set("rsv", parseInt(datas[i].rsv));
					today.set("sales", parseInt(datas[i].sales));
				} else if (datas[i].date === '내일') {
					tomorrow.set("rsv", parseInt(datas[i].rsv));
					tomorrow.set("sales", parseInt(datas[i].sales));
				} else if (datas[i].date === '어제') {
					yesterday.set("rsv", parseInt(datas[i].rsv));
					yesterday.set("sales", parseInt(datas[i].sales));
				}
			}
		}

	});

	var data = google.visualization.arrayToDataTable([
			[ 'day', '매출', '예약자수' ],
			[ '어제', yesterday.get("sales"), yesterday.get("rsv") ],
			[ '오늘', today.get("sales"), yesterday.get("rsv") ],
			[ '내일', tomorrow.get("sales"), tomorrow.get("rsv") ] ]);

	data.addRows(datatable);
	// Set chart options
	var options = {
			//height: 800,
		title : '',
		vAxis : {
			0: {format: 'currency'},
			1: {}
			},
		hAxis : {
			
		},
		//seriesType : 'bars',
		series : {
			0:{ type: "bars", targetAxisIndex: 0 },
               1: { type: "line", targetAxisIndex: 1}
		}
	};

	var chart = new google.visualization.ComboChart(document
			.getElementById('chart_div'));
	chart.draw(data, options);

}




</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<br>
			<br>
			<br>
		</div>
			
		<div class="row">
			<div class="col">
				<h3>
					일간 스케줄
					<button type="button" class="btn btn-outline-primary btn-sm"
						disabled>
						총 현황 <span class="badge badge-light" id="countDailyAll"></span>
					</button>
					<button type="button" class="btn btn-outline-primary btn-sm"
						disabled>
						예약인원 <span class="badge badge-light" id="countDailyi2"></span>
					</button>
					<button type="button" class="btn btn-outline-primary btn-sm"
						disabled>
						시술중 <span class="badge badge-light" id="countDailyi3"></span>
					</button>
					<button type="button" class="btn btn-outline-primary btn-sm"
						disabled>
						시술완료 <span class="badge badge-light" id="countDailyi4"></span>
					</button>
				</h3>
				<hr>
			</div>
		</div>
	

		</div>
		<div class="row">
			<div class="col-8">
				<div id='calendar'></div>
			</div>
			<div class="col-4">
				<div id="chart_div"
		style="width: 500px; height: 600px; margin-left: auto; margin-right: auto;"></div>

			</div>
		</div>
</body>
</html>