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
	public String qna_no;
	public String qna_shop_customer_no;
	public String qna_title;
	public String qna_contents;
	public String qna_writedate;
	public String qna_openstatus;
	public String qna_hits;
	public String qna_category;
	public String qna_answer;
	public String qna_answerdate;
	public String qna_who;
}
