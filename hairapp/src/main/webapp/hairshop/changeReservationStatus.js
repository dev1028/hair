	function alertZero(inData){
		if(inData != null){
			if(inData == 0 || inData == -1){
				alert("시술 변화가 수정되지 않았습니다. 다시 시도해 주세요.");
			} else {
				reloadAll();
			}		
		} else {
			alert("시술 변화가 수정되지 않았습니다. 다시 시도해 주세요.");
		}	

	}

	function reloadAll(){
		location.reload();
		window.opener.location.reload();
	}


	function callAjax(mdrNo, mdrStatus, checking){
		var data2;
		$.ajax({
			async : false,
			url : "${pageContext.request.contextPath}/ajax/changeReservationStatus.do",
			data : {
				mdr_status : mdrStatus,
				mdr_no : mdrNo,
				check : checking
			},
			dataType : "json",
			method : "post",
			success : function(data) {
				data2 =data;
			}		
		});// end of ajax 
		return data2;
	}