package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersPwSearchSCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwemail = request.getParameter("pwemail");
		String pwname = request.getParameter("pwname");
		String pwphone = request.getParameter("pwphone");
		System.out.println("뭐받아오노:" + pwemail + pwname + pwphone);

		MembersVo membersVo = new MembersVo();
		membersVo.setMem_email(pwemail);
		membersVo.setMem_name(pwname);
		membersVo.setMem_phone(pwphone);
		System.out.println("1:" + membersVo);

		MembersDAO dao = new MembersDAO();
		MembersVo resultVo = dao.findId(membersVo); // 리턴값이 있는애는 resultVo가 있어야지 리턴이 가능함
		System.out.println("2:" + membersVo);

		request.setAttribute("members", resultVo);
		System.out.println("3:" + resultVo);

		request.getRequestDispatcher("/members/membersIdS.jsp").forward(request, response);

	}

}
