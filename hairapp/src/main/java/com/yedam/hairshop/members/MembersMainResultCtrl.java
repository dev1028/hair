package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;

public class MembersMainResultCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersMainResultCtrl");
		HttpSession session = request.getSession();
		session.setAttribute("term", request.getParameter("term"));
		request.getRequestDispatcher("hairshopSelect.do").forward(request, response);
	}

}
