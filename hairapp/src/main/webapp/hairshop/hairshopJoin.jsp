<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hairshopJoin</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="hairshopJoin-font.min.css">
<link rel="stylesheet" href="hairshopJoin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
var emailOK = false;

$(function(){
	
	$('#btnjoinpre').on("click", function(){
		var cnt = 0;
		$('#register-form').find("input").each(function(){
			if($(this).val() == ""){
				cnt++;
			}
		});
 		if(cnt != 0) {
			alert("모든 값을 입력하세요");
		} else {
			if(emailOK && checkPW()) {
				$('#register-form').submit();
			}  else {
				alert("입력이 안된 값이 있습니다.");
			}
			
		} 
	});
	
	$("#re_pass").on("focusout", function(){
		if(checkPW()){
			alert("비밀번호가 일치합니다.")
		} else{
			alert("비밀번호가 일치하지않습니다.")
		}
		
	});
	
	$('#hs_email').on("focusout", function(){
		var hsemail = $('#hs_email').val();
		if(checkEmail(hsemail) && hsemail != ""){
			$.ajax({
		        type:"POST",
		        url:"${pageContext.request.contextPath}/ajax/hairshopEmailUse.do",
		        data : {hs_email : hsemail},
		        dataType : "json",
		        success: function(data){
		            if(data != 0){
		    			//$('#emailChecking').css('color', 'red').text('이미 등록된 이메일입니다.');
		    			alert("이미 등록된 이메일입니다.");
		    			$('#hs_email').val("");
		    			emailOK = false;
		    		} else	{
		    			alert("사용가능한 이메일입니다.");
		    			emailOK = true;
		    			//$('#emailChecking').css('color', 'gray').text('사용 가능한 이메일입니다.');
		    			
		    		}
		        }
		    });
		} else if(hsemail == "") {
			emailOK = false;
			//alert("이메일을 제대로 입력하세요.");
			//$('#emailChecking').css('color', 'red').text('이메일을 입력하세요');
		} else {
			emailOK = false;
			alert("이메일을 제대로 입력하세요.");
		}
	}); //email 사용가능여부
	
	$("#hs_comp_no").on("focusout", nCheck);
	$("#hs_tel").on("focusout", nCheck);
});

function nCheck(){
    var numCheck = $(this).val();
    if(/[^0123456789-]/g.test(numCheck)){
        alert("번호는 숫자와 특수문자'-'만 입력이 가능합니다.");
        $(this).val("");
    }
}
function checkEmail(str){                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            
          return false;         
     }                            
     else {                       
         return true;         
     }                            
}
function checkPW() {
    var p1 = document.getElementById('hs_pw').value;
    var p2 = document.getElementById('re_pass').value;
    if( p1 != p2 ) {
      
      return false;
    } else{
      return true;
    }

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
						<form method="POST" class="register-form" id="register-form" action="${pageContext.request.contextPath}/ajax/hairshopJoinPre.do">
							<div class="form-group">
								<label for="hs_name"><i
									class="zmdi zmdi-case"></i></label> <input
									type="text" name="hs_name" id="hs_name" value=""
									placeholder="헤어샵 이름을 입력하세요." />
							</div>
							<div class="form-group">
								<label for="hs_comp_no"><i
									class="zmdi zmdi-assignment-account"></i></label> <input
									type="text" name=hs_comp_no id="hs_comp_no" value=""
									placeholder="사업자번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="hs_owner"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="hs_owner" id="hs_owner" value=""
									placeholder="대표자명을 입력하세요." />
							</div>
							<div class="form-group">
									
								<label for="hs_email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="hs_email" id="hs_email" value=""
									placeholder="이메일을 입력하세요." />
									<span id="emailChecking"></span>
							</div>
							<div class="form-group">
								<label for="hs_pw"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="hs_pw" id="hs_pw" value=""
									placeholder="비밀번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" id="re_pass" value="" placeholder="비밀번호 확인" />
								<span></span>
							</div>
							<div class="form-group">
								<label for="hs_tel"><i
									class="zmdi zmdi-smartphone"></i></label> <input
									type="text" name="hs_tel" id="hs_tel" value=""
									placeholder="전화번호를 입력하세요." />
							</div>
							<!--   <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div> -->
							
							<div>
								<button class="btn btn-primary" id="btnjoinpre" type="button">회원가입</button>
							</div>
						</form>
					</div>
					<br>
					<div class="signup-image">
						<figure>
							<img src="../images/hairshop/signin-image.jpg"
								alt="sing in image">
						</figure>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script src="hairshopJoin.js"></script>
</body>
</html>