<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersDelete</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<style>
#mypage {
	display: flex;
	position:absolute;
	top:100px;
	left:0px;
}

#wrap{
	top:50px;
	left:400px;
    position: absolute;
    margin:0 auto;
} 
</style>
<script>
       
	// 비밀번호 미입력시 경고창
	function checkValue() {
		if (!document.deleteform.mempw.value) {
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
		return true;
	}
	
	function membersMain() {
		location.href = "membersMain.do";
	}
	
</script>
</head>
<body>
<div id="wrap">

<form name="deleteform" method="post" action="membersDeleteS.do" onsubmit="return checkValue()">
        <br><br><br>
        <h3>회원 탈퇴 유의사항</h3>
        <hr><br>
        탈퇴와 동시에 회원님의 개인정보 및 모든 이용정보가 그 즉시 삭제되며 절대 복구 할 수 없습니다.<br>
        내 포인트, 쿠폰, 예약 항목, 북마크, 결제 내역 등 모든 기록이 재생할 수 없는 기술적 방법을<br>
        사용하여 완전히 파기됩니다.<br>
        <br>
        Q&A게시판에서 환불 신청을 하지 않거나 환불이 처리되기 전에 탈퇴하면 환불이 불가능합니다.<br>
	<br>
	'우동'은 회원 탈퇴 후 개인정보 유효기간제에 따라 10년간 서비스를 이용하지 않은 회원의 개인정보를 별도로<br>
	분리 보관하며, 10년 후 삭제가 완료됩니다. 동의하시면 비밀번호를 입력 후 회원탈퇴를 눌러주세요<br>
 <br>
 비밀번호를 입력하시면 탈퇴처리가 완료됩니다.<br>
 <br><br>
        <table>
            <tr>
                <td>비밀번호 :&nbsp;</td>
                <td><input type="password" id="mempw" name="mempw" maxlength="15"></td>
            </tr>
        </table>
        
        <br><br>
        <input type="hidden" name="mememail">
        <button type="button" class="btn btn-outline-primary" onclick="membersMain()">취소</button>
        <button type="submit" class="btn btn-outline-danger" name="memdelete">탈퇴</button>
</form>

</div>


<div id="mypage">
	<%@include file="/decorator/membersMypage.jsp" %>
</div>
</body>
</html>