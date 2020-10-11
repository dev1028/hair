function like_func(hhi_no) {
	$.ajax({
		url : "../ajax/hairBookmark.do",
		type : "POST",
		cache : false,
		dataType : "json",
		data : 'hhi_no=' + hhi_no,
		success : function(data) {
			findClass = ".img-" + hhi_no;
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