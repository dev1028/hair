$(function() {
	$(".search").on("click",function(){
		var start = new Date();
		var end= new Date()
		$("#start").val(moment(date).format('YYYY-MM-DD'));
		$("#end").val(moment(date).format('YYYY-MM-DD'));
		
	})
	$("#submit").on("click", function(){
		var myObject = {
				startDate: "1", 
				endDate: "1", 
				who: "1", 
				boardType: "1", 
				category: "1", 
				searchType: "1", 
				searchVal: "1", 
				answerStatus: "1"
			
					};
	})
	$("#board")
			.change(
					function() {

						if (($(this).children("option:selected").is("#notice")) === true) {
							$("#category").children().remove();
							$("#category").append(
									$("<option>").text("전체카테고리  "),
									$("<option>").text("전체공지 "),
									$("<option>").text("일반회원공지  "),
									$("<option>").text("미용실 공지  "),
									$("<option>").text("이벤트공지  "));
						} else if (($(this).children("option:selected")
								.is("#q")) === true) {
							$("#category").children().remove();
							$("#category").append(
									$("<option>").text("전체카테고리  "),
									$("<option>").text("입점문의  "),
									$("<option>").text("단순문의   "),
									$("<option>").text("불만문의  "));
						} else {
							$("#category").children().remove();
							$("#category").append(
									$("<option>").text("전체카테고리  "),
									$("<option>").text("전체공지 "),
									$("<option>").text("일반회원공지  "),
									$("<option>").text("미용실 공지  "),
									$("<option>").text("이벤트공지  "),
									$("<option>").text("전체카테고리  "),
									$("<option>").text("입점문의  "),
									$("<option>").text("단순문의   "),
									$("<option>").text("불만문의  "));

						}
					})
					function result(start, end) {

		$("#result").html("");
		var url = "/hairapp/hairshop/sales.do"
		var table = $("<table />").attr({
			'border' : '1',
			'id' : 'test'
		});
		var tr = $("<tr />");
		tr.append($("<th>").text("시술날짜 "));
		tr.append($("<th>").text("번호  "));
		tr.append($("<th>").text("분류   "));
		tr.append($("<th>").text("제목   "));
		tr.append($("<th>").text("답변상태 "));
		tr.append($("<th>").text("답변하기 "));
		tr.append($("<th>").text("작성자   "));
		tr.append($("<th>").text("작성일   "));
		tr.append($("<th>").text("조회  "));
		tr.append($("<th>").text("총합  "));

		table.append(tr);

		$.getJSON(url, {
			start : moment(start).format('YYYY-MM-DD'),
			end : moment(end).format('YYYY-MM-DD')
		}, function(obj) {
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
		});
		$("#result").append($(table));
		$("#result").append($("<button />").attr('id','excel').text("엑셀로 저장"));

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

