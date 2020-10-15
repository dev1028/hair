<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.2/main.min.css'
	rel='stylesheet' />
<style>
/* @extend display-flex; */
display-flex, .display-flex, .display-flex-center, .signup-content,
	.signin-content, .social-login, .socials {
	display: flex;
	display: -webkit-flex;
}

/* @extend list-type-ulli; */
list-type-ulli, .socials {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

/* poppins-300 - latin */
@font-face {
	font-family: 'Poppins';
	font-style: normal;
	font-weight: 300;
	src: url("../fonts/poppins/poppins-v5-latin-300.eot");
	/* IE9 Compat Modes */
	src: local("Poppins Light"), local("Poppins-Light"),
		url("../fonts/poppins/poppins-v5-latin-300.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-300.woff2") format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-300.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-300.ttf") format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-300.svg#Poppins") format("svg");
	/* Legacy iOS */
}
/* poppins-300italic - latin */
@font-face {
	font-family: 'Poppins';
	font-style: italic;
	font-weight: 300;
	src: url("../fonts/poppins/poppins-v5-latin-300italic.eot");
	/* IE9 Compat Modes */
	src: local("Poppins Light Italic"), local("Poppins-LightItalic"),
		url("../fonts/poppins/poppins-v5-latin-300italic.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-300italic.woff2")
		format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-300italic.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-300italic.ttf")
		format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-300italic.svg#Poppins")
		format("svg");
	/* Legacy iOS */
}
/* poppins-regular - latin */
@font-face {
	font-family: 'Poppins';
	font-style: normal;
	font-weight: 400;
	src: url("../fonts/poppins/poppins-v5-latin-regular.eot");
	/* IE9 Compat Modes */
	src: local("Poppins Regular"), local("Poppins-Regular"),
		url("../fonts/poppins/poppins-v5-latin-regular.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-regular.woff2") format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-regular.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-regular.ttf")
		format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-regular.svg#Poppins")
		format("svg");
	/* Legacy iOS */
}
/* poppins-italic - latin */
@font-face {
	font-family: 'Poppins';
	font-style: italic;
	font-weight: 400;
	src: url("../fonts/poppins/poppins-v5-latin-italic.eot");
	/* IE9 Compat Modes */
	src: local("Poppins Italic"), local("Poppins-Italic"),
		url("../fonts/poppins/poppins-v5-latin-italic.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-italic.woff2") format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-italic.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-italic.ttf") format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-italic.svg#Poppins")
		format("svg");
	/* Legacy iOS */
}
/* poppins-500 - latin */
@font-face {
	font-family: 'Poppins';
	font-style: normal;
	font-weight: 500;
	src: url("../fonts/poppins/poppins-v5-latin-500.eot");
	/* IE9 Compat Modes */
	src: local("Poppins Medium"), local("Poppins-Medium"),
		url("../fonts/poppins/poppins-v5-latin-500.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-500.woff2") format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-500.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-500.ttf") format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-500.svg#Poppins") format("svg");
	/* Legacy iOS */
}
/* poppins-500italic - latin */
@font-face {
	font-family: 'Poppins';
	font-style: italic;
	font-weight: 500;
	src: url("../fonts/poppins/poppins-v5-latin-500italic.eot");
	/* IE9 Compat Modes */
	src: local("Poppins Medium Italic"), local("Poppins-MediumItalic"),
		url("../fonts/poppins/poppins-v5-latin-500italic.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-500italic.woff2")
		format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-500italic.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-500italic.ttf")
		format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-500italic.svg#Poppins")
		format("svg");
	/* Legacy iOS */
}
/* poppins-600 - latin */
@font-face {
	font-family: 'Poppins';
	font-style: normal;
	font-weight: 600;
	src: url("../fonts/poppins/poppins-v5-latin-600.eot");
	/* IE9 Compat Modes */
	src: local("Poppins SemiBold"), local("Poppins-SemiBold"),
		url("../fonts/poppins/poppins-v5-latin-600.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-600.woff2") format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-600.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-600.ttf") format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-600.svg#Poppins") format("svg");
	/* Legacy iOS */
}
/* poppins-700 - latin */
@font-face {
	font-family: 'Poppins';
	font-style: normal;
	font-weight: 700;
	src: url("../fonts/poppins/poppins-v5-latin-700.eot");
	/* IE9 Compat Modes */
	src: local("Poppins Bold"), local("Poppins-Bold"),
		url("../fonts/poppins/poppins-v5-latin-700.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-700.woff2") format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-700.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-700.ttf") format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-700.svg#Poppins") format("svg");
	/* Legacy iOS */
}
/* poppins-700italic - latin */
@font-face {
	font-family: 'Poppins';
	font-style: italic;
	font-weight: 700;
	src: url("../fonts/poppins/poppins-v5-latin-700italic.eot");
	/* IE9 Compat Modes */
	src: local("Poppins Bold Italic"), local("Poppins-BoldItalic"),
		url("../fonts/poppins/poppins-v5-latin-700italic.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-700italic.woff2")
		format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-700italic.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-700italic.ttf")
		format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-700italic.svg#Poppins")
		format("svg");
	/* Legacy iOS */
}
/* poppins-800 - latin */
@font-face {
	font-family: 'Poppins';
	font-style: normal;
	font-weight: 800;
	src: url("../fonts/poppins/poppins-v5-latin-800.eot");
	/* IE9 Compat Modes */
	src: local("Poppins ExtraBold"), local("Poppins-ExtraBold"),
		url("../fonts/poppins/poppins-v5-latin-800.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-800.woff2") format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-800.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-800.ttf") format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-800.svg#Poppins") format("svg");
	/* Legacy iOS */
}
/* poppins-800italic - latin */
@font-face {
	font-family: 'Poppins';
	font-style: italic;
	font-weight: 800;
	src: url("../fonts/poppins/poppins-v5-latin-800italic.eot");
	/* IE9 Compat Modes */
	src: local("Poppins ExtraBold Italic"), local("Poppins-ExtraBoldItalic"),
		url("../fonts/poppins/poppins-v5-latin-800italic.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-800italic.woff2")
		format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-800italic.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-800italic.ttf")
		format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-800italic.svg#Poppins")
		format("svg");
	/* Legacy iOS */
}
/* poppins-900 - latin */
@font-face {
	font-family: 'Poppins';
	font-style: normal;
	font-weight: 900;
	src: url("../fonts/poppins/poppins-v5-latin-900.eot");
	/* IE9 Compat Modes */
	src: local("Poppins Black"), local("Poppins-Black"),
		url("../fonts/poppins/poppins-v5-latin-900.eot?#iefix")
		format("embedded-opentype"),
		url("../fonts/poppins/poppins-v5-latin-900.woff2") format("woff2"),
		url("../fonts/poppins/poppins-v5-latin-900.woff") format("woff"),
		url("../fonts/poppins/poppins-v5-latin-900.ttf") format("truetype"),
		url("../fonts/poppins/poppins-v5-latin-900.svg#Poppins") format("svg");
	/* Legacy iOS */
}

a:focus, a:active {
	text-decoration: none;
	outline: none;
	transition: all 300ms ease 0s;
	-moz-transition: all 300ms ease 0s;
	-webkit-transition: all 300ms ease 0s;
	-o-transition: all 300ms ease 0s;
	-ms-transition: all 300ms ease 0s;
}

img {
	max-width: 100%;
	height: auto;
}

figure {
	margin: 0;
}

p {
	margin-bottom: 0px;
	font-size: 15px;
	color: #777;
}

h2 {
	line-height: 1.66;
	margin: 0;
	padding: 0;
	font-weight: bold;
	color: #222;
	font-family: Poppins;
	font-size: 36px;
}

.main {
	background: #f8f8f8;
	padding: 150px 0;
}

.clear {
	clear: both;
}

body {
	font-size: 13px;
	line-height: 1.8;
	color: #222;
	background: #f8f8f8;
	font-weight: 400;
	font-family: Poppins;
}

.container {
	width: 900px;
	background: #fff;
	margin: 0 auto;
	box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	-moz-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	-webkit-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	-o-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	-ms-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	border-radius: 20px;
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	-o-border-radius: 20px;
	-ms-border-radius: 20px;
}

.display-flex {
	justify-content: space-between;
	-moz-justify-content: space-between;
	-webkit-justify-content: space-between;
	-o-justify-content: space-between;
	-ms-justify-content: space-between;
	align-items: center;
	-moz-align-items: center;
	-webkit-align-items: center;
	-o-align-items: center;
	-ms-align-items: center;
}

.display-flex-center {
	justify-content: center;
	-moz-justify-content: center;
	-webkit-justify-content: center;
	-o-justify-content: center;
	-ms-justify-content: center;
	align-items: center;
	-moz-align-items: center;
	-webkit-align-items: center;
	-o-align-items: center;
	-ms-align-items: center;
}

.position-center {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.signup {
	margin-bottom: 150px;
}

.signup-content {
	padding: 75px 0;
}

.signup-form, .signup-image, .signin-form, .signin-image {
	width: 50%;
	overflow: hidden;
}

.signup-image {
	margin: 0 55px;
}

.form-title {
	margin-bottom: 33px;
}

.signup-image {
	margin-top: 45px;
}

figure {
	margin-bottom: 50px;
	text-align: center;
}

.form-submit {
	display: inline-block;
	background: #6dabe4;
	color: #fff;
	border-bottom: none;
	width: auto;
	padding: 15px 39px;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-o-border-radius: 5px;
	-ms-border-radius: 5px;
	margin-top: 25px;
	cursor: pointer;
}

.form-submit:hover {
	background: #4292dc;
}

#signin {
	margin-top: 16px;
}

.signup-image-link {
	font-size: 14px;
	color: #222;
	display: block;
	text-align: center;
}

.term-service {
	font-size: 13px;
	color: #222;
}

.signup-form {
	margin-left: 75px;
	margin-right: 75px;
	padding-left: 34px;
}

.register-form {
	width: 100%;
}

.form-group {
	position: relative;
	margin-bottom: 25px;
	overflow: hidden;
}

.form-group:last-child {
	margin-bottom: 0px;
}

.agree-term {
	display: inline-block;
	width: auto;
}

label {
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-webkit-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	color: #222;
}

.label-has-error {
	top: 22%;
}

label.error {
	position: relative;
	background: url("../images/unchecked.gif") no-repeat;
	background-position-y: 3px;
	padding-left: 20px;
	display: block;
	margin-top: 20px;
}

label.valid {
	display: block;
	position: absolute;
	right: 0;
	left: auto;
	margin-top: -6px;
	width: 20px;
	height: 20px;
	background: transparent;
}

label.valid:after {
	font-family: 'Material-Design-Iconic-Font';
	content: '\f269';
	width: 100%;
	height: 100%;
	position: absolute;
	/* right: 0; */
	font-size: 16px;
	color: green;
}

.label-agree-term {
	position: relative;
	top: 0%;
	transform: translateY(0);
	-moz-transform: translateY(0);
	-webkit-transform: translateY(0);
	-o-transform: translateY(0);
	-ms-transform: translateY(0);
}

.material-icons-name {
	font-size: 18px;
}

.signin-content {
	padding-top: 67px;
	padding-bottom: 87px;
}

.social-login {
	align-items: center;
	-moz-align-items: center;
	-webkit-align-items: center;
	-o-align-items: center;
	-ms-align-items: center;
	margin-top: 80px;
}

.social-label {
	display: inline-block;
	margin-right: 15px;
}

.socials li {
	padding: 5px;
}

.socials li:last-child {
	margin-right: 0px;
}

.socials li a {
	text-decoration: none;
}

.socials li a i {
	width: 30px;
	height: 30px;
	color: #fff;
	font-size: 14px;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-o-border-radius: 5px;
	-ms-border-radius: 5px;
	transform: translateZ(0);
	-moz-transform: translateZ(0);
	-webkit-transform: translateZ(0);
	-o-transform: translateZ(0);
	-ms-transform: translateZ(0);
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-property: transform;
	transition-property: transform;
	-webkit-transition-timing-function: ease-out;
	transition-timing-function: ease-out;
}

.socials li:hover a i {
	-webkit-transform: scale(1.3) translateZ(0);
	transform: scale(1.3) translateZ(0);
}

.zmdi-facebook {
	background: #3b5998;
}

.zmdi-twitter {
	background: #1da0f2;
}

.zmdi-google {
	background: #e72734;
}

.signin-form {
	margin-right: 90px;
	margin-left: 80px;
}

.signin-image {
	margin-left: 110px;
	margin-right: 20px;
	margin-top: 10px;
}

@media screen and (max-width: 1200px) {
	.container {
		width: calc(100% - 30px);
		max-width: 100%;
	}
}

@media screen and (min-width: 1024px) {
	.container {
		max-width: 1200px;
	}
}

@media screen and (max-width: 768px) {
	.signup-content, .signin-content {
		flex-direction: column;
		-moz-flex-direction: column;
		-webkit-flex-direction: column;
		-o-flex-direction: column;
		-ms-flex-direction: column;
		justify-content: center;
		-moz-justify-content: center;
		-webkit-justify-content: center;
		-o-justify-content: center;
		-ms-justify-content: center;
	}
	.signup-form {
		margin-left: 0px;
		margin-right: 0px;
		padding-left: 0px;
		/* box-sizing: border-box; */
		padding: 0 30px;
	}
	.signin-image {
		margin-left: 0px;
		margin-right: 0px;
		margin-top: 50px;
		order: 2;
		-moz-order: 2;
		-webkit-order: 2;
		-o-order: 2;
		-ms-order: 2;
	}
	.signup-form, .signup-image, .signin-form, .signin-image {
		width: auto;
	}
	.social-login {
		justify-content: center;
		-moz-justify-content: center;
		-webkit-justify-content: center;
		-o-justify-content: center;
		-ms-justify-content: center;
	}
	.form-button {
		text-align: center;
	}
	.signin-form {
		order: 1;
		-moz-order: 1;
		-webkit-order: 1;
		-o-order: 1;
		-ms-order: 1;
		margin-right: 0px;
		margin-left: 0px;
		padding: 0 30px;
	}
	.form-title {
		text-align: center;
	}
}

@media screen and (max-width: 400px) {
}

/*# sourceMappingURL=style.css.map */
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>
var okToUseEmail = false;
	$(function(){
		$("#checkOwnerDesSame1").on("click", function(){
				var hsemail = $('#owner_email').val();
				if(hsemail != ""){
					$.ajax({
				        type:"POST",
				        url:"${pageContext.request.contextPath}/ajax/designerEmailUse.do",
				        data : {hs_email : hsemail},
				        dataType : "json",
				        success: function(data){
				            if(data==0 || data==1){
				            	$("#smallEmail").text("해당 메일은 사용가능합니다.");
				            	$('#owner_email').attr("readonly", true);
				            	if(data == 1){
				            		$("#checkOwnerDesEmailExist").val("Y");
				            	} else {
				            		$("#checkOwnerDesEmailExist").val("N");
				            	}
				            	okToUseEmail = true;
				            } else {
				            	$("#smallEmail").text("해당 메일은 사용불가능 합니다.").css('color', 'red');
				            	$('#owner_email').attr("readonly", false);
				            	okToUseEmail = false;
				            }
				        }
				    });
				}
			$("#staticBackdrop").modal('toggle');
		});
		
		$("#btnDesignerInsert1").on("click", function(){
			if(okToUseEmail){
				$("#designer_email").val($('#owner_email').val());
				$("#position").val($('#owner_position').val());
				$("#designer_phone").val($('#owner_phone').val());
				$("#staticBackdrop").modal('hide');
			} else {
				alert("이메일을 다시한번 확인해 주세요.");
			}
		});
		
		$("#owner_email").on("focusout", function(){
			var hsemail = $('#owner_email').val();
			if(hsemail != ""){
				$.ajax({
			        type:"POST",
			        url:"${pageContext.request.contextPath}/ajax/designerEmailUse.do",
			        data : {hs_email : hsemail},
			        dataType : "json",
			        success: function(data){
			            if(data==0 || data==1){
			            	$("#smallEmail").text("해당 메일은 사용가능합니다.");
			            	if(data == 1){
			            		$("#checkOwnerDesEmailExist").val("Y");
			            	} else {
			            		$("#checkOwnerDesEmailExist").val("N");
			            	}
			            	okToUseEmail = true;
			            } else {
			            	$("#smallEmail").text("해당 메일은 사용불가능 합니다.").css('color', 'red');
			            	$('#owner_email').attr("readonly", false);
			            	okToUseEmail = false;
			            }
			        }
			    });
			}
		});
		
		$("#hs_fulladdr").on("click", function(){
			goPopup();
			
		});
		
		$("#btnSubmit").on("click", function(){
			//am pm 처리
			var starttime24 = 0;
			var endtime24 = 0;
			if($("#startAmPm option:selected").val() == "pm"){
				starttime24 = 12;
			}
			$("#hs_starttime").val(parseInt(starttime24)+parseInt($("#hs_starttimebefore option:selected").val()));
			
			if($("#endAmPm option:selected").val() == "pm"){
				endtime24 = 12;
			}
			$("#hs_endtime").val(parseInt(endtime24)+parseInt($("#hs_endtimebefore option:selected").val()));

			
			if($("#hs_fulladdr").val() == ''){
				alert("주소를 입력해주세요.");
				return;
			}
			if(parseInt($("#hs_starttime").val()) >= parseInt($("#hs_endtime").val())){
				alert("영업종료시간이 영업시작시간보다 이릅니다. 수정 후 등록하세요.");
				return;
			} 
			
			
			if(!$('input:radio[name=hs_resource_option]').is(':checked')){
				alert("자재사용여부를 체크해주세요.");
				return;
			}
			if(!$('input:radio[name=hs_parking]').is(':checked')){
				alert("주차장 여부를 체크해주세요.");
				return;
			}
			
			if(!$('input:radio[name=checkOwnerDesSame]').is(':checked')){
				alert("직원등록여부를 체크해주세요.");
				return;
			} else{
				$("#checkOwnerDesSame1").prop('checked')
				if(!okToUseEmail){
					alert("직원등록의 이메일을 확인해 주세요.");
					return;
				}	
			}
			
			if($("#owner_email").val() != $("#designer_email").val()){
				$("#checkOwnerDesEmailSame").val("N");
			}

			//휴무일 처리
			var dayoff = "";
			for(var i =0; i<$("#hs_dayoffgroup").find(":checked").length-1; i++){
				dayoff += ($("#hs_dayoffgroup").find(":checked").eq(i).val() + ",");
			}
			dayoff += $("#hs_dayoffgroup").find(":checked").eq($("#hs_dayoffgroup").find(":checked").length-1).val();
			
			$("#hs_dayoff").val(dayoff);
			
			$("#register-form").submit();				
					
		});
		
		
		
	});

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
	<div class="main">
		<div class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">추가정보입력</h2>
						<span>이제 조금만 더 적으면 됩니다.</span>
						<hr>
						<form method="post" class="register-form" id="register-form" action="${pageContext.request.contextPath}/ajax/hairshopJoinFin.do">
							<div  class="form-group">
								<span>미용실 주소를 찾아주세요.</span><br>
								<input type="text" class="form-control form-control-sm" name ="hs_fulladdr" id="hs_fulladdr" placeholder="여기를 눌러주세요." readonly>
									<input type="hidden" name="hs_cityaddr" id="hs_cityaddr" value=""> 
									<input type="hidden" name="hs_townaddr" id="hs_townaddr" value=""> 
									<input type="hidden" name="hs_streetaddr" id="hs_streetaddr" value=""> 
									<input type="hidden" name="hs_latlong" id="hs_latlong" value=""> 
									<input type="hidden" name="hs_no" value="${hairshop.hs_no}">
									<input type="hidden" name="hs_name" value="${hairshop.hs_name}">
									<input type="hidden" name="hs_comp_no" value="${hairshop.hs_comp_no}">
									<input type="hidden" name="hs_owner" value="${hairshop.hs_owner}">
									<input type="hidden" name="hs_email" value="${hairshop.hs_email}">
									<input type="hidden" name="hs_pw" value="${hairshop.hs_pw}">
									<input type="hidden" name="hs_tel" value="${hairshop.hs_tel}">
									
							</div>
							<hr>
							<div  class="form-group">
								<span>영업시작 시간을 알려주세요.</span> <select id="startAmPm"
									class="form-control form-control-sm">
									<option value="am">AM
									<option value="pm">PM
								</select> <select class="form-control form-control-sm" id="hs_starttimebefore">
									<option value="0">00
									<option value="1">01
									<option value="2">02
									<option value="3">03
									<option value="4">04
									<option value="5">05
									<option value="6">06
									<option value="7">07
									<option value="8">08
									<option value="9">09
									<option value="10">10
									<option value="11">11
									
								</select>
								<input type="hidden" name="hs_starttime" id="hs_starttime" value="">
							</div>
							<hr>
							<div  class="form-group">
								<span>영업종료 시간을 알려주세요.</span> <select
									class="form-control form-control-sm" id="endAmPm">
									<option value="am">AM
									<option value="pm">PM
								</select> <select class="form-control form-control-sm" id="hs_endtimebefore">
									<option value="0">00
									<option value="1">01
									<option value="2">02
									<option value="3">03
									<option value="4">04
									<option value="5">05
									<option value="6">06
									<option value="7">07
									<option value="8">08
									<option value="9">09
									<option value="10">10
									<option value="11">11
									<option value="12">12
								</select>
								<input type="hidden" name="hs_endtime" id="hs_endtime" value="">
							</div>
							<hr>
							<div  class="form-group" id="hs_dayoffgroup">
								<span>휴무일이 있으면 알려주세요!</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="form-check-input" type="checkbox" id="hs_dayoff2" value="2">&nbsp;월<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="form-check-input" type="checkbox" id="hs_dayoff3" value="3">&nbsp;화<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="form-check-input" type="checkbox" id="hs_dayoff4" value="4">&nbsp;수<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="form-check-input" type="checkbox" id="hs_dayoff5" value="5">&nbsp;목<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="form-check-input" type="checkbox" id="hs_dayoff6" value="6">&nbsp;금<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="form-check-input" type="checkbox" id="hs_dayoff7" value="7">&nbsp;토<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="form-check-input" type="checkbox" id="hs_dayoff1" value="1">&nbsp;일
								<input type="hidden" name="hs_dayoff" id="hs_dayoff" value="">
							</div>
							<hr>
							<div  class="form-group">
								<span>자재관리 서비스를 이용하실건가요?</span><br> <input type="radio" name="hs_resource_option" value="1" disabled>
								사용 <small>(서비스 준비중입니다.)</small><br>
								<input type="radio" name="hs_resource_option" value="0"> 안함
							</div>
							<hr>
							<div  class="form-group">
								<span>미용실을 위한 주차장이 있나요?</span><br> <input type="radio" name="hs_parking" value="1">
								있음 <br> <input type="radio" name="hs_parking" value="0"> 없음
							</div>
							<hr>
							<div  class="form-group">
								<span class="badge badge-pill badge-danger">중요</span><span> 본인을 디자이너로 등록할까요?</span><br> <input type="radio" id="checkOwnerDesSame1" name="checkOwnerDesSame" value="Y">
								등록 <br> <input id="checkOwnerDesSame2" type="radio" name="checkOwnerDesSame" value="N"> 안함
								
								<input type="hidden" id ="designer_email" name="designer_email" value="">
								<input type="hidden" id ="position" name="position" value="">
								<input type="hidden" id ="designer_phone" name="designer_phone" value="">
								<input type="hidden" id ="checkOwnerDesEmailSame" name="checkOwnerDesEmailSame" value="Y">
								<input type="hidden" id ="checkOwnerDesEmailExist" name="checkOwnerDesEmailExist" value="N">
								
							</div>
							<div  class="form-group">
								<button class="btn btn-primary btn-sm" type="button" id="btnSubmit">회원가입 승인요청</button>
							</div>
						</form>
					</div>
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
	
	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">본인을 디자이너로 추가 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="designerInsertFrm"
						action="#"
						method="post">
						<div class="form-group">
							<span><strong>디자이너 이름</strong></span> <input
								type="text" class="form-control" id="owner_name"
								name="designer_name" placeholder="홍길동" value="${hairshop.hs_owner}" readonly>
						</div>
						<div class="form-group">
							<span><strong>직급</strong></span> <input
								type="text" class="form-control" id="owner_position"
								name="position" placeholder="직급을 입력하세요." value="원장">
						</div>
						<div class="form-group">
							<span><strong>이메일</strong></span> <input
								type="email" class="form-control" id="owner_email"
								name="designer_email" aria-describedby="emailHelp"
								placeholder="name@example.com" value="${hairshop.hs_email}" readonly> <small
								class="form-text text-muted" id="smallEmail"></small>
						</div>
						<div class="form-group">
							<span><strong>비밀번호</strong></span> <input
								type="password" class="form-control" id="owner_pw"
								name="designer_pw" placeholder="디자이너가 로그인할 초기 비밀번호입니다." readonly value="${hairshop.hs_pw}">
							<small id="emailHelp" class="form-text text-muted">비밀번호는 헤어샵 비밀번호와 동일합니다.</small>
						</div>
						<div class="form-group">
							<span><strong>전화번호</strong></span> <input
								type="text" class="form-control" id="owner_phone"
								name="designer_phone" placeholder="010-0000-0000" value="${hairshop.hs_tel}">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						id="btnDesignerInsert1">확인</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>