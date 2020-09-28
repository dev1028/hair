<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
.cardContainer {
	width: 70%;
}

.horizontal-card {
	width: 100%;
	position: relative;
	display: flex;
	border: 1px solid gray;
	margin-bottom: 1rem;
}

.horizontal-card img {
	width: 200px;
	height: 130px;
	border-bottom: 30px solid orange;
}

.horizontal-card .horizontal-card-body {
	display: flex;
	flex-direction: column;
	margin-left: 1rem;
}

.horizontal-card .horizontal-card-footer {
	position: absolute;
	left: 0px;
	right: 0px;
	bottom: 0px;
	height: 30px;
	display: flex;
	align-items: center;
}

.horizontal-card .horizontal-card-footer span {
	width: 200px;
	display: inline-block;
}

.horizontal-card .horizontal-card-footer a {
	margin-left: 10px;
}
</style>
<script>
	function like_func(hs_no) {
		alert(hs_no)
// 		var frm_read = $('#frm_read');
// 		var boardno = $('#boardno', frm_read).val();
// 		//var mno = $('#mno', frm_read).val();
// 		//console.log("boardno, mno : " + boardno +","+ mno);
		$.ajax({
			url : "../ajax/hairshopBookmark.do",
			type : "POST",
			cache : false,
			dataType : "json",
			data : 'hs_no=' + hs_no,
			success : function(data) {
// 				var msg = '';
// 				var like_img = '';
// 				msg += data.msg;
// 				alert(msg);

// 				if (data.like_check == 0) {
// 					like_img = "./images/dislike.png";
// 				} else {
// 					like_img = "./images/like.png";
// 				}
// 				$('#like_img', frm_read).attr('src', like_img);
// 				$('#like_cnt').html(data.like_cnt);
// 				$('#like_check').html(data.like_check);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}

</script>
</head>
<body>

	<h1>키워드: ${param.term }</h1>

	<div class="cardContainer">
		<c:forEach items="${list}" var="item">
			<form action="../members/hairshopSelectResult.do" method="post">
				<div class="horizontal-card">
					<img src="../images/hairshop/signin-image.jpg" width="200"
						height="100">
					<div class="horizontal-card-body">
						<h4 class="card-title"><a href="hairshopInfo.do?hsNo=${item.hs_no}">${item.hs_name }</a></h4>
						<span>공지: ${item.hs_notice}</span>
<%-- 						<span class="card-text"> 프로필: ${item.hs_profile } </span> --%>
						<span class="card-text"> 주소: ${item.hs_fulladdr } </span>
					</div>
					<div class="horizontal-card-footer">
						<span class="card-text"> 별점: 미구현 </span>
						<!-- <a class="card-text status">좋아요수: 미구현</a> -->
						<!-- <a class="card-text status">#Save</a> -->
						
						<c:if test="${not empty login }">
							<a href='javascript: like_func("${item.hs_no}")'>북마크</a>
						</c:if>	
						
						<!-- <button>북마크</button> -->
						<button>예약</button>
					</div>
				</div>

				<input type="hidden" name="hsNo" value="${item.hs_no}">
			</form>
		</c:forEach>
	</div>

</body>
</html>