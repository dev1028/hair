var toggleBool;
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

	$(".asc").on("click", function() {
		console.log($(this).parent('th').index())
		toggleBool = false;
		gwanshic($("tbody"), $(this).parent('th').index())

	})
	$(".des").on("click", function() {
		console.log($(this).parent('th').index())
		toggleBool = true;
		gwanshic($("tbody"), $(this).parent('th').index())
	})

	$("#all").on("click", function() {

		var check = $("#all").prop("checked");
		$("input[class=chk]").prop("checked", check);
	})
	$(document).on(
			"click",
			"#excel",
			function() {

				var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
				var table_html = encodeURIComponent(document
						.getElementById('table').outerHTML);

				var a = document.createElement('a');
				a.href = data_type + ',%EF%BB%BF' + table_html;
				a.download = 'test' + '_excel' + '.xls';
				a.click();

			})

});
var index; // cell index

function gwanshic(tbody, index) {
	console.log(tbody.length);

	this.index = index;

	console.log(index);

	var datas = new Array();

	var tbodyLength = tbody.children().length;
	console.log(tbodyLength);
	for (var i = 0; i < tbodyLength; i++) {

		datas[i] = tbody.children().eq(i);

	}

	// sort by cell[index]

	datas.sort(compareCells);

	for (var i = 0; i < tbody.children().length; i++) {

		// rearrange table rows by sorted rows

		$("tbody").append(datas[i]);

	}

}

function compareCells(a, b) {

	var aVal = a.children().eq(index).text();

	var bVal = b.children().eq(index).text();

	console.log(a);

	aVal = aVal.replace(/\,/g, '');

	bVal = bVal.replace(/\,/g, '');

	if (toggleBool) {

		var temp = aVal;

		aVal = bVal;

		bVal = temp;

	}

	if (aVal.match(/^[0-9]+$/) && bVal.match(/^[0-9]+$/)) {

		return parseFloat(aVal) - parseFloat(bVal);

	}

	else {

		if (aVal < bVal) {

			return -1;

		} else if (aVal > bVal) {

			return 1;

		} else {

			return 0;

		}

	}
}
