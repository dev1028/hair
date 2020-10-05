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

<!-- <script type="text/javascript" src="adminCouponManage.js"></script> -->


</head>
<body>
	<h2 class="heading">쿠폰</h2>
	<form
		action="${pageContext.request.contextPath}/admin/adminCouponfind.do">


		<div class="form-group">

			<div class="control">
				<label for="name">쿠폰명 </label>
			</div>
			<div class="control">
				<label for="name">발급상태 </label>
			</div>
			<div class="control">
				<label for="name">혜택구분 </label>
			</div>
			<div class="control">
				<label for="name">생성일자 </label>
				<button type="button" value="0" class='dateBtn' id="all">전체
				</button>
				<button type="button" value="0" class='dateBtn' id="today">오늘
				</button>
				<button type="button" value="3" class='dateBtn' id="three">3일
				</button>
				<button type="button" value="7" class='dateBtn' id="seven">7일
				</button>
				<button type="button" value="30" class='dateBtn' id="month">1개월
				</button>
				<input type="date" id="start" name="startDate"> - <input
					type="date" id="end" name="endDate">
			</div>







			<div class="control">


				<button type="submit" value="Submit" id="submit" class="col-1-4">Submit</button>
			</div>
		</div>
	</form>



	<h2 class="heading">발급쿠폰목록</h2>
	<div class="form-group" id="result">
		<form
		action="${pageContext.request.contextPath}/admin/adminCouponInsert.do">
		
			<button type="button" value="0" id="del">삭제</button>
			<input type="submit" value="등록" id="reg">
		</form>
<div class="control">
			<label for="name">생성일자 </label>

		</div>

		<table border="1" id="table">
			<thead>
				<tr>
					<th><input type="checkbox" name="all" id="all" class="chk"></th>
					<th>상태</th>
					<th>발급</th>
					<th>쿠폰명
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
					<th>혜택</th>
					<th>사용기간
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
					<th>발급수/생성수</th>
					<th>쿠폰번호
						<button type="button" name="designer_no" class="asc">a</button>
						<button type="button" name="designer_no" class="des">d</button>
					</th>
					<th>수정</th>
					<th>발급내역</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${list }" var="l">
					<tr>

						<td><input type="checkbox" class="chk"></td>
						<td></td>
						<td></td>
						<td>${ l.hcs_name}</td>
						<td>${ l.hcs_discount_rate}</td>
						<td>${ l.hcs_expiredate}</td>
						<td>${ l.hcs_quantity}</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button id="excel">excel</button>
		<button id="email">email</button>
	</div>
	<!-- <button type="button" id="excel">excel</button> -->

</body>
</html>