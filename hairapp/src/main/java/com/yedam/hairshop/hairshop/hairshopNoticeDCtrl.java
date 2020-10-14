package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class hairshopNoticeDCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공지삭제");

		String noticeNo = request.getSession().getAttribute("viewNo").toString();

		HairshopNoticeVo vo = new HairshopNoticeVo();
		String notice_no = noticeNo;

		vo.setNotice_no(notice_no);

		HairshopDAO.getInstance().noticeDelete(vo);

		response.sendRedirect("hairshopNotice.do");

	}

}
