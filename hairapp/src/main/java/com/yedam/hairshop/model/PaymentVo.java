package com.yedam.hairshop.model;

import lombok.Data;

//회원이 디자이너 예약
@Data
public class PaymentVo {
	String mdr_no;				//예약 번호
	String mdr_date;			//예약 일자
	String mem_no;				//고객번호
	String designer_no;			//디자이너 번호
	String mdr_status;			//예약 상태
	String mdr_category_code;	//결제분류코드
	String mdr_online_price;	//온라인예약결제금액
	String mdr_request;			//헤어샵 요청사항
	String hs_no;				//미용실 번호
}
