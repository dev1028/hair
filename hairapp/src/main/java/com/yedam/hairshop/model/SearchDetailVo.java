package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class SearchDetailVo {
	String hs_starttime;
	String hs_endtime;
	
	String value;
	String label;
	String desc;
	String icon;			//아이콘 경로
	String image;			//이미지 경로
	
	String mem_no = "-1";	//북마크 정보를 얻어내기 위한 것.
}
