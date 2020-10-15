<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>
	$(function() {

		$("#all").on("click", function() {

			var check = $("#all").prop("checked");
			$("input[class=chk]").prop("checked", check);
		})
		$(document)
				.on(
						"click",
						"#excel",
						function() {

							var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
							var table_html = encodeURIComponent(document
									.getElementById('table').outerHTML);

							var a = document.createElement('a');
							a.href = data_type + ',%EF%BB%BF' + table_html;
							a.download = 'test' + '_excel' + '.xls';
							a.click();

						})
		$(document).on("click", "#insert", function() {
			$("#myModal").modal('toggle');

		})
	})
</script>


</head>
<body>





	<div class="container">
		<form
			action="${pageContext.request.contextPath}/admin/adminCouponfind.do">

		</form>



		<h2 class="heading">발급쿠폰목록</h2>
		<div class="form-group" id="result">
			<form
				action="${pageContext.request.contextPath}/admin/adminCouponDelete.do">

				<button type="submit" value="0" id="delete">삭제</button>
				<input type="button" value="등록" id="insert">


				<div class="table-responsive" id="result">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th><input type="checkbox" name="all" id="all" class="chk"></th>
								<th>쿠폰번호</th>
								<th>상태</th>
								<!--  <th>발급</th> -->
								<th>쿠폰명</th>
								<th>할인율</th>
								<th>사용기간</th>
								<th>잔여수</th>
								<th>헤어샵</th>
								<!-- <th>수정</th>
						<th>발급내역</th> -->
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${list }" var="l">
								<tr>

									<td><input type="checkbox" class="chk" name = "hsc_no" value="${l.hsc_no }"></td>
									<td>${l.hsc_no }</td>
									<td>${l.hsc_status }</td>
									<!--  <td></td> -->
									<td>${ l.hsc_name}</td>
									<td>${ l.hsc_discount_rate}</td>
									<td>${l.hsc_issuedate}~${ l.hsc_expiredate}</td>
									<td>${ l.hsc_coupon_quantity}</td>

									<td>${l.hs_name }</td>
									<!-- <td></td>
								<td></td> -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<button id="excel">excel</button>
			</form>
		</div>
		<!-- <button type="button" id="excel">excel</button> -->




		<div class="modal fade" id="myModal" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title" id="modal_title">상세 정보</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>



					<div class="modal-body">
						<div class="container">

							<form id="empUpdatefrm"
								action="${pageContext.request.contextPath}/admin/adminCouponInsertSubmit.do">
								<div class="card">
									<div class="card-body">

										<div class="form-group">
											<label for="hs_name">쿠폰명</label> <input class="form-control"
												type="text" name="hsc_name" id="hs_no" value="" />
										</div>
										<label for="hs_name">사용기간</label>
										<div class="form-group row">

											<div class="col">
												<input type="date" class="form-control" name="hsc_issuedate">

											</div>
											-
											<div class="col">
												<input type="date" class="form-control"
													name="hsc_expiredate">
											</div>
										</div>
										<!-- <div class="col"> -->
										<div class="form-group">
											<label for="hs_comp_no">할인율</label> <input
												class="form-control" type="text" name=hsc_discount_rate
												id="hs_comp_no" value="" />
										</div>
										<div class="form-group">
											<label for="hs_owner">최대할인금액</label> <input
												class="form-control" type="text" name="hsc_maxdiscount_pay"
												id="hs_owner" value="" />
										</div>
										<div class="form-group">

											<label for="hs_email">대상미용실</label> <select id="hs_no"
												name="hs_no" class="form-control">

												<c:forEach items="${ hairshoplist}" var="i">

													<option value="${ i.hs_no}">${i.hs_name }</option>
												</c:forEach>


											</select>
										</div>
										<div class="form-group">
											<label for="hs_pw">발급매수</label> <input class="form-control"
												type="text" name="hsc_coupon_quantity" id="hs_pw" value=""
												placeholder="비밀번호를 입력하세요." />
										</div>

										<div>



											<button type="submit" value="Submit" id="submit"
												class="btn btn-default col-3"
												style="border: 1px solid gray;">등록</button>

										</div>






									</div>
								</div>
							</form>


						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<div class="row">

							<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>