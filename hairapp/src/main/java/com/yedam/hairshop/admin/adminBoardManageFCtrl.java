package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.BoardManageDAO;
import com.yedam.hairshop.model.BoardManageVo;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class adminBoardManageFCtrl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String boardType = request.getParameter("boardType");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String who = request.getParameter("who");
		String answerStatus = request.getParameter("answerStatus");
		String category = request.getParameter("category");
		String searchType = request.getParameter("searchType");
		String searchVal = request.getParameter("searchVal");

//		System.out.println("boatdtype" + boardType);
//		System.out.println("startdate" + startDate);
//		System.out.println("endDate" + endDate);
		System.out.println("who" + who);
//		System.out.println("answerstatus" + answerStatus);
//		System.out.println("category" + category);
//		System.out.println("searchtype" + searchType);
//		System.out.println("searchval" + searchVal);
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
		paramVo.setCategory(category);
		if (boardType.equals("notice")) {
			list = BoardManageDAO.getInstance().findNotice(paramVo);

		} else {
			list = BoardManageDAO.getInstance().findQna(paramVo);

		}

		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminBoardManage.jsp").forward(request, response);

	}
}