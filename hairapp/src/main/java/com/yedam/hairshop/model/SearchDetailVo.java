package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class SearchDetailVo {
	String timeStart;
	String timeEnd;
	
	String value;
	String label;
	String desc;
	String icon;		//아이콘 경로
	String image;		//이미지 경로
}
