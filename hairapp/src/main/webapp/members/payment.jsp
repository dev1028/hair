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
<link rel="stylesheet" type="text/css" href="../css/payment.css">
</head>
<body>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

$(function(){
	$('.hairLength').val("${login.mem_hair_length}").prop("selected", true);
	$('.hairStatus').val("${login.mem_hair_status}").prop("selected", true);
	
<%--
	//alert("${login.mem_hair_length}");
	//$('.hairLength').val("${login.mem_hair_length}").prop("selected", true);
--%>
})
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
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<img src="../images/members/curling-hair.png" style="width: 95px; height: 95px;">
	<div id="shopName">
		<div id="hsname">
			<h4><b>${shop.hs_name}</b></h4>
		</div>
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
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<img src="../images/members/curling-hair.png" style="width: 95px; height: 95px;">
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
			기장과 머릿결 상태 확인 및 수정 & 요청사항
		</div>
	</div>
	<br><br>
	
<table class="tbl">
	<tbody>
		<tr>
			<th>
				헤어 기장
			</th>
			<td>
				<select class="hairLength" name="hairLength">
					<option value="U1" >숏</option>
					<option value="U2">턱선아래</option>
					<option value="U3">어깨선아래</option>
					<option value="U4">가슴선아래</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>
				머릿결 상태
			</th>
			<td>
				<select class="hairStatus" name="hairStatus">
					<option value="O1">정상모발</option>
					<option value="O2">손상모발</option>
					<option value="O3">극손상모발</option>
					<option value="O4">탈색모모발</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>
				요청 사항
			</th>
			<td>
				<textarea id="mdr_request" name="mdr_request" rows="4" cols="50" placeholder="요청사항을 적어주세요."></textarea>
			</td>
		</tr>
	</tbody>
</table>	
<br><br>	
	
	
	
	<div id="menubar4">
		<div id="shopdata4">
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



<table class="tbl">
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