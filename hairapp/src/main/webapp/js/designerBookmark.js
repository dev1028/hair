function like_func(designer_no) {
	$.ajax({
		url : "../ajax/designerBookmark.do",
		type : "POST",
		cache : false,
		dataType : "json",
		data : 'designer_no=' + designer_no,
		success : function(data) {
			findClass = ".img-" + designer_no;
			if (data.type == "add") {
				$(findClass).attr("src", "../images/bookmark/heart.png");
			} else {
				$(findClass).attr("src", "../images/bookmark/empty_heart.png");
			}
		},
		error : function(request, status, error) {
			alert("에러 발생!!")
		}
	});
}