package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.members.Controller;

public class hairshopJoinCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그아웃해야지만이 회원가입하게만들기
		
		response.sendRedirect("/hairapp/hairshop/hairshopJoin.jsp");

	}

}
