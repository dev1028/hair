function setLocationFromIP() {
	// GPS를 지원하면 새로요청시도.
	if (navigator.geolocation) { 
		navigator.geolocation.getCurrentPosition(function(position) {
	    	location.href= "myRegionSetting.do?lat=" + position.coords.latitude + "&lng=" + position.coords.longitude;  
			//alert(position.coords.latitude + ' aaa ' + position.coords.longitude);
	    	alert("우리동네를 설정하러 이동합니다.")
		}, function(error) {
			console.error(error);
		}, {
			enableHighAccuracy: false,
		    maximumAge: 0,
		    timeout: Infinity
		});
	}else {
		alert('GPS를 지원하지 않습니다');
	}
}