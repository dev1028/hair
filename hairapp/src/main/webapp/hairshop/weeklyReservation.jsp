
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
									resourceAreaWidth : "10%",
									slotMinWidth : 85,
									resourceAreaColumns : [ {
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
														var i2 = 0;
														var i3 = 0;
														var i4 = 0;
														for (var i = 0; i < res.length; i++) {
															if (res[i].borderColor == "#5cb85c") {
																i2++;
															} else if (res[i].borderColor == "#5bc0de") {
																i3++;
															} else if (res[i].borderColor == "#6c757d") {
																i4++;
															}
														}

														var countDailyAll = 0;
														if (res.length == 0) {
															countDailyAll = 0;
															$("#countDailyAll")
																	.removeClass();
															$("#countDailyAll")
																	.addClass(
																			"badge badge-light");
														} else {
															countDailyAll = res.length;
															$("#countDailyAll")
																	.removeClass();
															$("#countDailyAll")
																	.addClass(
																			"badge badge-danger");
														}
														$("#countDailyAll")
																.text(
																		countDailyAll);

														if (i2 == 0) {
															$("#countDailyi2")
																	.removeClass();
															$("#countDailyi2")
																	.addClass(
																			"badge badge-light");
														} else {
															$("#countDailyi2")
																	.removeClass();
															$("#countDailyi2")
																	.addClass(
																			"badge badge-success");
														}
														$("#countDailyi2")
																.text(i2);
														if (i3 == 0) {
															$("#countDailyi3")
																	.removeClass();
															$("#countDailyi3")
																	.addClass(
																			"badge badge-light");
														} else {
															$("#countDailyi3")
																	.removeClass();
															$("#countDailyi3")
																	.addClass(
																			"badge badge-info");
														}
														$("#countDailyi3")
																.text(i3);
														if (i4 == 0) {
															$("#countDailyi4")
																	.removeClass();
															$("#countDailyi4")
																	.addClass(
																			"badge badge-light");
														} else {
															$("#countDailyi4")
																	.removeClass();
															$("#countDailyi4")
																	.addClass(
																			"badge badge-secondary");
														}
														$("#countDailyi4")
																.text(i4);
													}
												});

									},
									eventClick : function(info) {
										window
												.open(
														"${pageContext.request.contextPath}/ajax/memberReservationInfo.do?mdrNo="
																+ info.event.id,
														"pop",
														"width=700,height=750, scrollbars=yes, resizable=yes");
									},

								});

						calendar.render();
					});
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
					주간 스케줄 <br>
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
			<div class="col" id='calendar'></div>
		</div>
	</div>
</body>
</html>