$(function() {
	$("button").attr('class','btn btn-secondary btn-sm');
	$("input").attr('class','btn btn-secondary btn-sm');
	
	period();
	$("#all").on("click", function() {

		var check = $("#all").prop("checked");
		$("input[type=checkbox]").prop("checked", check);
	})
	$(document).on(
			"click",
			"#excel",
			function() {

				var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
				var table_html = encodeURIComponent(document
						.getElementById('test').outerHTML);

				var a = document.createElement('a');
				a.href = data_type + ',%EF%BB%BF' + table_html;
				a.download = 'test' + '_excel' + '.xls';
				a.click();

			})
	$(document).on("click", '#submit', function() {
		var ds = [];
		$("input[name='designer_name']:checked").each(function() {
			ds.push($(this).val());
		});
		$("#result").html("");
		for (i = 0; i < ds.length; i++) {

			(function(x) {
				setTimeout(function() {

					ds_no = ds[x];
					console.log(ds_no);
					if ($("#range").is(".yearResult") === true) {

						yearResult();

					} else if ($("#range").is(".quarter") === true) {
						quarterResult();
					} else if ($("#range").is(".month") === true) {
						monthResult();

					} else if ($("#range").is(".period") === true) {
						periodResult();

					}

				}, 100 * x);

			})(i);
		}

	});
	$(document).on("click", '.search', function() {

		console.log($(this).attr('id'));

		if ($(this).is("#year") === true) {
			year();
		} else if ($(this).is("#period") === true) {
			period();
		} else if ($(this).is("#quarter") === true) {
			quarter();
		} else if ($(this).is("#month") === true) {
			month();
		}
	});

	function yearResult() {
		var start = new Date($("#selectYear option:selected").val(), 0);
		var end = new Date($("#selectYear option:selected").val(), 11, 31);

		result(start, end);
	}
	function quarterResult() {
		var start = new Date($("#selectYear option:selected").val(), $(
				"#selectQuarter option:selected").val(), 1);
		var end = new Date(start.getFullYear(), start.getMonth() + 3, 1);
		console.log(start, end);
		result(start, end);
	}
	function monthResult() {
		var start = new Date($("#selectYear option:selected").val(), $(
				"#selectMonth option:selected").val(), 1);
		var end = new Date(start.getFullYear(), start.getMonth() + 1, 0);
		console.log(start, end);
		result(start, end);
	}
	function periodResult() {
		var start = $("#start").val();
		var end = $("#end").val();
		result(start, end);
	}

	function period() {
		$("#range").html("");
		$("#range").attr('class', 'period');
		$("#range")
				.append(
						$("<input />").attr({
							'type' : 'date',
							'name' : 'start',
							'id' : 'start'
						}),
						$("<span />").html(' - '),
						$("<input />").attr({
							'type' : 'date',
							'name' : 'end',
							'id' : 'end'
						}),
						$("<input />").attr('type', 'button').val("당일").click(
								today),
						$("<input />").attr('type', 'button').val("어제 ").click(
								yester),
						$("<input />").attr('type', 'button').val("최근 1주 ")
								.click(week),
						$("<input />").attr('type', 'button').val("최근 1달 ")
								.click(mon)

				);
	}
	function year() {
		$("#range").attr('class', 'yearResult');
		$("#range").html("");
		select = $("<select/>").attr('id', 'selectYear');
		for (var i = 2020; i > 2000; i--) {

			select.append($("<option />").val(i).text(i + "년"));

		}
		$("#range").append(select);

	}
	function quarter() {
		$("#range").attr('class', 'quarter');
		$("#range").html("");
		year = $("<select/>").attr('id', 'selectYear');
		for (var i = 2020; i > 2000; i--) {

			year.append($("<option />").text(i + "년").val(i));

		}
		$("#range").append(year);
		quarter = $("<select/>").attr('id', 'selectQuarter');

		quarter.append($("<option />").text("1/4 분기").val(0));
		quarter.append($("<option />").text("2/4 분기").val(3));
		quarter.append($("<option />").text("3/4 분기").val(6));
		quarter.append($("<option />").text("4/4 분기").val(9));
		$("#range").append(quarter);

	}
	function month() {
		$("#range").attr('class', 'month');
		$("#range").html("");
		year = $("<select/>").attr('id', 'selectYear');
		;
		for (var i = 2020; i > 2000; i--) {

			year.append($("<option />").text(i + " 년").val(i));
		}
		$("#range").append(year);
		month = $("<select/>").attr('id', 'selectMonth');
		;
		for (var i = 0; i < 12; i++) {

			month.append($("<option />").text(i + 1 + " 월").val(i));
		}
		$("#range").append(month);
	}
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
	function yester() {
		var d = new Date();
		d.setDate(d.getDate() - 1);
		startDate(d);
		endDate(d);
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

	function result(start, end) {
		dsNm = "";

		var url = "/hairapp/ajax/hairshop/salesByDesigner.do"
		var table = $("<table />").attr({
			'border' : '1',
			'id' : 'test',
			'class' : 'table table-bordered table-hover table-sm text-center'
		});
		var tr = $("<tr />");
		tr.append($("<th>").text("시술날짜 "));
		tr.append($("<th>").text("예약번호 "));
		tr.append($("<th>").text("고객명  "));
		tr.append($("<th>").text("디자이너  "));
		tr.append($("<th>").text("시술명 "));
		tr.append($("<th>").text("카드  "));
		tr.append($("<th>").text("현금  "));
		tr.append($("<th>").text("카카오  "));
		tr.append($("<th>").text("계좌  "));
		tr.append($("<th>").text("총합  "));

		table.append(tr);
		// console.log(ds);
		$.ajax({
			url : url,
			dataType : 'json',
			data : {
				start : moment(start).format('YYYY-MM-DD'),
				end : moment(end).format('YYYY-MM-DD'),
				designer_no : ds_no
			},
			traditional : true,
			success : function(obj) {
				var card = 0;
				var cash = 0;
				var kakao = 0;
				var account = 0;
				var ammount = 0;
				console.log(obj);
				obj.forEach(function(o, i, u) {

					var tr = $("<tr />");
					card += parseInt(o.cd);
					cash += parseInt(o.cs);
					kakao += parseInt(o.ka);
					account += parseInt(o.ac);
					ammount += parseInt(o.to);
					dsNm = o.dsNo;
					console.log(o.dsNo);

					tr.append($("<td>").text(o.mdrDt));
					tr.append($("<td>").text(o.mdrNo));
					tr.append($("<td>").text(o.memNm));
					tr.append($("<td>").text(o.dsNm));
					tr.append($("<td>").text(o.hNm));
					tr.append($("<td>").text(o.cd));
					tr.append($("<td>").text(o.cs));
					tr.append($("<td>").text(o.ka));
					tr.append($("<td>").text(o.ac));
					tr.append($("<td>").text(o.to));
					table.append(tr);
				})

				var tr = $("<tr />").append($("<td>").text("총합 "), $("<td>"),
						$("<td>").text(obj.length), $("<td>"), $("<td>"),
						$("<td>").text(card), $("<td>").text(cash),
						$("<td>").text(kakao), $("<td>").text(account),
						$("<td>").text(ammount)

				).css('color', 'red');

				table.append(tr);
			}
		});
		console.log(dsNm);
		$("#result").append($("<p />").text(dsNm));

		$("#result").append($(table));
		$("#result").append($("<button />").attr('id', 'excel').text("엑셀로 저장"));

	}

});
