<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어샵예약-헤어예약</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="../css/membersHairshop.css">

<link rel="stylesheet" type="text/css" href="../css/designerCard.css">
<link rel="stylesheet" href="../decorator/membersDesigner.css">
<script src="../js/hairBookmark.js"></script>
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

/* 버튼 */
.buttons > .add-to-cart {
    width: 1080px;
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
    
    background-image: linear-gradient(to right, #667eea, #764ba2, #6B8DD6, #8E37D7);
    box-shadow: 0 4px 15px 0 rgba(116, 79, 168, 0.75);
}

.buttons > .add-to-cart:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.buttons > .add-to-cart:focus {
    outline: none;
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
<script>
$(document).ready(function() {
	$("input[type='checkbox']").on("click", function() {
		var count = $("input:checked[type='checkbox']").length;
			if (count > 3) {
				$(this).attr("checked", false);
				alert("3개까지만 선택할 수 있습니다.");
			}
		
		var t = 0;
		$("input:checked[type='checkbox']").each(function(){
			//alert($(this).parent().prev().prev().prop('tagName'));
			t += parseInt($(this).parent().prev().prev().text().replace('시간', ''));			
		});
		$("label[class='total_hour']").text(t);
		$("input[name='total_hour']").val(t);
	});
});

function check_cart(){
	var count = $("input:checked[type='checkbox']").length;
	if(count < 1 || count > 3){
		alert("1개 이상 3개 이하로 담아주세요.")
		return false;
	}
	return true;
}
</script>

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
		<img src="../images/members/step1.png" style="width: 80px; height: 40px;"> 헤어 예약하기
	</div>
</div>




<!-- 여기서부터 본문. div shopbody 부터 본문시작-->
<div id="shopbody">

<!-- 본문쓰면됨 여기에 -->



	<div class="container">
		<form action="../members/hairSelectResult.do" method="post">
			<div class="buttons">
			총 시술 시간: <label class="total_hour">0</label>시간
			<input type="hidden" name="total_hour" value="0">
			<br>
			<c:if test="${empty sessionScope.login }">
				<button class="add-to-cart" onclick="alert('로그인을 해주세요.'); return false">예약하기</button>
			</c:if>
			<c:if test="${not empty sessionScope.login }">
				<button class="add-to-cart" onclick="return check_cart();">예약하기</button>
			</c:if>
			</div>
			<br>
			
			<div class="row">
				<c:forEach items="${list}" var="hairInfo">
					<div class="col-md-3 col-sm-6">
						<div class="product-grid4">
							<div class="product-image4">
								<img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo5/images/img-1.jpg"
								 			   onerror="this.src='http://bestjquery.com/tutorial/product-grid/demo5/images/img-2.jpg'">
							</div>
							<div class="product-content">
								<c:if test="${not empty sessionScope.login }">
									<a href='javascript: like_func("${hairInfo.hhi_no}")'> 
										<c:if test="${hairInfo.hhi_book == 1 }">
											<img class="img-${hairInfo.hhi_no}" src="../images/bookmark/heart.png" width="30" height="30">
										</c:if> 
										<c:if test="${hairInfo.hhi_book != 1 }">
											<img class="img-${hairInfo.hhi_no}" src="../images/bookmark/empty_heart.png" width="30" height="30">
										</c:if>
									</a>
								</c:if>
								<h3 class="title">${hairInfo.hhi_name}</h3>
								<h3 class="title">${hairInfo.hhi_time}시간</h3>
								<div class="price">${hairInfo.hhi_price}원</div>
								<label><input class="add-to-cart" type="checkbox" name="cart" value="${hairInfo.hhi_no}">담기</label>
							</div>
						</div>
						<input type="hidden" name="hhiNo" value="${hairInfo.hhi_no}">
					</div>
				</c:forEach>
			</div>
			</form>
	</div>
<hr>


</div> <!-- shopbody끝 -->

<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>

</body>
</html>