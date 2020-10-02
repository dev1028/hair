<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DetailedReservation.jsp</title>
</head>
<body>
	<div id="wrap">
	
	<form method="post" action="membersDR.do" name="form" id="form">
		<div id="wrap1">
			<h3>예약 상세 확인</h3>	
			<hr style="border: solid 1px">
			<c:forEach items="${list}" var="detatil">
			<div>
			<input type="hidden" name="no" value="no" >
				예약 번호 : ${detatil.mdr_no}<br>
				방문 일자 : ${detatil.mdr_date}<br>
				미용실 : ${detatil.hs_name}<br>
				디자이너 : ${detatil.designer_name}<br>
				시술 헤어 : ${detatil.hhi_name}<br>
				헤어샵 요청사항 : ${detatil.mdr_request}<br>
				헤어 기장 : ${detatil.mem_hair_length}<br>
				헤어 상태 : ${detatil.mem_hair_status}<br>
				결제 금액 : ${detatil.mdp_price}<br>
			</div>
			<br>
			</c:forEach>
		</div>
	</form>
	</div>
</body>
</html>