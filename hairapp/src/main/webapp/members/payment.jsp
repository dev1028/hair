<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
<link rel="stylesheet" type="text/css" href="../css/popup.css">
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
   
</script>

<%--
<c:if test="${empty login }">
<script>
	alert("로그인을 해주세요")
	location.href="membersLogin.do"
</script>
</c:if>
 --%>
	
<form action="paymentMember.do" method="post">
<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="notice_layer" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <p class="title">쿠폰 사용</p>
                <div class="container">
                	<table>
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
                    <a href="#" class="btn-layerClose">적용</a>
                </div>
            </div>
        </div>
    </div>
</div>

<input type="button" id="button1" onclick="layer_popup('#notice_layer');" value="쿠폰 선택" />
	
	<hr>
	고객정보를 입력해 주세요 <br>
	예약자 이름: ${login.mem_name }<br>
	전화 번호: ${login.mem_phone }<br>
	
	<hr>
	<b>미용실 이름:  </b> ${sessionScope.selHairshopVo.hs_name } <br>
	<b>헤어 이름   :  </b> ${sessionScope.selHairInfoVo.hhi_name } <br>
	<b>디자이너 이름: </b> ${sessionScope.selDesignerVo.designer_name } <br>
	<b>총 시술시간: </b> ${total_hour} 시간<br>
	<hr>
	고객에게 확인 사항(알림말) <br>
	
	<hr>
	쿠폰등록 정보 <br>
	
	원가: ${sessionScope.selHairInfoVo.hhi_price }<br>
	마일리지 사용: <input type="text" name="use_saved_money" value=""> / ${sessionScope.login.mem_saved_money}원<br>
	쿠판할인 금액: <br>
	실제결제 금액: <br> 
	
	<button>결제하기</button>
</form>
</body>
</html>