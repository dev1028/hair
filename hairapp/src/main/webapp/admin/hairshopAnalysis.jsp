<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

 <script type="text/javascript" src="hairshopAnalysis.js"></script>
<!--
			§ 미용실 지역별 매출순위
			§ 미용실 지역별 예약순위
			§ 미용실 전체 매출순위
			§ 미용실 전체지역 예약순위
				미용실 평점순위

 -->


</head>
<body>
	<h2 class="heading">쿠폰</h2>
	<form
		action="${pageContext.request.contextPath}/admin/hairshopAnalysisFind.do">


	<div class="form-group">

			<div class="control">
				<label for="name">검색구분 </label>
				<button type="button" value="Submit" class='search' id="period">기간내결산</button>
				<button type="button" value="Submit" class='search' id="year">년도별
					결산</button>
				<button type="button" value="Submit" class='search' id="quarter">분기별
					결산</button>
				<button type="button" value="Submit" class='search' id="month">월별
					결산</button>
			</div>

			<div class="control">
				<label for="name">기간선택 </label>
				<div class="controls" id="range"></div>
			</div>

		<%-- 	<div class="control">
				<label for="name">직원선택 </label> <select name="ds">
					<option>전체직원</option>
					<c:forEach items="${list }" var="i">
						<option value="${i.designer_no}">${i.designer_name}</option>
					</c:forEach>
				</select>
				<div class="controls"></div>
			</div> --%>

			<button type="button" value="Submit" id="submit" class="col-1-4">Submit</button>
		</div>
	</form>



	<h2 class="heading">미용실 전체매출순위</h2>
	<div class="form-group" id="result">


		<table border="1" id="table">
			<thead>
				<tr>
			
					<th>미용실번호</th>
					<th>미용실이름</th>
					<th>지역
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
					
					<th>고객이름
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
					<th>예약번호</th>
					<th>시술날짜
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
					<th>시술대분류</th>
					<th>시술중분류</th>
					<th>금액</th>
					<th>총금액</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<%-- <c:forEach items="${list }" var="l">
					<tr>

						<td><input type="checkbox" class="chk"></td>
						<td></td>
						<td></td>
						<td>${ l.hsc_name}</td>
						<td>${ l.hsc_discount_rate}</td>
						<td>${ l.hsc_expiredate}</td>
						<td>${ l.hsc_coupon_quantity}</td>
						<td>${l.hsc_no }</td>
						
						<td>${l.hs_no }</td><td></td>
						<td></td>
					</tr> 
				</c:forEach>--%>
			</tbody>
		</table>
		<button id="excel">excel</button>
		<button id="email">email</button>
	</div>

</body>
</html>