package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class MembersEventVo {
	
	// 회원테이블 : MembersVo
	private String mem_no;
	private String mem_email;
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private String mem_birth;
	private String mem_sex;
	private String mem_addr;
	private String mem_city;
	private String mem_country;
	private String mem_township;
	private String mem_latitude_longitude;
	private String mem_saved_money;
	private String mem_city_latitude_longitude;
	private String mem_hair_length;
	private String mem_hair_status;
	private String mem_zip;
	private String mem_access_status;
	
	// 회원별 쿠폰 테이블 : members_coupon
	private String mc_no;				// 회원별쿠폰고유번호
	private String hsc_no;				// 쿠폰번호
	private String mc_issuedate;		// 발급일
	private String mc_expiredate;		// 소멸일
	private String mc_used;				// 사용유무
	
	// 미용실별 쿠폰 테이블 : hs_coupon
	private String hsc_issuedate;		// 쿠폰발급 생성일
	private String hsc_expiredate;		// 쿠폰발급 만료일
	private String hsc_coupon_quantity;	// 쿠폰개수
	private String hsc_discount_rate;	// 할인율
	private String hsc_maxdiscount_pay;	// 최대할인금액
	private String hsc_name;			// 쿠폰명
	
	// 헤어샵 테이블 : HairshopVo
	private String hs_rn;				//랭킹
	private String hs_no;
	private String hs_name;
	private String hs_owner;
	private String hs_tel;
	private String hs_email;
	private String hs_pw;
	private String hs_comp_no;
	private String hs_profile;
	private String hs_notice;
	private String hs_fulladdr;
	private String hs_cityaddr;
	private String hs_townaddr;
	private String hs_streetaddr;
	private String hs_latlong;
	private String hs_dayoff;
	private String hs_starttime;
	private String hs_endtime;
	private String hs_resource_option;
	private String hs_parking;
	private String hs_etc;
	private String hs_approval;
	private String hs_regdate;
	private String hs_book;
	
	
	
}
