<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 수정</title>
<script type="text/javascript">
var cnt = 1;
$(function(){
	$("#hs_fulladdr").on("click", function(){
		goPopup();
		
	});
	
	$('#myInsertFrm').submit(function (){
		if(cnt == 0){
			alert("전화번호를 확인해주세요.");
			return false;
		}
		
		if(parseInt($("#hs_starttime").val()) >= parseInt($("#hs_endtime").val())){
			alert("영업종료시간이 영업시작시간보다 이릅니다. 수정 후 등록하세요.");
			return false;
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/ajax/checkDesignerTime.do",
			data : {
				hs_starttime : $("#hs_starttime").val(),
				hs_endtime : $("#hs_endtime").val()
			},
			dataType : "json",
			method : "post",
			success : function(data) {
				if (data == 0) {
					//가능
				} else {
					//불가능
				}
			}
		});// end of ajax 
		
	});
	
	$("#hs_tel").on("focusout", nCheck);
	
});
function nCheck(){
    var numCheck = $(this).val();
    if(/[^0123456789-]/g.test(numCheck)){
        alert("번호는 숫자와 특수문자'-'만 입력이 가능합니다.");
        $(this).val("");
        cnt = 0;
    }else {
    	cnt = 1;
    }
}

//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다.
// (＂팝업 API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup() {
	//경로는 시스템에 맞게 수정하여 사용
	//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를
	//호출하게 됩니다.
	var pop = window.open("../popup/jusolatlongPopup.jsp", "pop",
			"width=570,height=420, scrollbars=yes, resizable=yes");
	//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서
	// 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
		roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
		detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
		buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo, entX, entY) {
	// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
		$("#hs_fulladdr").val(roadFullAddr);
		$("#hs_cityaddr").val(siNm);
		$("#hs_townaddr").val(sggNm);
		$("#hs_streetaddr").val(emdNm);
		$("#hs_latlong").val(entX+","+entY);
		console.log($("#hs_latlong").val());
}
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
				미용실의 정보를 변경하세요.<br>일부 변경내용에 대해서는 관리자의 승인 필요 할 수도 있습니다.<br>
				변경 불가능한 내용에 대해서는 관리자에게 문의하세요.
				
			</p>
		</div>

		<div class="row">

			<div class="col-md justify-content-md-center">
				<form class="needs-validation" id="myInsertFrm"
					action="${pageContext.request.contextPath}/hairshop/myHairshopInfoUpdateFrm.do"
					method="post">
					<div class="mb-3">
						<label for="hs_tel">전화번호 </label>
						<div class="input-group">
							<input type="text" class="form-control" id="hs_tel"
								name="hs_tel" placeholder="- 포함" required value="${hairshop.hs_tel}">
						</div>
					</div>
					<div class="mb-3">
						<label for="hs_fulladdr">주소 </label>
						<div class="input-group">
							<input type="text" class="form-control" id="hs_fulladdr"
								name="hs_fulladdr" placeholder="여기를 클릭하세요" readonly required value="${hairshop.hs_fulladdr}">
							<input type="hidden" name="hs_cityaddr" id="hs_cityaddr" value="${hairshop.hs_cityaddr}"> 
							<input type="hidden" name="hs_townaddr" id="hs_townaddr" value="${hairshop.hs_townaddr}"> 
							<input type="hidden" name="hs_streetaddr" id="hs_streetaddr" value="${hairshop.hs_streetaddr}"> 
							<input type="hidden" name="hs_latlong" id="hs_latlong" value="${hairshop.hs_latlong}"> 
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="hs_starttime">영업시작시간</label> <select
								class="custom-select d-block w-100" id="hs_starttime" name="hs_starttime"
								required>
								<c:forEach begin="0" end="23" var="i">
									<option value="${i}" <c:if test="${hairshop.hs_starttime eq i}">selected</c:if>>${i}시</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<label for="hs_endtime">영업종료시간 </label> <select
								class="custom-select d-block w-100" id="hs_endtime" name="hs_endtime"
								required>
								<c:forEach begin="0" end="23" var="i">
								
									<option value="${i}" <c:if test="${hairshop.hs_endtime eq i}">selected</c:if>>${i}시</option>
								</c:forEach>
							</select>
	
						</div>
					</div>
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">정보수정</button>
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