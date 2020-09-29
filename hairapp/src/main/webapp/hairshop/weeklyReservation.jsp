		<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주간예약</title>

<script>
document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
			schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	
		  //timeZone: 'UTC',
		  aspectRatio: 2,
	    initialView: 'resourceTimeGridFourDay',
	   /*  headerToolbar: {
	      left: 'prev,next',
	      center: 'title',
	      right: 'resourceTimeGridDay,resourceTimeGridFourDay'
	    }, */
	    views: {
	      resourceTimeGridFourDay: {
	        type: 'resourceTimeline',
	        duration: { days: 7 },
	        buttonText: '7 days'
	      }
	    },
	    businessHours: {
			  // days of week. an array of zero-based day of week integers (0=Sunday)
			  daysOfWeek: JSON.parse('${dayonList}'),//, // Monday - Thursday
			//  expandRows : true,
			  startTime: '${start}', // a start time (10am in this example)
			endTime: '${end}', // an end time (6pm in this example)
			},
			slotMinTime :  '${start}',
			slotMaxTime :  '${end}',
			scrollTime :  '${start}', // undo default 6am scrollTime
			locale : 'ko',
			resourceAreaColumns: [
			    {
			      field: 'id',
			      headerContent: 'id'
			    },
			    {
			      field: 'title',
			      headerContent: 'Name'
			    }
			  ],
			
		   resources: JSON.parse('${emplistjson}'),
		    nowIndicator: true, //현재 시간 바
		    selectable: true, // 화면 선택가능
		    events: function(info, successCallback, failureCallback) {
 	           
  	          
	        	$.ajax({
	        	    url: "${pageContext.request.contextPath}/ajax/dailyReservationListAj.do",
	        	    type: "POST",
	        	    data: {
	        	    	startDate : info.startStr,
	        	    	endDate : info.endStr
	        	    },
	        	    dataType: "json",
	        	    success: function (res) {
	        	    	successCallback(res);
	        	    }
	        	  });
	        	
	        },
	        eventClick: function(info) {
	    		window.open("${pageContext.request.contextPath}/ajax/memberReservationInfo.do?mdrNo="+info.event.id, "pop",
				"width=700,height=500, scrollbars=yes, resizable=yes");
	      },
		
	  });

	  calendar.render();
	});
</script>
</head>
<body>
	<div class="container">
	<div class="row"><br><br><br></div>
	<div class="row" id='calendar'></div>
	</div>
</body>
</html>