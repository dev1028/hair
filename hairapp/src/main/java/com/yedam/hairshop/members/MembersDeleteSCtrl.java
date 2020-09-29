package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersDeleteSCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원탈퇴");
		
		MembersDAO dao = MembersDAO.getInstance();
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
        HttpSession session = request.getSession();
        System.out.println("탈퇴session1-1: "+session);
        String mem_email = session.getAttribute("loginid").toString();
        System.out.println("탈퇴session1-2: "+mem_email);
        
		// 파라미터 VO에 담기
        MembersVo members = new MembersVo();
		String mememail = mem_email;
		String mempw = request.getParameter("mempw");
		System.out.println("memdelete: "+mempw);
		
		members.setMem_email(mememail);
		members.setMem_pw(mempw);
		
		System.out.println("파라미터Vo에 담고나서 : "+members);
		dao.membersDelete(members);

		request.setAttribute("delete", members);


		request.getRequestDispatcher("membersDeleteF.do").forward(request, response);
	}

}
