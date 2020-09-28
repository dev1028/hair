package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class HairshopNoticeVo {
	public String notice_no;
	public String notice_title;
	public String notice_contents;
	public String notice_writedate;
	public String notice_hits;
	public String notice_image;
	public String emp_no;
	public String notice_categoryname;
}
