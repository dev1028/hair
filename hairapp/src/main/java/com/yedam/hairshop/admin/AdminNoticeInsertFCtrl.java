package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.BoardManageDAO;
import com.yedam.hairshop.model.BoardManageVo;

public class AdminNoticeInsertFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String notice_who = request.getParameter("notice_who"); 
		String notice_title=request.getParameter("notice_title");
		String notice_contents=request.getParameter("notice_contents");
String emp_no= request.getSession().getAttribute("empno").toString();

BoardManageVo vo = new BoardManageVo();
BoardManageDAO.getInstance().insertNotice(vo);

request.getRequestDispatcher("/admin/adminBoardManage.do").forward(request, response);

	
	}

}
