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
//		System.out.println("who" + who);
//		System.out.println("answerstatus" + answerStatus);
//		System.out.println("category" + category);
//		System.out.println("searchtype" + searchType);
//		System.out.println("searchval" + searchVal);

		BoardManageVo paramVo = new BoardManageVo();
		ArrayList<BoardManageVo> noticeList = null;
		ArrayList<HairshopNoticeVo> qnaList = null;
		if (boardType.equals("notice")) {

			if (startDate.equals("Invalid date")) {
				paramVo.setStartDate("2000-01-01");
				paramVo.setEndDate(endDate);

			} else {

				paramVo.setStartDate(startDate);
				paramVo.setEndDate(endDate);
			}
			if (searchVal.equals("")) {
				paramVo.setSearchInput("1");
				paramVo.setSearchType("1");
			} else {
				paramVo.setSearchInput(searchVal);
				paramVo.setSearchType(searchType);
			}
			paramVo.setCategory(who);

			noticeList = BoardManageDAO.getInstance().findNoticeDate(paramVo);
		}
		if (boardType.equals("qna")) {

			if (startDate.equals("Invalid date")) {
				paramVo.setStartDate("2000-01-01");
				paramVo.setEndDate(endDate);

			} else {

				paramVo.setStartDate(startDate);
				paramVo.setEndDate(endDate);
			}
			if (searchVal.equals("")) {
				paramVo.setSearchInput("1");
				paramVo.setSearchType("1");
			} else {
				paramVo.setSearchInput(searchVal);
				paramVo.setSearchType(searchType);
			}
			if (category.equals("all")) {

			}
			paramVo.setCategory(category);
			if (who.equals("all")) {

			}
			paramVo.setWho(who);

//			noticeList = BoardManageDAO.getInstance().findQna(paramVo);
		}
		request.setAttribute("list", noticeList);
		request.getRequestDispatcher("/admin/adminBoardManage.jsp").forward(request, response);

	}
}