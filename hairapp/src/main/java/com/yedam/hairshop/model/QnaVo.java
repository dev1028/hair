package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class QnaVo {
	public int qna_no;
	public String qna_shop_customer_no;	// 회원번호
	public String qna_title;
	public String qna_contents;
	public String qna_writedate;
	public String qna_openstatus;		// 공개여부
	public String qna_hits;
	public String qna_category;
	public String qna_answer;			// 답변
	public String qna_answerdate;
	public String qna_who;
	public String emp_no;
	public int qna_ref;				// 답변 글그룹번호
	public int qna_repos;			// 답변 글순서
	public int qna_level;			// 답변 레벨
	public String qna_writer;		// 작성자(login id)
	
	public int first;
	public int last;
}
