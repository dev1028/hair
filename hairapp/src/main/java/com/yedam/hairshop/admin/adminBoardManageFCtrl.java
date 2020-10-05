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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class adminBoardManageFCtrl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		JSONArray jArray = new JSONArray();
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
		ArrayList<HairshopNoticeVo> noticeList = null;
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

			noticeList = BoardManageDAO.getInstance().findNoticeAll(paramVo);
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

			noticeList = BoardManageDAO.getInstance().findQna(paramVo);
		}
//		System.out.println(startDate);
//		System.out.println(endDate);

		JSONObject jObj = new JSONObject();

		for (HairshopNoticeVo vo : noticeList) {
			jObj = new JSONObject();
//			jObj.put("notice_no", vo.getNotice_no());
//			jObj.put("notice_title", vo.getNotice_title());
//			jObj.put("n_writedate", vo.getNotice_writedate());
//			jObj.put("notice_hits", vo.getNotice_hits());
//			jObj.put("emp_no", vo.getEmp_no());
//			jObj.put("n_category", vo.getNotice_categoryname());
			jObj.put("qna_no", vo.getQna_no());
			jObj.put("qna_title", vo.getQna_title());
			jObj.put("qna_writedate", vo.getQna_writedate());
			jObj.put("qna_hits", vo.getQna_hits());
			jObj.put("qna_category", vo.getQna_category());
			jObj.put("qna_who", vo.getQna_who());
			jArray.add(jObj);
		}

		String str = JSONArray.fromObject(jArray).toString();
		System.out.println(str);

		response.getWriter().print(str);

	}
}
