//2020.09.23 김승연
package com.yedam.hairshop.model;

import lombok.Data;

@Data
public class EmailVo {
	
	private String receiverMail; //받는사람 이메일주소
	private String receiverName; //받는사람 이름
	private final String SENDERMAIL = "udong1023@gmail.com"; //보내는사람 메일 변경금지!!
	private String senderName= "우동"; // 보내는 사람이름 ex)예약관리팀, 고객지원팀 etc..
	private final String PASSWORD = "kuvyuryamodxzglh"; //보내는사람 앱비번 변경금지!!
	private String title; // 제목
	private String contents; // 내용
	private String contentType = "text/plain; charset=euc-kr"; //contentType 만약 html 코드로 보낼경우 plain부분을 html로 바꾸면 됨
}
