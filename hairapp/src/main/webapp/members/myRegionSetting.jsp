<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=750dd3f9eb4c747d5737b8872e6f6463"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
</script>
</head>
<body>
	<c:if test="${empty login }">
		<script>
			alert("로그인을 해주세요")
			location.href="membersLogin.do"
		</script>
	</c:if>
	
	<div id="map" style="width: 1000px; height: 500px;">
	</div>
	
	<div>
		<form class="frmRegion" action="myRegionSetting.do">
			<input type="button" value="버튼">

		</form>
	</div>
	
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		//지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		});
	</script>
	
	<script>
		$( ".frmRegion" ).click(function() {
			//alert("좌표가 저장됩니다." + "1")
			alert(marker.getPosition())
			$( ".frmRegion" ).submit();
		});
	
// 		$( "" ).submit(function( event ) {
			
// 			//event.preventDefault();
// 			//alert(marker.getPosition());
// 		});
	</script>
</body>
</html>