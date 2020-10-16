<%@page import="com.yedam.hairshop.model.MembersVo"%>
<%@page import="com.yedam.hairshop.dao.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersInfoView.jsp</title>
<script>
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {

		if (!document.form.modifypw.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.form.modifypw.value != document.form.modifypwcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if(!form.modifyname.value){
            alert("이름을 입력하세요.");
            return false;
        }
        
        if(!form.modifybirth.value){
            alert("생년월일을 입력하세요.");
            return false;
        }

        if(!form.modifyphone.value){
            alert("전화번호를 입력하세요.");
            return false;
        }

        return true;
    }
    
    // 취소 버튼 클릭시 첫화면으로 이동
    function goFirstForm() {
        location.href="membersMain.do";
    }    
    

	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다.
	// (＂팝업 API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";
	function goPopup() {
		//경로는 시스템에 맞게 수정하여 사용
		//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를
		//호출하게 됩니다.
		var pop = window.open("../popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
		//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서
		// 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
	}

</script>
</head>
<body>

	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원 정보 수정</font></b> <br>
		<br> <br>


		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<form method="post"
			action="membersInfoView.do"
			name="form" id="form" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">이메일(아이디)</td>
					<td><input type="email" name="modifyemail" maxlength="50" value="${modify.mem_email}" readonly="readonly"></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="modifypw" maxlength="15" value="${modify.mem_pw}"
						placeholder="15자 내로 적어주세요"></td>
				</tr>

				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="modifypwcheck" maxlength="15"
						placeholder="비밀번호 재입력"></td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="modifyname" maxlength="50" value="${modify.mem_name}"></td>
				</tr>

				<tr>
					<td id="title">휴대전화</td>
					<td><input type="text" name="modifyphone"placeholder="010-000-0000" value="${modify.mem_phone}"></td>
				</tr>

				<tr>
					<td id="title">생일</td>
					<td><input type="date" id="modifybirth" name="modifybirth" value="${modify.mem_birth}"></td>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="modifygender" value="male" 
						<c:if test="${modify.mem_sex=='male'}">checked="checked"</c:if>>남
						<input type="radio" name="modifygender" value="female"
						<c:if test="${modify.mem_sex=='female'}">checked="checked"</c:if>>여</td>
				</tr>

				<tr>
					<td id="title">도로명주소 전체</td>
					<td><input type="text" id="roadFullAddr" name="roadFullAddr" placeholder="팝업을 먼저 눌러주세요" value="${modify.mem_addr}" />
					<input type="button" onClick="goPopup();" value="팝업" /></td>
				</tr>

				<tr>
					<td id="title">도로명주소</td>
					<td><input type="text" id="roadAddrPart1" name="roadAddrPart1" value="${modify.mem_city}" /></td>
				</tr>

				<tr>
					<td id="title">고객입력 상세주소</td>
					<td><input type="text" id="addrDetail" name="addrDetail" value="${modify.mem_country}" /></td>
				</tr>

				<tr>
					<td id="title">참고주소</td>
					<td><input type="text" id="roadAddrPart2" name="roadAddrPart2" value="${modify.mem_township}" /></td>
				</tr>

				<tr>
					<td id="title">우편번호</td>
					<td><input type="text" id="zipNo" name="zipNo" value="${modify.mem_zip}" /></td>
				</tr>

				<tr>
					<td id="title">기장 선택</td>
					<td><input type="radio" name="modifyhairlengths" value="u1"
					<c:if test="${modify.mem_hair_length=='u1'}">checked="checked"</c:if>>숏
					<input type="radio" name="modifyhairlengths" value="u2"
					<c:if test="${modify.mem_hair_length=='u2'}">checked="checked"</c:if>>턱선아래
					<input type="radio" name="modifyhairlengths" value="u3"
					<c:if test="${modify.mem_hair_length=='u3'}">checked="checked"</c:if>>어깨선아래
					<input type="radio" name="modifyhairlengths" value="u4"
					<c:if test="${modify.mem_hair_length=='u4'}">checked="checked"</c:if>>가슴선아래</td>
				</tr>

				<tr>
					<td id="title">머릿결 상태</td>
					<td><input type="radio" name="modifyhairstatus" value="o1"
					<c:if test="${modify.mem_hair_status=='o1'}">checked="checked"</c:if>>정상모발
					<input type="radio" name="modifyhairstatus" value="o2"
					<c:if test="${modify.mem_hair_status=='o2'}">checked="checked"</c:if>>손상모발
					<input type="radio" name="modifyhairstatus" value="o3"
					<c:if test="${modify.mem_hair_status=='o3'}">checked="checked"</c:if>>극손상모발
					<input type="radio" name="modifyhairstatus" value="o4"
					<c:if test="${modify.mem_hair_status=='o4'}">checked="checked"</c:if>>탈색모모발</td>
				</tr>
			</table>
		</form>
		<form method="post" action="membersInfoModify.do" name="formmodi" id="formmodi">
			<br> <input type="submit" value="수정" />
			<input type="button" value="취소" onclick="goFirstForm()">
		</form>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</body>
</html>