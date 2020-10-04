package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class BoardSettingVo {
	String type;
	String who;
	String id;
	String writtable;
	String readable;

	Integer nevv;
	Integer total;
}
