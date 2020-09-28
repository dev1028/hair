package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HairShopSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairShopSelectCtrl");
		if(request.getAttribute("term") == null) {
			String term = (String) request.getSession().getAttribute("term");
			if(term != null)
				request.setAttribute("term", term);
		}
		request.getRequestDispatcher("hairshopSelect.jsp").forward(request, response);
	}

}
