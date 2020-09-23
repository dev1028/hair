<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersJoin.jsp</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../common/datepicker.js"></script>
<link href="../common/datepicker.css" rel="stylesheet" />
<style>
#mypage {
	display: flex;
	position:absolute;
	top:100px;
	left:0px;
}
	
#wrap {
	top:50px;
	right:500px;
    position:absolute;
    margin:0 auto;
}

</style>
<script>
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.form.joinemail.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.form.joinpw.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.form.joinpw.value != document.form.joinpwcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if(!form.joinname.value){
            alert("이름을 입력하세요.");
            return false;
        }
        
        if(!form.joinbirth.value){
            alert("생년월일을 입력하세요.");
            return false;
        }

        if(!form.joinphone.value){
            alert("전화번호를 입력하세요.");
            return false;
        }

        return true;
    }
    
    // 취소 버튼 클릭시 첫화면으로 이동
    function goFirstForm() {
        location.href="membersLogin.jsp";
    }    
    
    // 아이디 중복체크 화면open
    function openIdChk(){
    
        window.name = "parentForm";
        window.open("IdCheckForm.jsp",
                "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
    }

    // 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
    // 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
    // 다시 중복체크를 하도록 한다.
    function inputIdChk(){
        document.form.idDuplication.value ="idUncheck";
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
	
	function emailSand() {
		location.href="memberJoinEmail.do";
	}
	
</script>

</head>
<body>
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap" style="float:right;">
		<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br> <br>


		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post"
			action="membersJoinS.do"
			name="form" id="form" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">이메일(아이디)</td>
					<td><input type="email" name="joinemail" maxlength="50" onkeydown="inputIdChk()"
						placeholder="sample@naver.com 형식">
						<input type="button" value="중복확인" onclick="openIdChk()">
						<input type="hidden" name="idDuplication" value="idUncheck" >
						<input type="button" value="인증" onclick="emailSand()"></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="joinpw" maxlength="15"
						placeholder="15자 내로 적어주세요"></td>
				</tr>

				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="joinpwcheck" maxlength="15"
						placeholder="비밀번호 재입력"></td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="joinname" maxlength="50"></td>
				</tr>

				<tr>
					<td id="title">휴대전화</td>
					<td><input type="text" name="joinphone"
						placeholder="010-000-0000"></td>
				</tr>

				<tr>
					<td id="title">생일</td>
					<td><input type="text" id="datepicker" name="joinbirth"></td>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="joingender" value="male">남
						<input type="radio" name="joingender" value="female" checked>여</td>
				</tr>

				<tr>
					<td id="title">도로명주소 전체</td>
					<td><input type="text" id="roadFullAddr" name="roadFullAddr"
						placeholder="팝업을 먼저 눌러주세요" /> <input type="button"
						onClick="goPopup();" value="팝업" /></td>
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
					<td><input type="radio" name="joinhairlengths" value="short" checked>숏
					<input type="radio" name="joinhairlengths" value="jawline">턱선 아래
					<input type="radio" name="joinhairlengths" value="shoulderline">어깨선 아래
					<input type="radio" name="joinhairlengths" value="chestline">가슴선 아래</td>
				</tr>

				<tr>
					<td id="title">머릿결 상태</td>
					<td><input type="radio" name="joinhairstatus" value="normal" checked>정상 모발
					<input type="radio" name="joinhairstatus" value="damaged">손상 모발
					<input type="radio" name="joinhairstatus" value="extremedamage">극손상 모발
					<input type="radio" name="joinhairstatus" value="bleachedhair">탈색모 모발</td>
				</tr>
			</table>
			<br> <input type="submit" value="가입" />
			<input type="button"value="취소" onclick="goFirstForm()">


		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
	</div>
</body>
</html>