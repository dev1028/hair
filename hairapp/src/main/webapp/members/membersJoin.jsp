<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersJoin.jsp</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>

<style>
#mypage {
	display: flex;
	position:absolute;
	top:100px;
	left:0px;
}
	
#wrap{
	top:70px;
	left:340px;
    position:absolute;
    margin:0 auto;
    }

    
/* 조인css부분 */
*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
}

#formjoin {
  max-width: 1400px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

button {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #90adb6;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #94abb2;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #69909c;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}

@media screen and (min-width: 480px) {

  form {
    max-width: 480px;
  }

} 

</style>
<script>

	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.formjoin.joinemail.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.formjoin.joinpw.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.formjoin.joinpw.value != document.formjoin.joinpwcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if(!formjoin.joinname.value){
            alert("이름을 입력하세요.");
            return false;
        }
        
        if(!formjoin.joinbirth.value){
            alert("생년월일을 입력하세요.");
            return false;
        }

        if(!formjoin.joinphone.value){
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
        document.formjoin.idDuplication.value ="idUncheck";
    }
    

	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다.
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
		document.formjoin.roadFullAddr.value = roadFullAddr;
		document.formjoin.roadAddrPart1.value = roadAddrPart1;
		document.formjoin.roadAddrPart2.value = roadAddrPart2;
		document.formjoin.addrDetail.value = addrDetail;
		document.formjoin.zipNo.value = zipNo;
		document.formjoin.mem_latitude_longitude.value = (entX + "," + entY);
		
	}
</script>

</head>
<body>
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
		<br> <br> <h4 style="font-weight: bold;">회원가입</h4>
		<hr style="border: 2px solid #6d7fcc;"><br>


		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post" action="membersJoinS.do"
			name="formjoin" id="formjoin" onsubmit="return checkValue()">
			<!-- <table>
				<tr>
					<td id="title">이메일(아이디)</td>
					<td><input type="email" name="joinemail" maxlength="50" onkeydown="inputIdChk()"
						placeholder="sample@naver.com 형식">
						<input type="button" value="중복확인" onclick="openIdChk()">
						<input type="hidden" name="idDuplication" value="idUncheck" ></td>
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
						placeholder="ex) 010-0000-0000"></td>
				</tr>

				<tr>
					<td id="title">생일</td>
					<td><input type="date" id="joinbirth" name="joinbirth"></td>
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
			<input type="button"value="취소" onclick="goFirstForm()"> -->
			
			
	<!-- 조인css부분 -->
		<fieldset>
          <legend><span class="number">1</span>Your basic info</legend><br>
          <label for="mail"><img src="../images/members/check.png" style="width: 30px; height: 30px;"> Email:</label>
          <input type="email" id="mail" name="joinemail" maxlength="50" onkeydown="inputIdChk()"
			placeholder="sample@naver.com 형식">
			<input type="button" value="중복확인" onclick="openIdChk()">
			<input type="hidden" name="idDuplication" value="idUncheck" ><br><br>
			
          <label for="password"><img src="../images/members/check.png" style="width: 30px; height: 30px;"> Password:</label>
          <input type="password" id="joinpw" name="joinpw" maxlength="15"
			placeholder="15자 내로 적어주세요">
			
			<label for="password"><img src="../images/members/check.png" style="width: 30px; height: 30px;"> Password 재확인:</label>
			<input type="password" id="joinpwcheck" name="joinpwcheck" maxlength="15"
				placeholder="비밀번호 재입력">
          
          <label for="name"><img src="../images/members/check.png" style="width: 30px; height: 30px;"> 이름:</label>
          <input type="text" id="name" name="joinname" maxlength="10">
          
          <label for="phone"><img src="../images/members/check.png" style="width: 30px; height: 30px;"> 전화번호:</label>
          <input type="text" name="joinphone" placeholder="ex) 010-0000-0000">
          
          <label for="birth"><img src="../images/members/check.png" style="width: 30px; height: 30px;"> 생일:</label>
          <input type="date" id="joinbirth" name="joinbirth">
          
          <label><img src="../images/members/check.png" style="width: 30px; height: 30px;"> 성별:</label><br>
          <input type="radio" name="joingender" value="male"><label for="under_13" class="light">남</label>&emsp;
          <input type="radio" name="joingender" value="female" checked><label for="over_13" class="light">여</label>
        <br>
        
        <br><label><img src="../images/members/check.png" style="width: 30px; height: 30px;"> 도로명주소 전체:</label>
        <input type="text" id="roadFullAddr" name="roadFullAddr" placeholder="팝업을 먼저 눌러주세요" />
        <input type="button" onClick="goPopup();" value="팝업" /><br><br>
         
         <label>도로명주소:</label>
         <input type="text" id="roadAddrPart1" name="roadAddrPart1" />
         
         <label>고객입력 상세주소:</label>
         <input type="text" id="addrDetail" name="addrDetail" />
        
        <label>참고주소:</label>
        <input type="text" id="roadAddrPart2" name="roadAddrPart2" />
        <input type="hidden" id="mem_latitude_longitude" name="mem_latitude_longitude">
        <label>우편번호:</label>
        <input type="text" id="zipNo" name="zipNo" />
        
        </fieldset>
        <br>
        <fieldset>
          <legend><span class="number">2</span>Your hair status</legend><br>
          
          <label>기장 선택:</label><br>
          <input type="radio" name="joinhairlengths" value="u1" checked><label for="under_13" class="light">숏</label><br>
          <input type="radio" name="joinhairlengths" value="u2"><label for="over_13" class="light">턱선아래</label><br>
          <input type="radio" name="joinhairlengths" value="u3"><label for="over_13" class="light">어깨선아래</label><br>
          <input type="radio" name="joinhairlengths" value="u4"><label for="over_13" class="light">가슴선아래</label><br>
          
          
          <br><label>머릿결 상태:</label><br>
          <input type="radio" name="joinhairstatus" value="o1" checked><label for="under_13" class="light">정상모발</label><br>
          <input type="radio" name="joinhairstatus" value="o2"><label for="over_13" class="light">손상모발</label><br>
          <input type="radio" name="joinhairstatus" value="o3"><label for="over_13" class="light">극손상모발</label><br>
          <input type="radio" name="joinhairstatus" value="o4"><label for="over_13" class="light">탈색모모발</label><br>

        </fieldset><br>
        
        <button type="submit">가입</button>
	<!-- 조인css 끝나는부분 -->
			
		</form>
	</div>
	
	<div id="mypage">
	<%@include file="/decorator/membersLoginSIgn.jsp" %>
	</div>
	
</body>
</html>