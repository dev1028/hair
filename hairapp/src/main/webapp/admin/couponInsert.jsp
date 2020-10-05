<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert coupon</title>
<!-- Required meta tags -->
<%--    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link href="<c:url value="/resources/css/sb-admin-2.min.css" />" rel="stylesheet">
    <title>Hello, world!</title>
    <!-- JS -->
    <Script src="<c:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
    <Script src="<c:url value="/resources/js/sb-admin-2.min.js" />"></script> --%>
</head>

<h3 class="page_title">쿠폰 등록</h3>
<div class="regist">




	<form name="frm" id="frm"
		action="${pageContext.request.contextPath}/admin/adminCouponInsertSubmit.do">
		<div>
			<label for="rsv_no">쿠폰명</label> <input type="text" name="hsc_name">
		</div>
		<div>
			<label for="rsv_dt">사용기간</label> <input type="date"
				name="hsc_issuedate">-<input type="date"
				name="hsc_expiredate">
		</div>


		<div>
			<label for="mbr_no">할인율</label> <input type="number"
				name="hsc_discount_rate">
		</div>
		<div>
			<label for="rsv_cost">최대할인금액</label> <input type="number"
				name="hsc_maxdiscount_pay">
		</div>


		<div>
			<label for="ds_no">대상미용실</label> <select id="hs_no" name="hs_no">
	
				<c:forEach items="${ list}" var="i">

				<option value="${ i.hs_no}">${i.hs_name }</option>
				</c:forEach>


			</select>
		</div>
		<div>
			<label for="rsv_typ_first">발금매수</label> <input type="number"
				name="hsc_coupon_quantity" value="">
		</div>



		<div>

			<button type="reset" id="reset" name="reset">reset</button>
			<button type="submit" id="submit" name="submit">submit</button>

		</div>
	</form>
</div>

</body>
</html>