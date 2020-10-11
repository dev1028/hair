<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
rel="stylesheet" />
<link
href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
rel="stylesheet" crossorigin="anonymous" />
<script
src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
crossorigin="anonymous"></script>
<script
src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
crossorigin="anonymous"></script>
<script
src="${pageContext.request.contextPath}/decorator/ges/dist/js/scripts.js"></script>
<script
src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
crossorigin="anonymous"></script>
<script
src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
crossorigin="anonymous"></script>
<script
src="${pageContext.request.contextPath}/decorator/ges/dist/assets/demo/datatables-demo.js"></script>



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
		<div class="table-responsive" id="result">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th><input type="checkbox" name="all" id="all" class="chk"></th>
						<th>상태</th>
						<th>발급</th>
						<th>쿠폰명
						</th>
						<th>할인율</th>
						<th>사용기간
						</th>
						<th>발급수/생성수</th>
						<th>쿠폰번호
						</th>
						<th>대상</th>
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
							<td>${ l.hsc_name}</td>
							<td>${ l.hsc_discount_rate}</td>
							<td>${ l.hsc_expiredate}</td>
							<td>${ l.hsc_coupon_quantity}</td>
							<td>${l.hsc_no }</td>

							<td>${l.hs_no }</td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<button id="excel">excel</button>
		<button id="email">email</button>
	</div>
	<!-- <button type="button" id="excel">excel</button> -->

</body>
</html>