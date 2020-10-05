package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class hairshopNoticeViewCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공지사항 보기");
		String notice_no = request.getParameter("notice_no");
		String notice_title = request.getParameter("notice_title");
		String notice_contents = request.getParameter("notice_contents");
		
		HairshopNoticeVo vo = new HairshopNoticeVo();
		
		vo.setNotice_no(notice_no);
		vo.setNotice_title(notice_title);
		vo.setNotice_contents(notice_contents);
		
		HairshopNoticeVo resultVo = HairshopDAO.getInstance().noticeView(vo);
		int hit =HairshopDAO.getInstance().hitUpdate(vo);
		request.getSession().setAttribute("view", resultVo);
		request.getSession().setAttribute("viewNo",resultVo.getNotice_no());
		request.getSession().setAttribute("hit", hit);
		
		request.getRequestDispatcher("hairshopNoticeView.jsp").forward(request, response);
		
	}

}
