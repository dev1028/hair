$(function() {

	$("#start").attr('value', '');
	var date = new Date();
	endDate(date);

	$(".dateBtn").on("click", function() {
		if ($(this).is("#today") === true) {
			today();
		} else if ($(this).is("#three") === true) {
			three();
		} else if ($(this).is("#seven") === true) {
			week();
		} else if ($(this).is("#month") === true) {
			mon();
		} else {
			$("#start").attr('value', '');
			var date = new Date();
			endDate(date);

		}
	})

	function startDate(d) {
		$("#start").attr('value', moment(d).format('YYYY-MM-DD'));
	}
	function endDate(d) {
		$("#end").attr('value', moment(d).format('YYYY-MM-DD'));
	}
	function today() {
		var d = new Date();

		startDate(d);
		endDate(d);
		console.log(d);

	}
	function three() {
		var d = new Date();
		endDate(d);
		d.setDate(d.getDate() - 3);
		startDate(d);
		console.log(d);

	}
	function week() {
		var d = new Date();
		endDate(d);
		startDate(d.setDate(d.getDate() - 7));
		console.log(d);

	}

	function mon() {
		var d = new Date();
		endDate(d);

		startDate(d.setMonth(d.getMonth() - 1));
		console.log(d);

	}

})
