$(function() {
	 $('#dataTabl').dataTable( {
	        
	        "paging": true, //페이징처리
	        "ordering": true, //칼럼별 정렬기능
	        //"autoWidth": false, //가로자동
	        "lengthChange": false, //데이터건수 변경
	        "pageLength": 25, //기본 데이터건수
	        //"lengthMenu": [[50, 100, 1000], [50, 100, "Max(1000)"]], //데이터건수옵션
	       // "order": [15,'desc'], //기본 정렬칼럼
	        "searching": false, //검색
	        "columnDefs" : [//칼럼조작
	        	//가로길이         //칼럼제목   //데이터타겟    //해당칼럼만 정렬기능사용안함
	        	    {"width":"1em",  "targets":1, "orderable": false},
	        	    {"width":"1em", "targets":2}
	        	]
	    } );
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
	$("#who").change(function() {

		if ($(this).children("option:selected").val() == "j1") {

			$("#category").html("");
//			category = $("<select/>").attr('id', 'category');
			$("#category").append($("<option />").text("전체카테고리").val("all"));
			$("#category").append($("<option />").text("입점문의").val("a1"));
			$("#category").append($("<option />").text("단순문의").val("a2"));
			$("#category").append($("<option />").text("불만문의").val("a3"));
//			$("#categoryDiv").append(category);

		} else if ($(this).children("option:selected").val() == "j2") {

			$("#category").html("");
			$("#category").append($("<option />").text("전체카테고리").val("all"));
			$("#category").append($("<option />").text("예약관련문의").val("m1"));
			$("#category").append($("<option />").text("사이트 관련문의").val("m2"));
			$("#category").append($("<option />").text("이벤트관련문의").val("m3"));
			$("#category").append($("<option />").text("고객의소리").val("m4"));
			$("#category").append($("<option />").text("답변").val("m5"));

		} else {
			$("#category").html("");
		}
	});

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
						.getElementById('dataTable').outerHTML);

				var a = document.createElement('a');
				a.href = data_type + ',%EF%BB%BF' + table_html;
				a.download = 'test' + '_excel' + '.xls';
				a.click();

			})

});

