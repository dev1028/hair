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
	
	//최대 3개까지 선택가능.
	String hhi_no1;				//헤어 정보1
	String hhi_no2;				//헤어 정보2
	String hhi_no3;				//헤어 정보3
	
	String mc_no;				//회원별 쿠폰 고유 번호
	String use_saved_money;		//마일리지 사용금액
}
