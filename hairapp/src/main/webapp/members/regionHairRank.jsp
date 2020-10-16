<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어 순위</title>
<link rel="stylesheet" type="text/css" href="../css/designerCard.css">
<link rel="stylesheet" href="../decorator/membersDesigner.css">
<script src="../js/hairBookmark.js"></script>
<style>
body {
	background: url(../images/members/hairshopselect.png);
}
</style>
	
</head>
<body>
	<div class="container">
		<br> <br> <h4 style="font-weight: bold; text-align: center;">지역별 헤어 순위</h4>
	<hr style="border: 2px solid #6d7fcc;"><br><br>
			<div class="row">
				<c:forEach items="${list}" var="hairInfo">
				<form action="../members/hairshopInfo.do" method="post">
					<div class="col-md-3 col-sm-6">
						<div class="product-grid4">
							<div class="product-image4">
<!-- 								<img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-1.jpg"> -->
<!-- 								<img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg"> -->
									<img class="pic-1" src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/hairshop/${hairInfo.hs_no}/hairinfo&img_name=${hairInfo.hhmi_file}"
							                			onerror="this.src='http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg'">
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
								<h3 class="title">${hairInfo.distance} km</h3>
								<div class="price">${hairInfo.hhi_price}원</div>
<%-- 								<div class="price">${hairInfo.hs_no} (hsNo)</div> --%>
<%-- 								<div class="price">${hairInfo.hhi_no} (hhiNo)</div> --%>
								<button class="add-to-cart">이동하기</button>
							</div>
						</div>
						<input type="hidden" name="hsNo" value="${hairInfo.hs_no}">
						<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
					</div>
				</form>
				</c:forEach>
			</div>
	</div>
	<hr>

</body>
</html>