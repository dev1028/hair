<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주간예약현황</title>
<script>

document.addEventListener('DOMContentLoaded', function() {	
	
	var calendarEl = document.getElementById('calendar');	
	var calendar = new FullCalendar.Calendar(calendarEl, {	
		schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	
		initialView : 'timeGridWeek',
		aspectRatio: 2,
	 	businessHours: {
			  daysOfWeek: '${desDayoff.daysOfWeek}', //이것도 디자이너꺼
			  startTime: '${desDayoff.startTime}', //이건 자기꺼
			endTime: '${desDayoff.endTime}' }, 
			slotMinTime :  '${start}', // 이건 미용실실꺼
			slotMaxTime :  '${end}',
			scrollTime :  '${start}', 
			locale : 'ko',

   	        events: function(info, successCallback, failureCallback) {
   	           
   	          
   	        	$.ajax({
   	        	    url: "${pageContext.request.contextPath}/ajax/desDailyReservationListAj.do",
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
	<div class="row"><br><br><br></div>
	<div class="row" id='calendar'></div>
	</div>
</body>
</html>