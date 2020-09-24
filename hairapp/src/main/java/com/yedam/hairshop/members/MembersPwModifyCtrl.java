package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersPwModifyCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mem_email = request.getParameter("mem_email");
		String mem_pw = request.getParameter("mem_pw");
		
		MembersVo membersVo = new MembersVo();
		membersVo.setMem_email(mem_email);
		membersVo.setMem_pw(mem_pw);
		System.out.println("1:" + membersVo);

		MembersDAO dao = new MembersDAO();
		dao.updateForPw(membersVo);
		System.out.println("2:" + membersVo);
		
		request.getRequestDispatcher("membersPwModiS.jsp").forward(request, response);

	}

}
