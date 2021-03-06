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
					var mdrNo = $("#btnstatus").attr("data-mdr");
					var returnData = callAjax(mdrNo, mdrStatus, "N");
					
					if(returnData != null){
						if(returnData == 0 || returnData == -1){
							alert("시술 변화가 수정되지 않았습니다. 다시 시도해 주세요.");
						} else if(returnData == 1){
							reloadAll();
						} else if(returnData == -2){
							if(confirm("예약시간 보다 이릅니다. 정말 변경 하시겠습니까?") == true){
								mdrStatus == "i3" ? alertZero(callAjax(mdrNo, mdrStatus, "Y")) : alert("시술완료 처리는 예약시간전에 변경 할 수 없습니다."); 			
							} else {
								return;
							}
						} else if(returnData == -3){
							alert("예약시간 한 시간 전입니다. 변경 할 수 없습니다.");
						} else if(returnData == 2){
							alert("시술이 잘 완료되었나요? 해당 예약에 대한 기록을 남겨두세요.");
							alertZero(callAjax(mdrNo, mdrStatus, "Y"));
						} else if(returnData == 3){
							alert("시술이 잘 완료되었나요? 해당 예약에 대한 기록을 남겨두세요.");
							alertZero(callAjax(mdrNo, mdrStatus, "Y"));
						} 	
					} else {
						console.log("여기에 걸림..");
						alert("시술 변화가 수정되지 않았습니다. 다시 시도해 주세요.");
					}
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
	
	function alertZero(inData){
		if(inData != null){
			if(inData == 0 || inData == -1){
				alert("시술 변화가 수정되지 않았습니다. 다시 시도해 주세요.");
			} else {
				reloadAll();
			}		
		} else {
			alert("시술 변화가 수정되지 않았습니다. 다시 시도해 주세요.");
		}	

	}

	function reloadAll(){
		location.reload();
		window.opener.location.reload();
	}


	function callAjax(mdrNo, mdrStatus, checking){
		var data2;
		$.ajax({
			async : false,
			url : "${pageContext.request.contextPath}/ajax/changeReservationStatus.do",
			data : {
				mdr_status : mdrStatus,
				mdr_no : mdrNo,
				check : checking
			},
			dataType : "json",
			method : "post",
			success : function(data) {
				data2 =data;
			}		
		});// end of ajax 
		return data2;
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<br> <br> <br>
		</div>
		<div class="row justify-content-between">
			<div class="col-2">
				<h3>예약자 찾기</h3>
			</div>
			<div class="col-5">
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
					예약정보: #${customerInfo.mdr_no}
					<c:if test="${customerInfo.mdr_status eq 'i1'}">
						<span class="badge badge-pill badge-danger">예약취소</span>
					</c:if>
					<c:if test="${customerInfo.mdr_status eq 'i2'}">
						<span class="badge badge-pill badge-success">예약중</span>
					</c:if>
					<c:if test="${customerInfo.mdr_status eq 'i3'}">
						<span class="badge badge-pill badge-info">시술중</span>
					</c:if>
					<c:if test="${customerInfo.mdr_status eq 'i4'}">
						<span class="badge badge-pill badge-secondary">시술완료</span>
					</c:if>
				</h4>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><mark>담당 디자이너: <strong>${customerInfo.designer_name}</strong></mark></li>
					<li class="list-group-item">이름: <strong>${customerInfo.mem_name}</strong></li>
					<li class="list-group-item">예약일자: <strong>${customerInfo.mdr_date}</strong></li>
					<li class="list-group-item">성별: <strong><c:if
								test="${customerInfo.mem_sex eq 'male'}">남자</c:if> <c:if
								test="${customerInfo.mem_sex eq 'female'}">여자</c:if></strong></li>
					<li class="list-group-item">전화번호: <strong>${customerInfo.mem_phone}</strong></li>
					<li class="list-group-item">기장상태: <strong>${customerInfo.mem_hair_length}</strong></li>
					<li class="list-group-item">머리상태: <strong>${customerInfo.mem_hair_status}</strong></li>
					<li class="list-group-item">헤어샵 요청사항: <strong>${customerInfo.mdr_request}</strong></li>
				</ul>
				<c:if test="${customerInfo.mdr_status eq 'i2'}">
							<button class="btn btn-success btn-block" id="btnstatus" data-mdr = "${customerInfo.mdr_no}"
								data-status="i3" type="button">시술시작</button>
						</c:if>
						<c:if test="${customerInfo.mdr_status eq 'i3'}">
							<button class="btn btn-info btn-block" type="button" data-mdr = "${customerInfo.mdr_no}"
								id="btnstatus" data-status="i4">시술완료</button>
					</c:if>
			</div>
		</div>
		<hr>
		<div class="row justify-content-md-center">
			<c:forEach items="${hairList}" var="hair">
				<div class="card" style="width: 18rem;">
				<c:if test="${hair.hhmi_file != null}">
					<img onerror="this.src='../images/no_img.gif'"
                        src="${pageContext.request.contextPath}/ajax/imgView.do?img_path=/hairshop/${sessionScope.hsno}/hairinfo&img_name=${hair.hhmi_file}">
                        </c:if>
                        <c:if test="${hair.hhmi_file == null}">
                        <img src="../images/no_img.gif">
                        </c:if>
					<div class="card-body">
						<h5 class="card-title">${hair.hhi_name}</h5>
						<h6 class="card-subtitle mb-2 text-muted">${hair.hhi_time}시간</h6>
						<p class="card-text">${hair.hhi_price}원</p>
						<a href="${pageContext.request.contextPath}/hairshop/hairInfoDetail.do?hhi_no=${hair.hhi_no}" class="btn btn-sm btn-primary">헤어정보
							보기</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<hr>
		<div id="savetextArea" data-id="${customerInfo.mdr_no}">
			<c:forEach items="${hairList}" var="hair">
				<div class="row">
					<div class="card text-center col" style="width: 80rem;">
						<div class="card-body">
							<h5 class="card-title">${hair.hhi_name}</h5>
							<h6 class="card-subtitle mb-2 text-muted">예약번호:
								${hair.mdr_no}-${hair.mdri_detail_info} 메모</h6>
							<div class="input-group">
								<textarea class="form-control"
									id="textArea${hair.mdri_detail_info}"
									aria-label="With textarea">${hair.mdri_memo}</textarea>
								<div class="input-group-prepend">
									<c:if test="${customerInfo.mdr_status eq 'i1'}">
										<button class="btn btn-danger"
											data-text="textArea${hair.mdri_detail_info}"
											data-detailNo="${hair.mdri_detail_info}">저장</button>

									</c:if>
									<c:if test="${customerInfo.mdr_status eq 'i2'}">
										<button class="btn btn-success"
											data-text="textArea${hair.mdri_detail_info}"
											data-detailNo="${hair.mdri_detail_info}">저장</button>

									</c:if>
									<c:if test="${customerInfo.mdr_status eq 'i3'}">
										<button class="btn btn-info"
											data-text="textArea${hair.mdri_detail_info}"
											data-detailNo="${hair.mdri_detail_info}">저장</button>

									</c:if>
									<c:if test="${customerInfo.mdr_status eq 'i4'}">
										<button class="btn btn-secondary"
											data-text="textArea${hair.mdri_detail_info}"
											data-detailNo="${hair.mdri_detail_info}">저장</button>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<hr>
		<div class="row justify-content-md-center">
			<c:forEach items="${payList}" var="pay">
				<div class="col-4">
					<h4>매출정보: #${pay.mdr_no}-${pay.mdp_no}</h4>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><c:if
								test="${pay.mdp_rv_scene eq '1'}">예약결제</c:if> <c:if
								test="${pay.mdp_rv_scene eq '0'}">현장결제</c:if></li>
						<li class="list-group-item"><c:if
								test="${pay.mdp_code eq 'd1'}">카드</c:if> <c:if
								test="${pay.mdp_code eq 'd2'}">현금</c:if> <c:if
								test="${pay.mdp_code eq 'd3'}">카카오페이</c:if> <c:if
								test="${pay.mdp_code eq 'd4'}">적립금</c:if> <c:if
								test="${pay.mdp_code eq 'd5'}">쿠폰</c:if></li>
						<li class="list-group-item">${pay.mdp_price}원</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>