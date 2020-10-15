<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>예약 및 결제완료</title>
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
<style>
/* 버튼 */
.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button {
  width: 600px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
/* 버튼끝 */
</style> 
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

/* 예약내역 가기 */
 function reservationGo() {
	location.href="membersRD.do";
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
 
	
<form action="" method="post">
	
	<div id="menubar2">
		<div id="shopdata2">
			결제 및 예약 완료
		</div>
	</div>
	<br><br>
	
	<h1 style="text-align: center; font-family: 'Do Hyeon', sans-serif; color:#5468b3;">결제가 완료되었습니다</h1>
	<h5 style="text-align: center; font-family: 'Do Hyeon', sans-serif;">자세한 내용은 예약내역 페이지에서 확인부탁드립니다</h5>
	<br><br>
<table class="tbl">
	<tbody>
		<tr>
			<th>
				예약자 이름
			</th>
			<td>
				${sessionScope.login.mem_name}
			</td>
		</tr>
		<tr>
			<th>
				미용실 이름
			</th>
			<td>
				${list.hs_name }
			</td>
		</tr>
		<tr>
			<th>
				헤어 이름
			</th>
			<td>
				${list.hhi_name}
			</td>
		</tr>
		<tr>
			<th>
				디자이너 이름
			</th>
			<td>
				${list.designer_name}
			</td>
		</tr>
		<tr>
			<th>
				예약날짜
			</th>
			<td>
				${list.mdr_date}
			</td>
		</tr>
		<tr>
			<th>
				총 결제 금액
			</th>
			<td>
				${list.mdp_price}
			</td>
		</tr>
	</tbody>
</table>	
<br><br>

</form>
<div class="wrap">
  <button class="button" onclick="reservationGo();">예약내역으로 가기</button>
</div>
<br><br><br><br>


</div> <!-- shopbody끝 -->



<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>
</body>
</html>