<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersJoin.jsp</title>
<script>
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.membersInfo.joinemail.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.membersInfo.joinpw.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.membersInfo.joinpw.value != document.membersInfo.joinpwcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
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
		<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br> <br>


		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post"
			action="${pageContext.request.contextPath}/membersJoin.do"
			name="form" id="form" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">이메일(아이디)</td>
					<td><input type="text" name="joinemail" maxlength="50">
						<input type="button" value="중복확인"></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="joinpw" maxlength="50">
					</td>
				</tr>

				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="joinpwcheck" maxlength="50">
					</td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="joinname" maxlength="50"></td>
				</tr>

				<tr>
					<td id="title">휴대전화</td>
					<td><input type="text" name="joinphone" /></td>
				</tr>

				<tr>
					<td id="title">생일</td>
					<td><input type="text" name="joinbirth" maxlength="10"
						placeholder="yyyy/mm/dd 형식으로 적어주세요"></td>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="joingender" value="남" checked>남
						<input type="radio" name="joingender" value="여" checked>여</td>
				</tr>

				<tr>
					<td id="title">도로명주소 전체</td>
					<td><input type="text" id="roadFullAddr" name="roadFullAddr" />
						<input type="button" onClick="goPopup();" value="팝업" /></td>
				</tr>

				<tr>
					<td id="title">도로명주소</td>
					<td><input type="text" id="roadAddrPart1" name="roadAddrPart1" /></td>
				</tr>

				<tr>
					<td id="title">고객입력 상세주소</td>
					<td><input type="text" id="addrDetail" name="addrDetail" /></td>
				</tr>

				<tr>
					<td id="title">참고주소</td>
					<td><input type="text" id="roadAddrPart2" name="roadAddrPart2" /></td>
				</tr>

				<tr>
					<td id="title">우편번호</td>
					<td><input type="text" id="zipNo" name="zipNo" /></td>
				</tr>

				<tr>
					<td id="title">기장 선택</td>
					<td><input type="radio" name="joinhairlengths" value="숏" checked>숏
						<input type="radio" name="joinhairlengths" value="턱선아래" checked>턱선 아래
						<input type="radio" name="joinhairlengths" value="어깨선아래" checked>어깨선 아래
						<input type="radio" name="joinhairlengths" value="가슴선아래" checked>가슴선 아래</td>
				</tr>
				
				<tr>
					<td id="title">머릿결 상태</td>
					<td><input type="text" name="joinhairstatus" maxlength="50"></td>
				</tr>
				
				<tr>
					<td id="title">헤어샵 요청사항</td>
					<td><textarea name="joinhairrequest" rows="4" cols="50"></textarea></td>
				</tr>

			</table>
			<br> <input type="submit" value="가입" /> <input type="button"
				value="취소">


		</form>
	</div>
</body>
</html>