package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class HairShopReviewVo {
	String hr_no;
	String hr_rate;			// 별표
	String hr_contents;
	String hr_writedate;
	String hs_no;
	String mdr_no;
	String designer_no;
	String hr_writer;		// 글쓴이
}
