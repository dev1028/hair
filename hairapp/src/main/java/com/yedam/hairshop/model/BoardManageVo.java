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
	String who;
	String b_no;
	String b_category;
	String b_writer;
	String b_wd;
	String b_a;
	String b_as;
	String b_hits;
	String b_title;
	String b_who;
}
