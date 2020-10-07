package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;

public class AdminNoticeInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String notice_who = request.getParameter("notice_who");
		request.setAttribute("notice_who", notice_who);
		request.getRequestDispatcher("/admin/adminNoticeInsert.jsp").forward(request, response);
	}

}
