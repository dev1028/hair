package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersJoinCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("utf-8");

		// 목록으로 이동
		request.getRequestDispatcher("membersJoin.jsp").forward(request, response);
	
	}

}
