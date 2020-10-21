<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#hsp_file").on("change", function(event) {
			var fileName = $(this).val();
			$("#hsp_fileLable").text(fileName);

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
		<div class="py-5 text-center">
			<h2>미용실 정보</h2>
			<p class="lead">
				미용실의 프로필정보와 공지사항을 수정하거나 등록해주세요. <br>미용실을 대표하는 이미지를 등록해주세요. <br>
				정보가 많을수록 예약자분들에게 도움이 됩니다.

			</p>
		</div>

		<div class="row">

			<div class="col-md justify-content-md-center">
				<form class="needs-validation" id="hairinfoInsertFrm"
					action="${pageContext.request.contextPath}/hairshop/myHairshopProfileUpdate.do"
					method="post" enctype="multipart/form-data">
					<div class="mb-3">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">프로필</span>
							</div>
							<textarea name="hs_profile" rows="10" class="form-control"
								aria-label="With textarea">${hairshop.hs_profile}</textarea>

						</div>
						<small>해당정보는 예약홈페이지에 미용실 정보로 반영됩니다.</small>

						<hr class="mb-4">

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">공지사항</span>
							</div>
							<textarea name="hs_notice" rows="10" class="form-control"
								aria-label="With textarea">${hairshop.hs_notice}</textarea>

						</div>
						<small>해당정보는 예약자에게 공지할 내용입니다.</small>
					</div>
					<hr class="mb-4">
					<h4 class="mb-3">이미지 등록</h4>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="hsp_file"
								accept=".gif, .jpg, .png" id="hsp_file"
								aria-describedby="inputGroupFileAddon01"> <label
								id="hsp_fileLable" class="custom-file-label" for="hsp_file">이미지를
								등록하세요.</label>
						</div>
					</div>
					<div id="image_container"></div>

					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">정보수정</button>
				</form>
			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">
				상호 : UDONG# | 만든이 : 김린아, 김강산, 김승연, 이상민, 이송현<br> 주소 : 대구 중구
				국채보상로 537 | git주소 : <a href="https://github.com/dev1028/hair"
					target="_blank">https://github.com/dev1028/hair</a><br> 서비스
				이용문의 및 서비스 제휴문의 : udong1023@gmail.com<br>
			<ul class="list-inline">
				<li class="list-inline-item"><a
					href="${pageContext.request.contextPath}/admin/adminLogin.jsp">Admin</a></li>
				<li class="list-inline-item"><a
					href="${pageContext.request.contextPath}/ajax/hairshopReturnToLogin.do">Hairshop</a></li>
				<li class="list-inline-item"><a
					href="${pageContext.request.contextPath}/members/membersMain.do">Members</a></li>
			</ul>
			Copyright © UDONG#. All Rights Reserved.
		</footer>
	</div>
</body>
</html>