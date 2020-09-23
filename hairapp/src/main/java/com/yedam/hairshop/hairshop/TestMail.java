package com.yedam.hairshop.hairshop;

import com.yedam.hairshop.common.SandEmail;
import com.yedam.hairshop.model.EmailVo;

public class TestMail {
	public static void main(String[] args) {
		SandEmail se = new SandEmail();
		EmailVo emailVo = new EmailVo();
		emailVo.setReceiverName("김승연");
		emailVo.setReceiverMail("sg17990@gmail.com");
		emailVo.setTitle("테스트");
		emailVo.setContents("이메일전송 테스트");
		se.sand(emailVo);
	}
}
