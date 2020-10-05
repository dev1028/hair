package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;

public class FindMyCustomerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("/hairapp/designer/findMyCustomer.jsp");
		if(request.getParameter("inputSearch") != null) {
			String divisionSearch = request.getParameter("divisionSearch");
			String inputSearch = request.getParameter("inputSearch");
			if(divisionSearch.equals("name")) {
				
			} else if(divisionSearch.equals("tel")) {
				
			}
			
			
		} else {
			//response.sendRedirect("/hairapp/designer/findMyCustomer.jsp");
		}
		
		
		request.getRequestDispatcher("/designer/findMyCustomer.jsp").forward(request, response);
	}

}
