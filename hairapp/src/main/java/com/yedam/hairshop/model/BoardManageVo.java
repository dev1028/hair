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
}
