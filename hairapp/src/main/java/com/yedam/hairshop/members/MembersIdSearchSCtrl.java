package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersIdSearchSCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idname = request.getParameter("idname");
		String idphone = request.getParameter("idphone");
		String idbirth = request.getParameter("idbirth");
		System.out.println(idname+idphone+idbirth);
		
		MembersVo membersVo = new MembersVo();
		membersVo.setMem_name(idname);
		membersVo.setMem_phone(idphone);
		membersVo.setMem_birth(idbirth);
		System.out.println("1:"+membersVo);
		
        MembersDAO dao = new MembersDAO();
        dao.findId(membersVo);
        System.out.println("2:"+membersVo);
        
        request.setAttribute("members", membersVo);
        System.out.println("3:"+membersVo);
        
        request.getRequestDispatcher("/members/membersIdS.jsp").forward(request, response);
		


	}

}
