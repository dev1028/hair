<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css" rel='stylesheet'/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/locales-all.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {	
	var calendarEl = document.getElementById('calendar');	
	var calendar = new FullCalendar.Calendar(calendarEl, {	
	
		
		initialView : 'resourceTimeGridDay',
		businessHours: {s
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
			
		   resources: [	
			      { id: 'a', title: '김강산' },	
			      { id: 'b', title: '김린아'},	
			      { id: 'c', title: '김승연' },	
			      { id: 'd', title: '이송현' },	
			      { id: 'e', title: '이상민' }	
			    ],

			    eventClick: function(info) {
			    		window.open("../popup/jusolatlongPopup.jsp", "pop",
						"width=570,height=420, scrollbars=yes, resizable=yes");
			      },
			    nowIndicator: true, //현재 시간 바
			    selectable: true, // 화면 선택가능
			    select: function(info) { //화면드래그로 이벤트 발생
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
			            text: '비회원예약등록',
			            click: function() {
			            	window.open("../popup/jusolatlongPopup.jsp", "pop",
							"width=570,height=420, scrollbars=yes, resizable=yes");
			            	$("#staticBackdrop").modal('toggle');
			            	
			             /*  var dateStr = prompt('Enter a date in YYYY-MM-DDT00:00 format');
			              var date = new Date(dateStr + ':00'); // will be in local time
			              dateS1tr = prompt('Enter a date in YYYY-MM-DDT00:00 format');
							var enddate = new Date(dateS1tr + ':00');
			              if (!isNaN(date.valueOf())) { // valid?
			                calendar.addEvent({
			                	resourceId : 'b',
			                  title: 'dynamic event',
			                  start: date,
			                  end: enddate
			                   allDay: true 
			                });
			                alert('Great. Now, update your database...');
			              } else {
			                alert('Invalid date.');
			              } */
			            }
			          }
			        },
			        events : [ {
						id : '1',
						resourceId : 'b',
						start : '2020-09-20 11:00:00',
						end : '2020-09-20 11:30:00',
						title :'김폴리 염색 ee'
					}, {
						id : '2',
						resourceId : 'c',
						start : '2020-09-20 11:00:00',
						end : '2020-09-20 11:30:00',
						title :' 염색 ee'
					}, {
						id : '3',
						resourceId : 'd',
						start : '2020-09-20 11:00:00',
						end : '2020-09-20 11:30:00',
						title :' 염색 ee'
					}, {
						id : '4',
						resourceId : 'e',
						start : '2020-09-26 11:00:00',
						end : '2020-09-26 11:30:00',
						title :' 염색 eee'
					}, {
						id : '5',
						resourceId : 'd',
						start : '2020-09-26 11:00:00',
						end : '2020-09-26 11:30:00',
						title :' 염색 '
					}, {		
						id : '6',
						resourceId : 'a',
						start : '2020-09-26 11:00:00',
						end : '2020-09-26 11:30:00',
						title :' 염색ddd ',
						eventColor: '#378006'
			    	},
			    	{		
			    		id: '7',
			    		resourceId : 'c',
			    	      start : '2020-09-26 14:30:00',
			    	      end : '2020-09-26 15:30:00',
			    	      title : '하하',
			    	      borderColor: 'red',
			    	      backgroundColor: 'red'
			    	} ]
				

	});	
	calendar.render();	
}); 
</script>
</head>
<body>
	<div class="container">
	<div class="row" id='calendar'></div>
	</div>
	
</body>
</html>