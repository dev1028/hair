<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css" rel='stylesheet'/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/locales-all.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {	
	var calendarEl = document.getElementById('calendar');	
	var calendar = new FullCalendar.Calendar(calendarEl, {	
		schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	
		initialView : 'resourceTimeGridDay',
		businessHours: {
			  // days of week. an array of zero-based day of week integers (0=Sunday)
			  daysOfWeek: [ 0, 6, 3, 4 ], // Monday - Thursday
			  expandRows : true,
			  startTime: '10:00', // a start time (10am in this example)
			  endTime: '18:00', // an end time (6pm in this example)
			},
			slotMinTime : '11:00',
			slotMaxTime : '21:00',
			scrollTime : '10:00', // undo default 6am scrollTime
			locale : 'ko',
		   resources: '${emplistjson}',
			    events : '${events}',
	
			    nowIndicator: true, //현재 시간 바
			    selectable: true, // 화면 선택가능
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
			                  /* allDay: true */
			                });
			                alert('Great. Now, update your database...');
			              } else {
			                alert('Invalid date.');
			              }
			            }
			          }
			        }
	});	
	calendar.render();	
}); 
</script>
</head>
<body>

	<div id='calendar'></div>
</body>
</html>