<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약상세정보</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$("#btnstatus")
				.on(
						"click",
						function() {
							var mdrStatus = $("#btnstatus").attr("data-status");
							var mdrNo = $("#mdr_noParent").children()
									.attr("id");
							$.ajax({
										url : "${pageContext.request.contextPath}/ajax/desChangeReservationStatus.do",
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
		$("#savetextArea").on("click", "button", function(){
			var textInfo = $(this).attr("data-text");
			var textNo = $(this).attr("data-detailNo");
			var mdrNo2 = $("#mdr_noParent").children().attr("id");
			var textAreaVal = $("#"+textInfo).val();
			 $.ajax({
				url : "${pageContext.request.contextPath}/ajax/desUpdateMdriMemo.do",
				data : {
					mdr_no : mdrNo2,
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
		$("#collapseTwo").on("click", ".card-title", function(){
			opener.document.location.href=$(this).attr("data-link");
			self.close();
		});
	
		$("#aBigPageMove").on("click" ,function(){
			opener.document.location.href="${pageContext.request.contextPath}/designer/findMyCustomerDetail.do?mdr_no=${mdrResult.mdr_no}";
			self.close();
		});

	});
</script>

</head>
<body>

	<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne">
				<div class="row">
					<div class="col-6">
						<h2 class="mb-0">
							<button class="btn btn-link btn-block text-left" type="button"
								data-toggle="collapse" data-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">기본정보</button>
						</h2>
					</div>
					<div class="col-3">
						<c:if test="${mdrResult.mdr_status eq 'i2'}">
							<button class="btn btn-success btn-block" id="btnstatus"
								data-status="i3" type="button">시술시작</button>
						</c:if>
						<c:if test="${mdrResult.mdr_status eq 'i3'}">
							<button class="btn btn-info btn-block" type="button"
								id="btnstatus" data-status="i4">시술완료</button>
						</c:if>
					</div>
						<div class="col-3">
						<a id="aBigPageMove" href="#" class="btn btn-primary btn-block">큰 창에서 보기</a>
						</div>
				</div>
			</div>

			<div id="collapseOne" class="collapse show"
				aria-labelledby="headingOne" data-parent="#accordionExample">
				<div class="card-body">
					<hr>
					<div class="row">
						<div id="mdr_noParent" class="col-4">
							<span id="${mdrResult.mdr_no}">예약번호</span>
						</div>
						<div class="col-8">${mdrResult.mdr_no}&nbsp;
							<c:if test="${mdrResult.mdr_status eq 'i1'}">
								<span class="badge badge-pill badge-danger">예약취소</span>
							</c:if>
							<c:if test="${mdrResult.mdr_status eq 'i2'}">
								<span class="badge badge-pill badge-success">예약중</span>
							</c:if>
							<c:if test="${mdrResult.mdr_status eq 'i3'}">
								<span class="badge badge-pill badge-info">시술중</span>
							</c:if>
							<c:if test="${mdrResult.mdr_status eq 'i4'}">
								<span class="badge badge-pill badge-secondary">시술완료</span>
							</c:if>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>예약시간</span>
						</div>
						<div class="col-8">${mdrResult.mdr_date}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>이름</span>
						</div>
						<div class="col-8">${mdrResult.mem_name}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>성별</span>
						</div>
						<div class="col-8"><c:if
							test="${mdrResult.mem_sex eq 'male'}">남자</c:if> <c:if
							test="${mdrResult.mem_sex eq 'female'}">여자</c:if></div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>전화번호</span>
						</div>
						<div class="col-8">${mdrResult.mem_phone}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>머리기장</span>
						</div>
						<div class="col-8">${mdrResult.mem_hair_length}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>머릿결상태</span>
						</div>
						<div class="col-8">${mdrResult.mem_hair_status}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-4">
							<span>헤어샵요청사항</span>
						</div>
						<div class="col-8">${mdrResult.mdr_request}</div>
					</div>
					<hr>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header" id="headingTwo">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left collapsed"
						type="button" data-toggle="collapse" data-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">시술정보</button>
				</h2>
			</div>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionExample">
				<div class="card-body">
					<c:forEach items="${detailInfo}" var="info">
						<div class="card text-center " style="width: 18rem;">
							<div class="card-body">
								<h5 class="card-title" data-hhiNo="${info.hhi_no}" data-link="${pageContext.request.contextPath}/designer/desHairInfoDetail.do?hhi_no=${info.hhi_no}"><a href="#">${info.hhi_name}</a></h5>
								<h6 class="card-subtitle mb-2 text-muted">${info.hhi_time}시간</h6>
								<p class="card-text">${info.hhi_price}원</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header" id="headingThree">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left collapsed"
						type="button" data-toggle="collapse" data-target="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">메모</button>
				</h2>
			</div>
			<div id="collapseThree" class="collapse"
				aria-labelledby="headingThree" data-parent="#accordionExample">
				<div class="card-body" id="savetextArea">
					<c:forEach items="${detailInfo}" var="info">
						<div class="row">
							<div class="card text-center col" style="width: 100rem;">
								<div class="card-body">
									<h5 class="card-title">${info.hhi_name}</h5>
									<h6 class="card-subtitle mb-2 text-muted">예약번호:
										${info.mdr_no}-${info.mdri_detail_info}</h6>
									<div class="input-group">
										<textarea class="form-control"
											id="textArea${info.mdri_detail_info}"
											aria-label="With textarea">${info.mdri_memo}</textarea>
										<div class="input-group-prepend">
											<c:if test="${mdrResult.mdr_status eq 'i1'}">
												<button class="btn btn-danger"
													data-text="textArea${info.mdri_detail_info}" data-detailNo = "${info.mdri_detail_info}">저장</button>

											</c:if>
											<c:if test="${mdrResult.mdr_status eq 'i2'}">
												<button class="btn btn-success"
													data-text="textArea${info.mdri_detail_info}" data-detailNo = "${info.mdri_detail_info}">저장</button>

											</c:if>
											<c:if test="${mdrResult.mdr_status eq 'i3'}">
												<button class="btn btn-info"
													data-text="textArea${info.mdri_detail_info}" data-detailNo = "${info.mdri_detail_info}">저장</button>

											</c:if>
											<c:if test="${mdrResult.mdr_status eq 'i4'}">
												<button class="btn btn-secondary"
													data-text="textArea${info.mdri_detail_info}" data-detailNo = "${info.mdri_detail_info}">저장</button>

											</c:if>
										</div>
									</div>

								</div>
							</div>
						</div>
					</c:forEach>


				</div>
			</div>
		</div>
	</div>
</body>
</html>