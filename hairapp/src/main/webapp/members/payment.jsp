<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>예약 및 결제하기</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="../css/membersHairshop.css">

<link rel="stylesheet" type="text/css" href="../css/popup.css">
<style>
/* 슬라이더 */
input.set { display:none; }

#slide1:checked ~ .mask .overflow { margin-left:0; }
#slide2:checked ~ .mask .overflow { margin-left:-100%; }

#slides { margin:35px auto; width:80%; position:relative; 
text-align:center; font-family:Helvetica; font-size:3em; color:white;}

#slides .mask { width:90%; overflow:hidden; margin:auto; }

#slides .overflow { width:400%; -webkit-transform:translateZ(0); -webkit-transition:all 0.5s ease-out; -moz-transition:all 0.5s ease-out; -o-transition:all 0.5s ease-out; transition:all 0.5s ease-out; }

#slides .slide { width:25%; height:200px; line-height:200px; float:left; background:#fff; }

#controls { width:100%; }

#controls label { display:none; width:5%; height:60px; opacity:0.3; position:absolute; top:50%; margin-top:-30px; cursor:pointer; background:#000; }

#controls label:hover { opacity:0.8; }

#slide1:checked ~ #controls label:nth-child(2) { right:0; display:block; }

#slide2:checked ~ #controls label:nth-child(1), #slide3:checked ~ #controls label:nth-child(2) { left:0; display:block; }
/* 슬라이더끝 */


/* 결제ui */
#menubar2 {
	width:900px;
	height:50px;
	background-color: #b0b4c2;
}
#shopdata2 {
	position:absolute;
	left:2%;
	top:15px;
	-webkit-text-stroke-width: medium;
}

#menubar3 {
	width:900px;
	height:50px;
	background-color: #b0b4c2;
}
#shopdata3 {
	position:absolute;
	left:2%;
	top:393px;
	-webkit-text-stroke-width: medium;
}

/* 결제ui끝 */

/* 테이블 */
.tbl {
  border-collapse: collapse;
}

.tbl th {
  background: #ccc;
  border: 1px solid #8c8a8a;
  width: 300px;
}

.tbl td {
  border: 1px solid #ccc;
  padding: 8px;
  width: 550px;
}

tr:nth-child(even) {
  background: #efefef;
}

tr:hover {
  background: #d1d1d1;
}
/* 테이블끝 */

/* 버튼 */
.buttons {
    margin: 10%;
    text-align: center;
}

.btn-hover {
    width: 800px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 55px;
    text-align:center;
    border: none;
    background-size: 300% 100%;

    border-radius: 50px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:focus {
    outline: none;
}
.btn-hover.color-3 {
    background-image: linear-gradient(to right, #667eea, #764ba2, #6B8DD6, #8E37D7);
    box-shadow: 0 4px 15px 0 rgba(116, 79, 168, 0.75);
}
/* 버튼끝 */

#shopdata {
    position: absolute;
    left: 2%;
    top: 10%
 }
 
</style>
</head>
<body>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>   
<script>
function setCookie(name, value, expiredays){
  	var todayDate = new Date();
   	todayDate.setDate (todayDate.getDate() + expiredays);
   	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
}

 
function layer_popup(el){
	var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
    	$elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();
        // 화면의 중앙에 레이어를 띄운다.
	if ($elHeight < docHeight || $elWidth < docWidth) {
		$el.css({
        	marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
		})
	} else {
    	$el.css({top: 0, left: 0});
	}

	$el.find('a.btn-layerClose').click(function(){
    	setCookie("notice_layer", "done", 1);
        	isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
	});

    $('.layer .dimBg').click(function(){
    	$('.dim-layer').fadeOut();
        	return false;
	});
}  

function chk_number(){
	if((event.keyCode<48) || (event.keyCode>57))
		event.returnValue=false;
}

function chk_use_saved_money(obj){
	value = parseInt(obj.value);
	maxValue = parseInt("${sessionScope.login.mem_saved_money}");
	if( value > maxValue){
		obj.value = maxValue;
	}
	
	changePrice();
}

function changePrice(){
	realPrice = parseInt("${sessionScope.sumPrice}") - 
				parseInt($(".use_saved_money").val()) - 
				parseInt($(".couponDiscount").val());
	$(".realPrice").val(realPrice);
}

</script>

<%--
<c:if test="${empty login }">
<script>
	alert("로그인을 해주세요")
	location.href="membersLogin.do"
</script>
</c:if>
 --%>
 
 
 <!-- 맨위에 선 -->
<div id="headerLine">
</div>

<!-- 슬라이더 -->
<div id="slides">
  <input checked type="radio" name="slider" id="slide1" class="set" />
  <input type="radio" name="slider" id="slide2" class="set" />
  <input type="radio" name="slider" id="slide3" class="set" />
  <input type="radio" name="slider" id="slide4" class="set" />  
		  
  <div class="mask">    
    <div class="overflow">
      
      <div class="slide" style="background:lightsteelblue;">${shop.hs_name} 입니다</div>
      <div class="slide" style="background:#85b;">${shop.hs_profile}</div>
      
    </div>    
  </div>

  <div id="controls" onclick="">  
    <label for="slide1"></label>
    <label for="slide2"></label>
    <label for="slide3"></label>
    <label for="slide4"></label>    
  </div>
</div>
			

<!-- 미용실정보 -->
<br>
<div id="shopInfo">
	<div id="shopName">
		<h4>${shop.hs_name}</h4>
		<h6>${shop.hs_fulladdr}</h6>
	</div>
	<div id="shopStar1">
		<c:choose>
			<c:when test="${shop2.hr_rate > 4.5}">
	        	★★★★★
	        </c:when>
	        <c:when test="${shop2.hr_rate > 3.5}">
	        	★★★★☆
	        </c:when>
	        <c:when test="${shop2.hr_rate > 2.5}">
	        	★★★☆☆
	        </c:when>
	        <c:when test="${shop2.hr_rate > 1.5}">
	        	★★☆☆☆
	        </c:when>
	        <c:when test="${shop2.hr_rate > 0.5}">
	        	★☆☆☆☆
	        </c:when>
	        <c:when test="${empty shop2.hr_rate}">
	        	☆☆☆☆☆
	        </c:when>
        </c:choose>
	</div>
	<div id="shopStar2">
		<c:choose>
			<c:when test="${empty shop2.hr_rate}">
	        	<br><h4>0.0</h4>
	        </c:when>
	        <c:when test="${shop2.hr_rate > 0.0}">
	        	<br><h4>${shop2.hr_rate}</h4>
	        </c:when>
	    </c:choose>
	</div>
	<div id="reviewBook">
		<c:choose>
			<c:when test="${shop2.hs_no > 0}">
	        	리뷰수 : ${shop2.hs_no} +<br>
	        </c:when>
	        <c:when test="${empty shop2.hs_no}">
	        	리뷰수 : 리뷰가 없습니다<br>
	        </c:when>
	    </c:choose>
		<c:choose>
			<c:when test="${shop3.hs_no > 0}">
				북마크 : ${shop3.hs_no} +
			</c:when>
			<c:when test="${empty shop3.hs_no}">
				북마크 : 북마크가 없습니다
			</c:when>
		</c:choose>
	</div>
</div>

<!-- 바디안에 메뉴바 -->
<br>
<div id="menubar">
<div id="shopdata">
		<img src="../images/members/step3.png" style="width: 80px; height: 40px;"> 예약 및 결제 페이지
	</div>
</div>



<!-- 여기서부터 본문. div shopbody 부터 본문시작-->
<div id="shopbody">
 
	
<form action="paymentMember.do" method="post">
	
	<div id="menubar2">
		<div id="shopdata2">
			고객정보와 미용실 정보를 확인해주세요
		</div>
	</div>
	<br><br>
	
<table class="tbl">
	<tbody>
		<tr>
			<th>
				예약자 이름
			</th>
			<td>
				${login.mem_name }
			</td>
		</tr>
		<tr>
			<th>
				전화 번호
			</th>
			<td>
				${login.mem_phone }
			</td>
		</tr>
		<tr>
			<th>
				미용실 이름
			</th>
			<td>
				${sessionScope.selHairshopVo.hs_name }
			</td>
		</tr>
		<tr>
			<th>
				헤어 이름
			</th>
			<td>
				${sessionScope.selHairNames }
			</td>
		</tr>
		<tr>
			<th>
				디자이너 이름
			</th>
			<td>
				${sessionScope.selDesignerVo.designer_name }
			</td>
		</tr>
		<tr>
			<th>
				총 시술시간
			</th>
			<td>
				${total_hour} 시간
			</td>
		</tr>
	</tbody>
</table>	
<br><br>
	<div id="menubar3">
		<div id="shopdata3">
			쿠폰과 결제
		</div>
	</div>
	<br><br>

<script>
function applyCoupon(){
	// 전체 체크 순회
	$("input:radio[name=radio_coupon]").each(function() {
		if(this.checked){
			//ajax
			$.ajax({
				url : "../ajax/chkCoupon.do",
				data : {
					mc_no : this.value,
					sumPrice : "${sessionScope.sumPrice}"
				},
				dataType : "json",
				success : function(data) {
					$(".couponDiscount").val(data.discount)
					changePrice();
				}
			});
		}
	});
}

function cancelCoupon(){
	
}

</script>

<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="notice_layer" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <p class="title">쿠폰 사용</p>
                <div class="container">
                	<table class="coupon_list">
		                <c:forEach items="${listCoupon}" var="coupon">
		                	<tr>
		                		<td><input id="radio-${coupon.mc_no}" name="radio_coupon" type="radio" value="${coupon.mc_no}"></td>
		                		<td><label for="radio-${coupon.mc_no}" class="radio-label"> &nbsp ${coupon.hsc_maxdiscount_pay}원</label></td>
		                		<td><label for="radio-${coupon.mc_no}" class="radio-label"> &nbsp ${coupon.hsc_name} </label></td>
		                		<td><label for="radio-${coupon.mc_no}" class="radio-label"> &nbsp ${coupon.hsc_discount_rate}% </label></td>
		                	</tr>
						</c:forEach>
					</table>
				</div>
                <div class="btn-r">
                	<a href="#" class="btn-layerClose" onclick="applyCoupon();">적용</a>
                	<a href="#" class="btn-layerClose" onclick="cancelCoupon();">닫기</a>
                </div>
            </div>
        </div>
    </div>
</div><!-- dim-layer끝 -->



<table>
	<tbody>
		<tr>
			<th>
				쿠폰선택
			</th>
			<td>
				<input type="button" id="button1" onclick="layer_popup('#notice_layer');" value="쿠폰을 선택해주세요" />
			</td>
		</tr>
		<tr>
			<th>
				마일리지 사용
			</th>
			<td>
				<input type="text" class="use_saved_money" name="use_saved_money" onkeypress="chk_number();" onchange="chk_use_saved_money(this);" value="0"> / ${sessionScope.login.mem_saved_money}원
			</td>
		</tr>
		<tr>
			<th>
				원가
			</th>
			<td>
				${sessionScope.sumPrice}
			</td>
		</tr>
		<tr>
			<th>
				쿠폰할인 금액
			</th>
			<td>
				<input type="text" class="couponDiscount" name="couponDiscount" value="0" disabled>
			</td>
		</tr>
		<tr>
			<th>
				실제결제 금액
			</th>
			<td>
				<input type="text" class="realPrice" name="realPrice" value="${sessionScope.sumPrice}" disabled>
			</td>
		</tr>
	</tbody>
</table>

<br>
	<button class="btn-hover color-3">결제하기</button>
	
</form>



</div> <!-- shopbody끝 -->



<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>
</body>
</html>