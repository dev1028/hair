package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class hairshopNoticeWriteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공지사항 작성");
		 String notice_no = request.getParameter("notice_no");
		 String notice_title = request.getParameter("notice_title"); 
		 String notice_contents = request.getParameter("notice_contents");
		 String notice_writedate = request.getParameter("notice_writedate");
		 String notice_hits = request.getParameter("notice_hits");
		 String notice_image = request.getParameter("notice_image");
		 String emp_no = request.getParameter("emp_no");
		 String notice_categoryname = request.getParameter("notice_categoryname");
		 
		 HairshopNoticeVo vo = new HairshopNoticeVo();
		 
		 vo.setNotice_no(notice_no);
		 vo.setNotice_title(notice_title);
		 vo.setNotice_contents(notice_contents);
		 vo.setNotice_writedate(notice_writedate);
		 vo.setNotice_hits(notice_hits);
		 vo.setNotice_image(notice_image);
		 vo.setNotice_categoryname(notice_categoryname);
		 
		 int resultVo = HairshopDAO.getInstance().insert(vo);
		 request.setAttribute("write", resultVo);
		 response.sendRedirect("hairshopNoticeWriteCtrl.do");
	}
}
