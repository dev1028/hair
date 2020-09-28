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
		initialView : 'resourceTimeGridDay',
		aspectRatio: 2,
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
		   resources: JSON.parse('${emplistjson}'),
		 /*   eventSources : { url : '${pageContext.request.contextPath}/ajax/dailyReservationListAj.do',
			    	extraParams: function() { // a function that returns an object
			    	      return {
			    	    	startDate : getFormatDate(new Date())
			    	        };
			    	        }}, */
			    	        
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
			    nowIndicator: true, //현재 시간 바
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

function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '/' + month + '/' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}
</script>
</head>
<body>
	<div class="container">
	<div class="row" id='calendar'></div>
	</div>
</body>
</html>