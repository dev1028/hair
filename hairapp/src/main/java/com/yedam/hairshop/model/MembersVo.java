package com.yedam.hairshop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor

public class MembersVo {
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
	
	public MembersVo() {
		super();
	}
	
}
