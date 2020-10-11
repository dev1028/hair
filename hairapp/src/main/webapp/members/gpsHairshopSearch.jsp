<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>여러개 마커 제어하기</title>
    
</head>
<body>
<div id="myMap" style="width:100%;height:350px;"></div>
<p>
    <button onclick="hideMarkers()">마커 감추기</button>
    <button onclick="showMarkers()">마커 보이기</button>
</p> 
<em>클릭한 위치에 마커가 표시됩니다!</em>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=750dd3f9eb4c747d5737b8872e6f6463"></script>
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script src="../js/locationFromIP.js"></script>
<script>
	
	var markers = [];
	
	//지도 생성은 공통적임.
	var mapContainer = document.getElementById('myMap'), // 지도를 표시할 div
	
	mapOption = { 
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	function moveMap(lat, lng){	
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(lat, lng);
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	
	function addMarker(position) {
		// 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        position: position
	    });
	
	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	}
	
	function addMarkerLatlng(lat, lng){
		addMarker(new kakao.maps.LatLng(lat, lng));
	}

	// 마커를 생성하고 지도위에 표시하는 함수입니다
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}
	
	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
	    setMarkers(map)    
	}
	
	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
	    setMarkers(null);    
	}
	
</script>
<c:if test="${not empty lat }">
	<script>
 		$(function(){
 			moveMap("${lat}", "${lng}"); 
 			addMarkerLatlng("${lat}", "${lng}")
 		})
	</script>
	
	<c:forEach items="${list}" var="item">
		<script>
			latlng = "${item.hs_latlong}";
			lat = latlng.split(',')[0]
			lng = latlng.split(',')[1]
			addMarkerLatlng(lat, lng);
		</script>
	</c:forEach>
</c:if>

<c:if test="${empty lat }">
<script>
	setLocationFromIP();
</script>
</c:if>

</body>
</html>