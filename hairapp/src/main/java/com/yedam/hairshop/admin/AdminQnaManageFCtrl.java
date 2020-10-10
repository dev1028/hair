package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.BoardManageDAO;
import com.yedam.hairshop.model.BoardManageVo;

public class AdminQnaManageFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String who = request.getParameter("who");
		String answerStatus = request.getParameter("answerStatus");
		String category = request.getParameter("category");
		String searchType = request.getParameter("searchType");
		String searchVal = request.getParameter("searchVal");
String exclude = request.getParameter("excludeAns");
		System.out.println(startDate);
		System.out.println("dfs"+endDate);
		System.out.println(who);
		System.out.println(answerStatus);
		System.out.println(category);
		System.out.println(searchType);
		System.out.println(searchVal);
		ArrayList<BoardManageVo> list = null;
		BoardManageVo paramVo = new BoardManageVo();
		if (startDate.equals("")) {
			paramVo.setStartDate("2000-01-01");
			paramVo.setEndDate(endDate);

		} else {

			paramVo.setStartDate(startDate);
			paramVo.setEndDate(endDate);
		}
paramVo.setExcludeAnswer(exclude);
		paramVo.setWho(who);
		paramVo.setSearchInput(searchVal);
		paramVo.setSearchType(searchType);
		paramVo.setCategory(category);
		paramVo.setAnswerStatus(answerStatus);

		list = BoardManageDAO.getInstance().findQna(paramVo);

		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminQnaManage.jsp").forward(request, response);

	}
}