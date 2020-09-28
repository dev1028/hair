package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersLogoutCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getSession().invalidate(); // 모든세션정보 삭제
		
		//response.sendRedirect(request.getContextPath()+"/members/membersLogin.jsp"); // 로그인 화면으로 다시 돌아간다.
		request.getRequestDispatcher("/members/membersLogin.jsp").forward(request, response);
	}

}
