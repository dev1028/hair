package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class MembersCouponVo {
	String mc_no;			//고유번호
	String hsc_no;			//쿠폰번호
	String mem_no;			//고객번호
	String mc_issuedate;	//발급일
	String mc_expiredate;	//소멸일
	String mc_used;			//사용유무: 0 사용안함
	
	String hs_no;
	String hsc_name;
	String hsc_discount_rate;
	String hsc_maxdiscount_pay;
}
