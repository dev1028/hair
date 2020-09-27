package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersInfoViewCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
        HttpSession session = request.getSession();
        System.out.println("session1-1: "+session);
        String mem_email = session.getAttribute("loginid").toString();
        System.out.println("session1-2: "+mem_email);
        
        // 그 아이디 해당하는 회원정보를 가져온다.
        MembersDAO dao = MembersDAO.getInstance();
        MembersVo members = dao.getMembersInfo(mem_email);
        
        // membersInfoModify.jsp에 회원정보를 전달하기 위해 request에 MembersVo를 세팅한다.
        request.setAttribute("modify", members);
        System.out.println("1-3: " + members);
        
        request.getRequestDispatcher("membersInfoModify.jsp").forward(request, response);
	}

}
