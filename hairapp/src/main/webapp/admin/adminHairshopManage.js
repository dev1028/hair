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
		var url = "/hairapp/admin/adminHairshopManageFind.do"
		var table = $("<table />").attr({
			'border' : '1',
			'id' : 'test'
		});
		var tr = $("<tr />");
		tr.append($("<th>").append($("<input>").attr('type', 'checkbox')));
		tr.append($("<th>").text("헤어샵번호"));
		tr.append($("<th>").text("헤어샵이름"));
		tr.append($("<th>").text("대표명"));
		tr.append($("<th>").text("아이디"));
		tr.append($("<th>").text("등록일 "));
		tr.append($("<th>").text("전화번호"));
		tr.append($("<th>").text("지역"));

		table.append(tr);

		$.getJSON(url, {
			startDate : moment($("#start").val()).format('YYYY-MM-DD'),
			endDate : moment($("#end").val()).format('YYYY-MM-DD'),
			who : $("#who").children("option:selected").val(),
			boardType : $("#boardType").children("option:selected").val(),
			category : $("#category").children("option:selected").val(),
			searchType : $("#searchType").children("option:selected").val(),
			searchVal : $("#searchVal").val(),
			answerStatus : $("#answer").prop('checked', 'true').val()

		}, function(obj) {
			console.log("hi");
			console.log(obj);
			obj.forEach(function(o, i, u) {

				var tr = $("<tr />");

				tr.append($("<td>").append(
						$("<input>").attr('type', 'checkbox')));
				// tr.append($("<td>").text(o.notice_no));
				// tr.append($("<td>").text(o.notice_who));
				// tr.append($("<td>").text(o.notice_title));
				tr.append($("<td>").text());
				tr.append($("<td>").append(
						$("<button />").attr('id', 'excel').text("답변하기")));
				tr.append($("<td>").text(o.emp_no));
				// tr.append($("<td>").text(o.notice_writedate));
				// tr.append($("<td>").text(o.notice_hits));
				table.append(tr);
			});

		});
		$("#result").append(table);
		$("#result").append($("<button />").attr('id', 'excel').text("엑셀로 저장"));

	}

});
