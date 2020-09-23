package com.yedam.hairshop.common;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import com.yedam.hairshop.model.EmailVo;

public class SandEmail {

	public int sand(EmailVo emailVo) {

		SimpleEmail email = new SimpleEmail();
		// 메일서버 설정
		email.setCharset("euc-kr"); // 한글 인코딩 email.setHostName("smtp.gmail.com"); // 보내는 메일(SMTP) 서버
		email.setHostName("smtp.gmail.com"); 
		email.setSmtpPort(465); // 포트
		email.setAuthenticator(new DefaultAuthenticator(emailVo.getSENDERMAIL(), emailVo.getPASSWORD())); // 인증
		email.setSSLOnConnect(true); // SSL 필요
		try {
			email.addTo(emailVo.getReceiverMail(), emailVo.getReceiverName()); // 수신자 추가
		} catch (EmailException e) {
			e.printStackTrace();
		}
		try {
			email.setFrom(emailVo.getSENDERMAIL(), emailVo.getSenderName()); // 보내는 사람
		} catch (EmailException e) {
			e.printStackTrace();
		}
		email.setSubject(emailVo.getTitle()); // 메일 제목
		email.setContent(emailVo.getContents(), emailVo.getContentType()); // 메일 내용
		try {
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
		
		return 0; // catch문에 변수넣어서 숫자별 상태정보 보이기
	}
}
