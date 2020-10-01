package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.NoticeDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class MembersNoticeDCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공지삭제");

		String noticeNo = request.getSession().getAttribute("viewNo").toString();
		
		HairshopNoticeVo vo = new HairshopNoticeVo();
		String notice_no = noticeNo;
		
		vo.setNotice_no(notice_no);
		
		NoticeDAO.getInstance().noticeDelete(vo);
		
		response.sendRedirect("membersNotice.do");

	}

}
