package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class DesignerVo {
	private String rn;			//디자이너 랭크
	private String distance;	//디자이너 거리
	private String designer_no;
	private String designer_name;
	private String designer_phone; 
	private String designer_email;
	private String designer_pw;	  
	private String designer_dayoff; 
	private String work_start_time; 
	private String work_end_time;   
	private String designer_access_status;
	private String position;
	private String salary;
	private String incentive;
	private String hire_date;	
	private String designer_profile;
	private String hs_no;
	private String file_name;
	private String designer_book;
	private String hs_name;
	private String hs_email;
	
	// 디자이너 퇴사자 테이블 : DesignersLeaveInfoVo
	private String dli_leave_date;
	private String dli_reason;
	private String fin_position;
}
