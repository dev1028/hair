<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 $(function(){
	$("#tmac_no").on("change", function(){
		if($("#tmac_no").val() != ""){
			var tmacNo = $("#tmac_no").val();
			$("#tmic_no").attr("disabled", true);
			$.ajax({
						url : "${pageContext.request.contextPath}/ajax/getTmicList.do",
						data : {
							tmac_no : tmacNo
						},
						dataType : "json",
						method : "post",
						success : function(data) {
							if (data == null) {
								
							} else {
								$("#tmic_no").html("");
								for(var i=0; i<data.length; i++){
									$("#tmic_no")
									.append($("<option>")
											.attr("value", data[i].tmic_no).text(data[i].tmic_name));
								}
								
								$("#tmic_no").attr("disabled", false);
						/* 		location.reload();
								window.opener.location.reload(); */
							}
						}
					});// end of ajax 
			
		} else {
			$("#tmic_no").html("");
			$("#tmic_no")
			.append($("<option>")
					.attr("value", "").text("시술분류명을 먼저 선택하세요."));
		}
		
	});
	
	$('#hairinfoInsertFrm').submit(function () { //required 사용안할경우 쓰자
		if($("hhi_name").val() == ""){
			alert("시술명을 입력하세요.");
			return false;
		}
		if($("hhi_price").val() == ""){
			alert("가격을 입력하세요.");
			return false;
		} else if(is_number($("hhi_price").val())){
			alert("숫자만 입력하세요.");
			return false;
		}
		if($("hhi_time").val() == ""){
			alert("시술시간을 선택하세요.");
			return false;
		}
		if($("tmac_no").val() == ""){
			alert("시술분류명을 선택하세요.");
			return false;
		}
		if($("tmic_no").val() == ""){
			alert("시술선택명을 선택하세요.");
			return false;
		}
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
function is_number(v) {
     var reg = /^(\s|\d)+$/;
     return reg.test(v);
 }
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<br>
			<br>
			<br>
		</div>
		<div class="py-5 text-center">
			<h2>시술 등록</h2>
			<p class="lead">
				미용실에서 사용하는 시술들을 등록할 수 있습니다.<br>시술등록시 해당 시술의 이미지를 등록해주세요. <br>등록과
				동시에 해당 시술에 대한 예약이 가능합니다.
			</p>
		</div>

		<div class="row">

			<div class="col-md justify-content-md-center">
				<form class="needs-validation" id="hairinfoInsertFrm" 
				action="${pageContext.request.contextPath}/hairshop/hairInfoInsertForm.do" method="post"
				enctype="multipart/form-data">
					<div class="mb-3">
						<label for="hhi_name">시술명 <span class="badge badge-pill badge-danger">필수</span></label> <input type="text"
							class="form-control" id="hhi_name" name="hhi_name" value="" placeholder="예약시 표시될 시술명입니다."
							required>
						<div class="invalid-feedback">이미 사용중인 시술명입니다. 해당 시술을 미사용 처리후
							등록해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="hhi_price">가격 <span class="badge badge-pill badge-danger">필수</span></label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">원</span>
							</div>
							<input type="text" class="form-control" id="hhi_price" name="hhi_price"
								placeholder="가격을 입력해주세요." required>
							<div class="invalid-feedback" style="width: 100%;">정확한 범위의
								가격을 입력해주세요.</div>
						</div>
					</div>
					<div class="mb-3">
							<label for="hhi_time">기본소요시간 <span class="badge badge-pill badge-danger">필수</span></label> <select
								class="custom-select d-block w-100" id="hhi_time" name="hhi_time" required>
								<option value="">소요시간을 선택하세요.</option>
								<option value="1">1시간</option>
								<option value="2">2시간</option>
								<option value="3">3시간</option>
								<option value="4">4시간</option>
								<option value="5">5시간</option>
								<option value="6">6시간</option>
							</select>
							<div class="invalid-feedback">기본소요시간은 예약시간을 산출하는데 사용합니다.</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="tmac_no">시술분류명 <span class="badge badge-pill badge-danger">필수</span></label> <select
								class="custom-select d-block w-100" id="tmac_no" name="tmac_no" required>
								<option value="">선택하세요.</option>
								<c:forEach items="${tmacList}" var="tmac">
									<option value="${tmac.tmac_no}">${tmac.tmac_name}</option>
								</c:forEach>
							</select>
							<div class="invalid-feedback">시술분류명은 해당시술이 어디에 속해있는지 알수있습니다.
								</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="tmic_no">시술선택명 <span class="badge badge-pill badge-danger">필수</span></label> <select
								class="custom-select d-block w-100" id="tmic_no" name="tmic_no" required>
								<option value="">시술분류명을 먼저 선택하세요.</option>
							</select>
							<div class="invalid-feedback">시술선택명은 보편적으로 사용하는 시술명입니다. 원하는 선택명이 없을시 관리자에게 신청하세요.
							</div>
						</div>
					</div>
					<hr class="mb-4">
					<h4 class="mb-3">이미지 등록</h4>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="hhmi_file" accept=".gif, .jpg, .png"
								id="hhmi_file" aria-describedby="inputGroupFileAddon01">
							<label id="hhmi_fileLabel"class="custom-file-label" for="hhmi_file">이미지를 등록하세요.</label>
						</div>
					</div>
					<div id="image_container"></div>
					
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">시술등록</button>
				</form>
			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2017-{{ site.time | date: "%Y" }} Company
				Name</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">Support</a></li>
			</ul>
		</footer>
	</div>

</body>
</html>