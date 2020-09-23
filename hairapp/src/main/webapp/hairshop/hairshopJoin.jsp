<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hairshopJoin</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="hairshopJoin-font.min.css">
<link rel="stylesheet" href="hairshopJoin.css">
<script type="text/javascript">
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

	}
</script>
</head>
<body>
	<div class="main">

		<!-- Sign up form -->
		<div class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">헤어샵 회원가입</h2>
						<form method="POST" class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="hs_name" id="hs_name"
									placeholder="헤어샵 이름을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="hs_owner" id="hs_owner"
									placeholder="대표자명을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="hs_email" id="hs_email"
									placeholder="이메일을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="hs_pw" id="hs_pw"
									placeholder="비밀번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" id="re_pass" placeholder="비밀번호 확인" />
							</div>
							<!--   <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div> -->
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name=hs_comp_no id="hs_comp_no"
									placeholder="사업자번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="your_name" id="your_name"
									placeholder="주소" readonly="readonly"/>
									
							</div>
							<div class="form-group">
							<button type="button" id="findMyRoad">도로명 주소 검색</button>
							</div>
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="your_name" id="your_name"
									placeholder="시작시간" />
							</div>
							<div class="form-group">
								<select>
									<option> AM
									<option> PM
								</select>
								<select>
									<option> 0
									<option> 1
								</select>
							</div>
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="your_name" id="your_name"
									placeholder="종료시간" />
							</div>
							<div class="form-group">
								<select>
									<option> AM
									<option> PM
								</select>
								<select>
									<option> 0
									<option> 1
								</select>
							</div>
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="your_name" id="your_name"
									placeholder="자재관리유무" />
							</div>
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="your_name" id="your_name"
									placeholder="주차장" />
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="../images/hairshop/signup-image.jpg"
								alt="sing up image">
						</figure>

					</div>
				</div>
				<div>1</div>
			</div>
		</div>
	</div>
	<script src="hairshopJoin.js"></script>
</body>
</html>