package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class HairshopVo implements Cloneable {
	private String hs_rn;	//랭킹
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
	private String distance;
	private String checkOwnerDesSame;
	private String checkOwnerDesEmailSame;
	private String checkOwnerDesEmailExist;
	private String designer_email;
	private String position;
	private String designer_phone;
	
	@Override
	public Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	
}
