package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;

public class FindMyCustomerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/hairapp/designer/findMyCustomer.jsp");
	}

}