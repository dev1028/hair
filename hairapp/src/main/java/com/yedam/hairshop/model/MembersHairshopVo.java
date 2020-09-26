package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class MembersHairshopVo {
	
	// 미용실 테이블 : HairshopVo
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

	// 멤버 테이블 : MembersVo
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

	// 디자이너 테이블 : DesignerVo
	private String designer_name;
	private String designer_phone;
	private String designer_email;
	private String designer_pw;
	private String designer_dayoff;
	private String work_start_time;
	private String work_end_time;
	private String designer_access_status;
	private String position;
	private String salary;
	private String incentive;
	private String hire_date;
	private String designer_profile;
	private String file_name;

	// 미용실사진 테이블 : hs_photo
	private String hsp_no;
	private String hsp_file;
	
	
	// 선호 미용실 테이블 : favor_hs
	private String fh_division;		// 선호구분
	
	
}
