package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.BoardManageDAO;
import com.yedam.hairshop.model.BoardManageVo;

public class AdminNoticeManageFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String who = request.getParameter("who");
		String searchType = request.getParameter("searchType");
		String searchVal = request.getParameter("searchVal");

		ArrayList<BoardManageVo> list = null;
		BoardManageVo paramVo = new BoardManageVo();
		if (startDate.equals("")) {
			paramVo.setStartDate("2000-01-01");
			paramVo.setEndDate(endDate);

		} else {

			paramVo.setStartDate(startDate);
			paramVo.setEndDate(endDate);
		}

		paramVo.setWho(who);
		paramVo.setSearchInput(searchVal);
		paramVo.setSearchType(searchType);
			list = BoardManageDAO.getInstance().findNotice(paramVo);


		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminNoticeManage.jsp").forward(request, response);

	}
}