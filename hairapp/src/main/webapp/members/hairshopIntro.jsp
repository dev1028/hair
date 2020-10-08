<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>헤어샵 소개</title>
<style>
	    .map_wrap {position:relative;width:1000px;height:600px;}
/* 	    .title {font-weight:bold;display:block;} */
/* 	    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;} */
/* 	    #centerAddr {display:block;margin-top:2px;font-weight: normal;} */
/* 	    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;} */
</style>
	
<style>
/* 메뉴바 */
#menubar2{
	top:91%;
	right:0px;
	position:absolute;
	width:80%;
	height:50px;
	background-color: #d8ddee;
}
#shopdata2 {
	position:absolute;
	left:2%;
	top:30%;
}

/* 바디 div */
#shopbody2 {
	position:absolute;
	left:21%;
	top:100%;
}
</style>
<link rel="stylesheet" href="../css/membersHairshop.css"> <!-- 헤어샵레이아웃 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=750dd3f9eb4c747d5737b8872e6f6463&libraries=services"></script>
<script>
$(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표 (33.450701, 126.570667)
	        level: 1 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	var bSave = false;

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker({
		// 지도 중심좌표에 마커를 생성합니다 
		position : map.getCenter()
	}), // 클릭한 위치를 표시할 마커입니다
	infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다


	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);

	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				bSave = !!result[0].road_address ? true : false;
				
				
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">법정동 주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';
				addr = content;
				
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);

	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	            
	            $("input[type=hidden][name=roadAddress]").val(result[0].road_address.address_name)
	            $("input[type=hidden][name=latlng]").val(marker.getPosition());
				$("input[type=hidden][name=addr]").val(addr);
	        }   
	    });
	});

	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});

	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}

	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');

	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }    
	}

	marker.setMap(map);
})

</script>

</head>

<body>

<!-- 맨위에 선 -->
<div id="headerLine">
</div>

<!-- 슬라이더 -->
<div id="divSlider">

<section id="contenedor">
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<div class="mini"><img src="http://placehold.it/150x50" alt="" height="50" width="150"></div>
	<ul id="slider">
		<li>
			<div><p>상민미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
		<li>
			<div><p>송현미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
		<li>
			<div><p>강산미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
		<li>
			<div><p>승연미용실</p></div>
			<img src="http://placehold.it/600x200" alt="" height="200" width="600">
		</li>
	</ul>
</section>

</div>

<!-- 미용실정보 -->
<br>
<div id="shopInfo">
	<div id="shopName">
		<h4>${intro.hs_name}</h4>
		<h6>${intro.hs_fulladdr}</h6>
	</div>
	<div id="shopStar1">
		<c:choose>
			<c:when test="${intro2.hr_rate < 4.5}">
	        	★★★★★
	        </c:when>
	        <c:when test="${intro2.hr_rate < 4.0}">
	        	★★★★☆
	        </c:when>
	        <c:when test="${intro2.hr_rate < 2.5}">
	        	★★★☆☆
	        </c:when>
	        <c:when test="${intro2.hr_rate < 1.5}">
	        	★★☆☆☆
	        </c:when>
	        <c:when test="${intro2.hr_rate < 0.5}">
	        	★☆☆☆☆
	        </c:when>
        </c:choose>
	</div>
	<div id="shopStar2">
		<br><h4>${intro2.hr_rate}</h4>
	</div>
	<div id="reviewBook">
		리뷰수 : ${intro2.hs_no} +<br>
		북마크 : 1000 +
	</div>

</div>

<!-- 바디안에 메뉴바 -->
<br>
<div id="menubar">
	<div id="shopdata">
		헤어샵 정보
	</div>
</div>

<!-- 바디 -->
<div id="shopbody">

<form method="post" action="hairshopIntro.do" name="form" id="form">
			
			<table>
				<tr>
					<td id="title">전화번호</td>
					<td>${intro.hs_tel}</td>
				</tr>

				<tr>
					<td id="title">주소</td>
					<td>${intro.hs_fulladdr}</td>
				</tr>

				<tr>
					<td id="title">영업시간</td>
					<td>${intro.hs_starttime} ~ ${intro.hs_endtime} 시</td>
				</tr>

				<tr>
					<td id="title">휴무일</td>
					<td>${intro.hs_dayoff} 일</td>
				</tr>

				<tr>
					<td id="title">직원수</td>
					<td>${intro.designer_access_status} 명</td>
				</tr>

				<tr>
					<td id="title">주차장유무</td>
					<td>${intro.hs_parking}</td>
				</tr>

				<tr>
					<td id="title">비고</td>
					<td>${intro.hs_etc}</td>
				</tr>

			</table>
		</form>

</div>

<!-- 바디안에 메뉴바 -->
<div id="menubar2">
	<div id="shopdata2">
		헤어샵 위치
	</div>
</div>


<!-- 이안에 지도하면됨 -->
<div id="shopbody2">
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <div class="hAddr">
	        <span class="title">지도중심기준 행정동 주소정보</span>
	        <span id="centerAddr"></span>
	    </div>
	</div>
	
</div>



<!-- 왼쪽메뉴 -->
<div id="mypage">
	<%@include file="/decorator/membersLeftMenu.jsp" %>
</div>


</body>
</html>