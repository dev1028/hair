package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;

public class HairshopReturnToLoginCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/hairapp/hairshop/hairshopDesignerLogin.jsp");
	}
	
}
