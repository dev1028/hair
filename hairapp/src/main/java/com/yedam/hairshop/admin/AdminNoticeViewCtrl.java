package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.BoardManageDAO;
import com.yedam.hairshop.model.BoardManageVo;

public class AdminNoticeViewCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String notice_no = request.getParameter("notice_no");
		BoardManageVo vo = new BoardManageVo ();
		vo.setNotice_no(notice_no);
	vo	= BoardManageDAO.getInstance().noticeSelectOne(vo);
		request.setAttribute("vo", vo);
	//	vo.get
	request.getRequestDispatcher("/admin/adminNoticeView.jsp").forward(request, response);
	}

}
