package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class CouponVo {

	String hsc_no;
	String hs_no;
	String hsc_issuedate;
	String hsc_expiredate;
	String hsc_coupon_quantity;
	String hsc_discount_rate;
	String hsc_maxdiscount_pay;
	String hsc_name;
}
