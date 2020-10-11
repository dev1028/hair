<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/designerCard.css">
<link rel="stylesheet" href="../decorator/membersDesigner.css">
</head>
<body>
<script>
	function like_func(hhi_no) {
		$.ajax({
			url : "../ajax/hairBookmark.do",
			type : "POST",
			cache : false,
			dataType : "json",
			data : 'hhi_no=' + hhi_no,
			success : function(data) {
				findClass = ".img-" + hhi_no;
				if(data.type == "add"){
					$(findClass).attr("src", "../images/bookmark/heart.png");
				}else{
					$(findClass).attr("src", "../images/bookmark/empty_heart.png");
				}
			},
			error : function(request, status, error) {
				alert("에러 발생!!")
			}
		});
	}
</script>
<script>
$(document).ready(function() {
	$("input[type='checkbox']").on("click", function() {
		var count = $("input:checked[type='checkbox']").length;
			if (count > 3) {
				$(this).attr("checked", false);
				alert("3개까지만 선택할 수 있습니다.");
			}
		
		var t = 0;
		$("input:checked[type='checkbox']").each(function(){
			//alert($(this).parent().prev().prev().prop('tagName'));
			t += parseInt($(this).parent().prev().prev().text().replace('시간', ''));			
		});
		$("label[class='total_hour']").text(t);
		$("input[name='total_hour']").val(t);
	});
});

function check_cart(){
	var count = $("input:checked[type='checkbox']").length;
	if(count < 1 || count > 3){
		alert("1개 이상 3개 이하로 담아주세요.")
		return false;
	}
	return true;
}
</script>

	<div class="container">
		<h3 class="h3">헤어 정보</h3>
			<form action="../members/hairSelectResult.do" method="post">
			<c:if test="${empty sessionScope.login }">
				<button class="add-to-cart" onclick="alert('로그인을 해주세요.'); return false">예약하기</button>
			</c:if>
			<c:if test="${not empty sessionScope.login }">
				<button class="add-to-cart" onclick="return check_cart();">예약하기</button>
			</c:if>
			총 시술 시간: <label class="total_hour">0</label>시간
			<input type="hidden" name="total_hour" value="0">
			
			<div class="row">
				<c:forEach items="${list}" var="hairInfo">
					<div class="col-md-3 col-sm-6">
						<div class="product-grid4">
							<div class="product-image4">
								<img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-1.jpg">
								<img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg">
							</div>
							<div class="product-content">
								<c:if test="${not empty sessionScope.login }">
									<a href='javascript: like_func("${hairInfo.hhi_no}")'> 
										<c:if test="${hairInfo.hhi_book == 1 }">
											<img class="img-${hairInfo.hhi_no}" src="../images/bookmark/heart.png" width="30" height="30">
										</c:if> 
										<c:if test="${hairInfo.hhi_book != 1 }">
											<img class="img-${hairInfo.hhi_no}" src="../images/bookmark/empty_heart.png" width="30" height="30">
										</c:if>
									</a>
								</c:if>
								<h3 class="title">${hairInfo.hhi_name}</h3>
								<h3 class="title">${hairInfo.hhi_time}시간</h3>
								<div class="price">${hairInfo.hhi_price}원</div>
								<label><input class="add-to-cart" type="checkbox" name="cart" value="${hairInfo.hhi_no}">담기</label>
							</div>
						</div>
						<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
					</div>
				</c:forEach>
			</div>
			</form>
	</div>
<hr>

</body>
</html>