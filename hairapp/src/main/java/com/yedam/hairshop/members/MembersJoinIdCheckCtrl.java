package com.yedam.hairshop.members;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.MembersDAO;

public class MembersJoinIdCheckCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
        MembersDAO dao = MembersDAO.getInstance();
        
        boolean result = dao.duplicateIdCheck(id);
        
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        
        System.out.println(result);
        
        if(result)    out.println("0"); // 아이디 중복
        else        out.println("1");
        out.close();
        
	}

}
