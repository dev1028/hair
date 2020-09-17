document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
			themeSystem : 'bootstrap',
			initialView : 'resourceTimeGridDay',
			   resources: [
				      { id: 'a', title: '김강산' },
				      { id: 'b', title: '김린아'},
				      { id: 'c', title: '김승연' },
				      { id: 'd', title: '이송현' },
				      { id: 'e', title: '이상민' }
				    ],
				    titleFormat: {
				        month: 'numeric',
				        year: 'numeric',
				        day: 'numeric',
				        weekday: 'short'
				      },
				      buttonText: {
				    	  today:    '오늘',
				    	  month:    'month',
				    	  week:     'week',
				    	  day:      'day',
				    	  list:     'list'
				    	},
				    	buttonIcons: {
				    		prev: 'left-single-arrow',
				    		  next: 'right-single-arrow',
				    		  prevYear: 'left-double-arrow',
				    		  nextYear: 'right-double-arrow'
				    	},
				    	headerToolbar:{
				    		start: 'title', // will normally be on the left. if RTL, will be on the right
				    		  center: '',
				    		  end: 'today prev,next' // will normally be on the right. if RTL, will be on the left
				    	}
				     
		});
		calendar.render();
	});