package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class AnalysisVo {
	String date;		//날짜
	String hs_no;		//헤어샵번호
	String hs_name;		//헤어샵이름
	String sales;		//금액
	String gender;		//성별
	String gender_cnt;	//성별 수
	String age;			//나이
	String age_cnt;		//나이 수
	String cnt;			//???
	String cntMale;		//남자 수
	String hhi_nameFemale;	//여성 헤어정보
	String hhi_nameMale;	//남성 헤어정보
	String rank;		//랭킹
	String tmac_name; 	//대분류
	String tmic_name; 	//중분류
	String hhi_name;
	String prevMonth;		//전월
	String designer_name;	//디자이너 이름
	String hr_rate;		
}
