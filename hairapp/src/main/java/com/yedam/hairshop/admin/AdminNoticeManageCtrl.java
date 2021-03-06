package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.BoardManageDAO;
import com.yedam.hairshop.model.BoardManageVo;

public class AdminNoticeManageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<BoardManageVo> list = BoardManageDAO.getInstance().noticeAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminNoticeManage.jsp").forward(request, response);

	}

}
