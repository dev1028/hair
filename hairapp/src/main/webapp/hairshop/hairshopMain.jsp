<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어살롱 메인페이지</title>


<script
	src="${pageContext.request.contextPath}/hairshop/hairshopMainChart.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {	
	
	var calendarEl = document.getElementById('calendar');	
	var calendar = new FullCalendar.Calendar(calendarEl, {	
		schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	
		initialView : 'listDay',
	 	businessHours: {
			  // days of week. an array of zero-based day of week integers (0=Sunday)
			  daysOfWeek: JSON.parse('${dayonList}'),//, // Monday - Thursday
			//  expandRows : true,
			  startTime: '${start}', // a start time (10am in this example)
			endTime: '${end}' // an end time (6pm in this example)
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
			    	        	    url: "${pageContext.request.contextPath}/ajax/monthlyReservationListAj.do",
			    	        	    type: "POST",
			    	        	    data: {
			    	        	    	startDate : info.startStr,
			    	        	    	endDate : info.endStr
			    	        	    },
			    	        	    dataType: "json",
			    	        	    success: function (res) {
			    	        	    	successCallback(res);
										var i2 = 0;
										var i3 = 0;
										var i4 = 0;
										for(var i=0; i<res.length; i++){
											if(res[i].borderColor =="#5cb85c"){
												i2++;
											} else if(res[i].borderColor =="#5bc0de"){
												i3++;
											} else if(res[i].borderColor =="#6c757d"){
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
			    	   
			   
			    eventClick: function(info) {
		    		window.open("${pageContext.request.contextPath}/ajax/memberReservationInfo.do?mdrNo="+info.event.id, "pop",
					"width=700,height=750, scrollbars=yes, resizable=yes");
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
					일간 스케줄 <br>
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
			<div class="col-6">
				<div id='calendar'></div>
			</div>
			<div class="col-6">
			<div class="container-fluid">
				<div id="str"></div>
				<div id="chart_div" style="width: 500px; height: 300px;"></div>
				
			</div>
		</div>
	</div>
</body>
</html>