function like_func(hs_no) {
	$.ajax({
		url : "../ajax/hairshopBookmark.do",
		type : "POST",
		cache : false,
		dataType : "json",
		data : 'hs_no=' + hs_no,
		success : function(data) {
			findClass = ".img-" + hs_no;
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