package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.SandEmail;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.EmailVo;
import com.yedam.hairshop.model.MembersVo;

public class SendEmailToCustomerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");

		MembersVo membersVo = new MembersVo();
		membersVo.setMem_email(pwemail);
		membersVo.setMem_name(pwname);
		membersVo.setMem_phone(pwphone);
		

		//request.getRequestDispatcher("/members/memberPwS.jsp").forward(request, response);
		
		// 이메일
		SandEmail sendEmail = new SandEmail();
		EmailVo emailVo = new EmailVo();
		System.out.println();
		emailVo.setReceiverMail(resultVo.getMem_email());
		emailVo.setReceiverName(resultVo.getMem_name());
		emailVo.setTitle("우리동네 미용실 우동 비밀번호 인증 메일");
		emailVo.setContentType("text/html; charset=UTF-8");
		emailVo.setContents(contents);
		sendEmail.sand(emailVo);

		response.sendRedirect("membersPwEnd.do");

	}

}
