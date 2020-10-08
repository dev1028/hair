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
		$("#btnstatus")
				.on(
						"click",
						function() {
							var mdrStatus = $("#btnstatus").attr("data-status");
							var mdrNo = $("#mdr_noParent").children()
									.attr("id");
							$
									.ajax({
										url : "${pageContext.request.contextPath}/ajax/changeReservationStatus.do",
										data : {
											mdr_status : mdrStatus,
											mdr_no : mdrNo
										},
										dataType : "json",
										method : "post",
										success : function(data) {
											if (data == 0) {
												alert("시술 변화가 수정되지 않았습니다. 다시 시도해 주세요.");
											} else {
												location.reload();
												window.opener.location.reload();
											}
										}
									});// end of ajax 
						});
		$("#savetextArea")
				.on(
						"click",
						"button",
						function() {
							var textInfo = $(this).attr("data-text");
							var textNo = $(this).attr("data-detailNo");
							var mdrNo = $("#savetextArea").attr("data-id");
							var textAreaVal = $("#" + textInfo).val();
							$
									.ajax({
										url : "${pageContext.request.contextPath}/ajax/updateMdriMemo.do",
										data : {
											mdr_no : mdrNo,
											mdri_memo : textAreaVal,
											mdri_detail_info : textNo
										},
										dataType : "json",
										method : "post",
										success : function(data) {
											if (data == 0) {
												alert("시술 메모가 등록되지 않았습니다. 다시 시도해 주세요.");
											} else {
												alert("메모가 정상적으로 등록되었습니다.")
											}
										}
									});// end of ajax 
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
				<form id="searchCustomerFrm"
					action="${pageContext.request.contextPath}/designer/findMyCustomer.do"
					method="post">
					<div class="input-group flex-nowrap">
						<div class="input-group-prepend">
							<select name="divisionSearch">
								<option value="name">이름</option>
								<option value="tel">전화번호</option>
							</select>
						</div>
						<input type="text" class="form-control"
							placeholder="이름 또는 전화번호를 입력하세요" id="inputSearch"
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
				<c:if test="${hair.hhi_status == '0'}">
					<button class="btn btn-success btn-block" id="btnstatus"
						data-status="1" type="button">사용하기</button>
				</c:if>
				<c:if test="${hair.hhi_status == '1'}">
					<button class="btn btn-danger btn-block" type="button"
						id="btnstatus" data-status="0">사용중단</button>
				</c:if>
			</div>
		</div>
		<hr>
		<div class="row justify-content-md-center">
			<div class="bxslider">
				<div>
					<img src="../images/hairshop/san.jpg">
				</div>
			</div>
		</div>
		<hr>
		<div class="row justify-content-md-center">
			<form>
				<input type="file" id="image" name="file_name"
					accept=".gif, .jpg, .png" onchange="setThumbnail(event);" />
				<div id="image_container"></div>
				<script>
					function setThumbnail(event) {
						var reader = new FileReader();
						reader.onload = function(event) {
							var img = document.createElement("img");
							img.setAttribute("src", event.target.result);
							document.querySelector("div#image_container")
									.appendChild(img);
						};
						reader.readAsDataURL(event.target.files[0]);
					}
				</script>
				<div>
					<button>수정하기</button>
					<button type="reset">초기화</button>
					<!-- onclick="location.href='/designer/designerMyPageOutput.jsp'" -->
				</div>
			</form>
		</div>
</body>
</html>