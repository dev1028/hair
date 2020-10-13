<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$('.bxslider').bxSlider({
			auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
			slideWidth : 600
		});

		
		$("#searchCustomerBtn").on("click", function() {
			if ($("#inputSearch").val() == "") {
				alert("값을 입력해주세요");
			} else {
				$("#searchCustomerFrm").submit();
			}
		});
		
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<br> <br> <br>
		</div>
		<div class="row justify-content-between">
			<div class="col-4">
				<h3>헤어상세정보</h3>
			</div>
			<div class="col-6">
			<form id="searchCustomerFrm" action="${pageContext.request.contextPath}/designer/desHairInfoList.do"
					method="post">
					<div class="input-group flex-nowrap">
						<div class="input-group-prepend">
							<select name="divisionSearch">
								<option value="hhi_name">시술명</option>
								<option value="tmac_name">시술분류</option>
							</select>
						</div>
						<input type="text" class="form-control"
							placeholder="시술분류나 시술명을 입력하세요." id="inputSearch"
							name="inputSearch" aria-label="Username"
							aria-describedby="addon-wrapping">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="searchCustomerBtn">Search</button>
						</div>
					</div>
				</form>
			</div>

		</div>
		<hr>

		<div class="row justify-content-md-center">
			<div class="col-6">
				<h4>
					헤어번호: #${hair.hhi_no}
					<c:if test="${hair.hhi_status == '0'}">
						<span class="badge badge-pill badge-danger">미사용</span>
					</c:if>
					<c:if test="${hair.hhi_status == '1'}">
						<span class="badge badge-pill badge-success">사용</span>
					</c:if>
				</h4>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">시술분류명: <strong>${hair.tmac_name}</strong></li>
					<li class="list-group-item">시술선택명: <strong>${hair.tmic_name}</strong></li>
					<li class="list-group-item">시술표기명: <strong>${hair.hhi_name}</strong></li>
					<li class="list-group-item">가격: <strong>${hair.hhi_price}원</strong></li>
					<li class="list-group-item">기본시술시간: <strong>${hair.hhi_time}시간</strong></li>
				</ul>
			</div>
		</div>
		<hr>
		<div class="row justify-content-md-center">
			<div class="bxslider" id="imgList">
				<c:if test="${picList.size() == 0 || picList == null}">
				<div>
					<img src="../images/no_img.gif">
				</div>
				</c:if>
				<c:forEach items="${picList}" var="pic">
					<div>
						<img onerror="this.src='../images/no_img.gif'"
                        src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/hairshop/${hair.hs_no}/hairinfo&img_name=${pic.hhmi_file}">
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>