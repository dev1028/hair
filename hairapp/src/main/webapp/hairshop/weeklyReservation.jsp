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
			schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	
		  timeZone: 'UTC',
	    initialView: 'resourceTimeGridFourDay',
	    headerToolbar: {
	      left: 'prev,next',
	      center: 'title',
	      right: 'resourceTimeGridDay,resourceTimeGridFourDay'
	    },
	    views: {
	      resourceTimeGridFourDay: {
	        type: 'resourceTimeline',
	        duration: { days: 7 },
	        buttonText: '7 days'
	      }
	    },
	    slotMinTime : '11:00', //미용실 시작시간
		slotMaxTime : '21:00', // 미용실 종료시간
		scrollTime : '10:00', // undo default 6am scrollTime
		locale : 'ko',
		 resources: [	
		      { id: 'a', title: '김강산' },	
		      { id: 'b', title: '김린아'},	
		      { id: 'c', title: '김승연' },	
		      { id: 'd', title: '이송현' },	
		      { id: 'e', title: '이상민' },
		      { id: 'f', title: '김승연' },	
		      { id: 'g', title: '이송현' },	
		      { id: 'h', title: '이상민' }
		    ],
		    nowIndicator: true, //현재 시간 바
		    selectable: true, // 화면 선택가능
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