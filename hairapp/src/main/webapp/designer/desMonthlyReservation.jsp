<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월간예약현황</title>
<style>
.vi {
	dborder-left: 1px solid gray;
}
</style>
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {

					
						var calendarEl = document.getElementById('calendar');
						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{
									schedulerLicenseKey : 'CC-Attribution-NonCommercial-NoDerivatives',
									initialView : 'dayGridMonth',
									/* headerToolbar : {
										start : '',
										end : 'title' // will normally be on the right. if RTL, will be on the left
									}, */
									businessHours : {
										daysOfWeek : '${desDayoff.daysOfWeek}', //이것도 디자이너꺼
										startTime : '${desDayoff.startTime}', //이건 자기꺼
										endTime : '${desDayoff.endTime}'
									},
									slotMinTime : '${start}', // 이건 미용실실꺼
									slotMaxTime : '${end}',
									scrollTime : '${start}',
									locale : 'ko',
									 expandRows : true,
									events : function(info, successCallback,
											failureCallback) {

										$
												.ajax({
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
														"${pageContext.request.contextPath}/ajax/memberReservationInfo.do?mdrNo="
																+ info.event.id,
														"pop",
														"width=700,height=500, scrollbars=yes, resizable=yes");
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
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<br> <br> <br>
		</div>
		<div class="row">
			<div class="col">

				<h3>
					월간 스케줄
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
		<div class="row">

			<div class="col-lg" id='calendar'></div>
			
		</div>
	</div>
</body>
</html>