package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class DLeaveInfoJoinDesignerVo {
	//DESIGNERS_LEAVE_INFO TABLE
	private String dli_leave_date;
	private String designer_no;
	private String dli_reason;
	private String fin_position;
	
	private String hs_no; // DESIGNERS_LEAVE_INFO TABLE의 정보
	private String hire_date;	

	//DESIGNER TABLE
	private String designer_name;
	private String designer_phone; 
	private String designer_email;
	private String file_name;
	
	//
	private String designer_profile;
	private String designer_dayoff; 
	private String work_start_time; 
	private String work_end_time;   
	private String designer_access_status;
	private String designer_pw;	  
	private String incentive;
	private String salary;
	private String position;
}
