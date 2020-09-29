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
import com.yedam.hairshop.model.SalesVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class adminBoardManageFCtrl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		JSONArray jArray = new JSONArray();
//		String boardType = request.getParameter("boardType");
//		String startDate = request.getParameter("start");
//		String endDate = request.getParameter("end");
//		String who = request.getParameter("who");
//		String answerStatus = request.getParameter("answerStatus");
//		String category = request.getParameter("category");
//		String searchType = request.getParameter("searchType");
//		String searchVal = request.getParameter("searchVal");
//		
//		System.out.println(boardType);
//		System.out.println(startDate);
//		System.out.println(endDate);
//		System.out.println(who);
//		System.out.println(answerStatus);
//		System.out.println(category);
//		System.out.println(searchType);
//		System.out.println(searchVal);
//		
//		
//		
//		
//		BoardManageVo paramVo = new BoardManageVo();
//		ArrayList<HairshopNoticeVo> noticeList= null;
//		ArrayList<HairshopNoticeVo> qnaList = null;
//		if(boardType.equals("notice")){
//			
//			paramVo.setStartDate("20-09-01");
//			paramVo.setEndDate("20-10-10");
//		
//			paramVo.setSearchType(searchType);
//			paramVo.setSearchInput(searchVal);
//			paramVo.setCategory(category);
//
//		
//		System.out.println(	paramVo.getSearchType());
//		System.out.println(	paramVo.getSearchInput());
//		System.out.println(	paramVo.getCategory());
//		
//		if(searchVal.equals("")&&category.equals("")) {
//		
//					noticeList = BoardManageDAO.getInstance().findNotice(paramVo);
//		}else if()
//					
//					noticeList = BoardManageDAO.getInstance().findNotice(paramVo);
//				}
//			noticeList = BoardManageDAO.getInstance().findNotice(paramVo);
//		}else if(category.equals("")) {
//			noticeList = BoardManageDAO.getInstance().findNotice(paramVo);
//		}else {
//			
//			noticeList = BoardManageDAO.getInstance().findNotice(paramVo);
//		}
//		}
//		else if(boardType.equals("qna")){
//			
//			paramVo.setStartDate(startDate);
//			paramVo.setEndDate(endDate);
//			paramVo.setAnswerStatus(answerStatus);
//			paramVo.setSearchType(searchType);
//			paramVo.setSearchInput(searchVal);
//			paramVo.setCategory(category);
//			qnaList = BoardManageDAO.getInstance().findQna(paramVo);
//		}
//
//	
//
//		System.out.println(startDate);
//		System.out.println(endDate);
//
//
//
//		JSONObject jObj = new JSONObject();
//
//		for (HairshopNoticeVo vo : noticeList) {
//			jObj = new JSONObject();
//			jObj.put("notice_no", vo.getNotice_no());
//			jObj.put("notice_title", vo.getNotice_title());
//			jObj.put("notice_writedate", vo.getNotice_writedate());
//			jObj.put("notice_hits", vo.getNotice_hits());
//			jObj.put("emp_no", vo.getEmp_no());
//			jObj.put("notice_categoryname", vo.getNotice_categoryname());
//
//			jArray.add(jObj);
//		}
//
//		String str = JSONArray.fromObject(jArray).toString();
//		System.out.println(str);
//
//		response.getWriter().print(str);

	}

}
