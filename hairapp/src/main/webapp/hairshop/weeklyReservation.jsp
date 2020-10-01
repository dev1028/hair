
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주간예약</title>

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
									//timeZone: 'UTC',
									contentHeight : 700,
									expandRows : true,
									initialView : 'resourceTimeGridFourDay',
									/*  headerToolbar: {
									   left: 'prev,next',
									   center: 'title',
									   right: 'resourceTimeGridDay,resourceTimeGridFourDay'
									 }, */
									views : {
										resourceTimeGridFourDay : {
											type : 'resourceTimeline',
											duration : {
												days : 7
											},
											buttonText : '7 days'
										}
									},
									businessHours : {
										// days of week. an array of zero-based day of week integers (0=Sunday)
										daysOfWeek : JSON.parse('${dayonList}'),//, // Monday - Thursday
										//  expandRows : true,
										startTime : '${start}', // a start time (10am in this example)
										endTime : '${end}', // an end time (6pm in this example)
									},
									slotMinTime : '${start}',
									slotMaxTime : '${end}',
									scrollTime : '${start}', // undo default 6am scrollTime
									locale : 'ko',
									resourceAreaWidth : "15%",
									slotMinWidth : 85,
									resourceAreaColumns : [
									   {
									    field: 'position',
									    headerContent: '직급'
									  }, 
									{
										field : 'title',
										headerContent : '이름'
									} ],

									resources : JSON.parse('${emplistjson}'),
									nowIndicator : true, //현재 시간 바
									selectable : true, // 화면 선택가능
									events : function(info, successCallback,
											failureCallback) {

										$
												.ajax({
													url : "${pageContext.request.contextPath}/ajax/dailyReservationListAj.do",
													type : "POST",
													data : {
														startDate : info.startStr,
														endDate : info.endStr
													},
													dataType : "json",
													success : function(res) {
														successCallback(res);
														var countWeeklyEvent = 0;
														if (res.length == 0) {
															countWeeklyEvent = 0;
															$(
																	"#countWeeklyEvent")
																	.removeClass();
															$(
																	"#countWeeklyEvent")
																	.addClass(
																			"badge badge-light");
														} else {
															countWeeklyEvent = res.length;
															$(
																	"#countWeeklyEvent")
																	.removeClass();
															$(
																	"#countWeeklyEvent")
																	.addClass(
																			"badge badge-danger");
														}
														$("#countWeeklyEvent")
																.text(
																		countWeeklyEvent);
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

								});

						calendar.render();
					});
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
					주간예약명단
					<button type="button" class="btn btn-outline-primary btn-sm"
						disabled>
						예약인원 <span class="badge badge-light" id="countWeeklyEvent"></span>
					</button>
				</h3>
				<hr>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col" id='calendar'></div>
	</div>
	</div>
</body>
</html>