package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class HairshopHairInfoVo {
	private String hhi_no;
	private String hhi_name;
	private String hhi_price;
	private String hhi_time;
	private String hs_no;
	private String tmic_no;
	private String hhi_book;
	private String hhi_status;
	
	private String tmac_name;
	private String tmac_explication;
	private String tmic_name;
	private String tmic_explication;
	private String tmac_no;
}
