package com.yedam.hairshop.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardManageVo {

	String startDate;
	String endDate;
	String boardType;
	String category;
	String searchType;
	String searchInput;
	String answerStatus;
	String excludeAnswer;
	String who;
	
	String emp_name;
	String emp_alias;
	public String notice_no;
	public String notice_title;
	public String notice_contents;
	public String notice_writedate;
	public String notice_hits;
	public String notice_image;
public String notice_who;
public String notice_whov;
	public String notice_categoryname;
	public String notice_categorynamev;
	
	
	
	
	
	public String qna_no;
	public String qna_shop_customer_no;	// 회원번호
	public String qna_title;
	public String qna_contents;
	public String qna_writedate;
	public String qna_openstatus;		// 공개여부
	public String qna_hits;
	public String qna_category;
	public String qna_categoryv;
	public String qna_answer;			// 답변
	public String qna_answerdate;
	public String qna_who;
	public String qna_whov;
	public String emp_no;
	public String qna_ref;				// 답변 글그룹번호
	public String qna_repos;			// 답변 글순서
	public String qna_level;			// 답변 레벨
	public String qna_writer;	
	
	
}
