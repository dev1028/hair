package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class BoardSettingVo {
	String board_id;
	String board_type;
	String board_who;
	String board_whov;
	String board_readable;
	String board_writtable;

	Integer nevv;
	Integer total;
}
