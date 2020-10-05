$(function() {
	$("#answerDiv").hide();
	$("#category").hide();
	$("#start").attr('value', '');
	var date = new Date();
	endDate(date);
	$("#submit").on("click", function() {
		var myObject = {
			startDate : moment($("#start").val()).format('YYYY-MM-DD'),
			endDate : moment($("#end").val()).format('YYYY-MM-DD'),
			who : $("#who").children("option:selected").val(),
			boardType : $("#boardType").children("option:selected").val(),
			category : $("#category").children("option:selected").val(),
			searchType : $("#searchType").children("option:selected").val(),
			searchVal : $("#searchVal").val(),
			answerStatus : $("#answer").prop('checked', 'true').val()

		};
		console.log(myObject);
		result(myObject);
	})
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
	$("#boardType").change(function() {

		if (($(this).children("option:selected").is("#qna")) === true) {
			$("#category").show();
			$("#answerDiv").show();

		} else {
			$("#category").hide();
			$("#answerDiv").hide();
		}
	});
	function result(param) {
		$("#result").html("");
		var url = "/hairapp/admin/adminBoardManageFind.do"
		var table = $("<table />").attr({
			'border' : '1',
			'id' : 'test'
		});
		var tr = $("<tr />");
		tr.append($("<th>").append($("<input>").attr('type', 'checkbox')));
		tr.append($("<th>").text("번호"));
		tr.append($("<th>").text("분류"));
		tr.append($("<th>").text("제목"));
		tr.append($("<th>").text("답변상태"));
		tr.append($("<th>").text("답변하기 "));
		tr.append($("<th>").text("작성자   "));
		tr.append($("<th>").text("작성일   "));
		tr.append($("<th>").text("조회수  "));

		table.append(tr);

		$.getJSON(url, param, function(obj) {
			console.log("hi");
			console.log(obj);
			obj.forEach(function(o, i, u) {

				var tr = $("<tr />");

				tr.append($("<td>").append(
						$("<input>").attr('type', 'checkbox')));
				tr.append($("<td>").text(o.notice_no));
				tr.append($("<td>").text(o.notice_who));
				tr.append($("<td>").text(o.notice_title));
				tr.append($("<td>").text());
				tr.append($("<td>").append(
						$("<button />").attr('id', 'excel').text("답변하기")));
				tr.append($("<td>").text(o.emp_no));
				tr.append($("<td>").text(o.notice_writedate));
				tr.append($("<td>").text(o.notice_hits));
				table.append(tr);
			});

		});
		$("#result").append(table);
		$("#result").append($("<button />").attr('id', 'excel').text("엑셀로 저장"));

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
	// $("#id").val(obj.id);
	// $("#pw").val(obj.pw);
	//
	// $("#job").val(obj.job);
	// var str = "input:radio[name='gender']:radio[value='"
	// + obj.gender + "']";
	// $(str).prop('checked', true);
	// //$("input:radio[name='gender']:radio[value='여']").prop('checked',
	// true);
	// if (obj.mailyn == 'Y') {
	//
	// $("input:checkbox[name='mailyn']").prop('checked',
	// true);
	// } else {
	// $("input:checkbox[name='mailyn']").prop('checked',
	// false);
	// }

});
