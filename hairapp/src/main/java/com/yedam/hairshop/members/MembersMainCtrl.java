package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.NoticeDAO;
import com.yedam.hairshop.dao.QnaDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;
import com.yedam.hairshop.model.MembersVo;
import com.yedam.hairshop.model.QnaVo;

public class MembersMainCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// DB 조회
		ArrayList<QnaVo> qnaList = QnaDAO.getInstance().mainQnaList();
		ArrayList<HairshopNoticeVo> noticeList = NoticeDAO.getInstance().mainNoticeList();

		// 결과 저장
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("noticeList", noticeList);


		request.getRequestDispatcher("/members/membersMain.jsp").forward(request, response);
	}

}
