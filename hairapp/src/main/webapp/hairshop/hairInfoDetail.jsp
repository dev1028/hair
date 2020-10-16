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
		$("#imgList").on("click", "img", function() {
			alert("달리");
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
							var hhiStatus = $("#btnstatus").attr("data-status");
							var hhiNo = $("#btnstatus").attr("data-no");
							$
									.ajax({
										url : "${pageContext.request.contextPath}/ajax/hairStatusChange.do",
										data : {
											hhi_status : hhiStatus,
											hhi_no : hhiNo
										},
										dataType : "json",
										method : "post",
										success : function(data) {
											if (data == 0) {
												alert("변경에 실패했습니다. 다시 시도해 주세요.");
											} else {
												location.reload();
												window.opener.location.reload();
											}
										}
									});// end of ajax 
						});
		$("#hhmi_file").on("change", function(event) {
			var fileName = $(this).val();
			$("#hhmi_fileLabel").text(fileName);
			
			/* var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				img.setAttribute("class", "rounded mx-auto d-block");
				document.querySelector("div#image_container")
						.appendChild(img);
			};
			reader.readAsDataURL(event.target.files[0]); */
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
					action="${pageContext.request.contextPath}/hairshop/hairInfoList.do"
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
				<c:if test="${hair.hhi_status == '0'}">
					<button class="btn btn-success btn-block" id="btnstatus" data-no="${hair.hhi_no}"
						data-status="1" type="button">사용하기</button>
				</c:if>
				<c:if test="${hair.hhi_status == '1'}">
					<button class="btn btn-danger btn-block" type="button"
						id="btnstatus" data-status="0" data-no="${hair.hhi_no}">사용중단</button>
				</c:if>
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
		<hr>
		<div class="row justify-content-md-center">
			<div class="col-2"><h5>헤어사진 업로드</h5>	</div>
			<div class="col-sm">
				<form action="${pageContext.request.contextPath}/hairshop/hairInfoPicUpload.do" method="post" 
				enctype="multipart/form-data">
					<div class="input-group">
						<div class="custom-file">
							<input type="hidden" name="hhi_no" value="${hair.hhi_no}">
							<input type="file" class="custom-file-input" name ="hhmi_file" accept=".gif, .jpg, .png"
								id="hhmi_file" aria-describedby="inputGroupFileAddon04">
							<label class="custom-file-label" for="inputGroupFile04" id="hhmi_fileLabel">Choose
								file</label>
						</div>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit"
								id="inputGroupFileAddon04">업로드</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>