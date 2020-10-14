package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.FileUpload;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class hairshopNoticeMCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공지수정");

		String noticeNo = request.getSession().getAttribute("viewNo").toString();

		HairshopNoticeVo vo = new HairshopNoticeVo();
		String notice_no = noticeNo;
		String notice_categoryname = request.getParameter("notice_categoryname");
		String notice_title = request.getParameter("notice_title");
		String notice_contents = request.getParameter("notice_contents");
		String notice_image = request.getParameter("notice_image");

		vo.setNotice_no(notice_no);
		vo.setNotice_categoryname(notice_categoryname);
		vo.setNotice_title(notice_title);
		vo.setNotice_contents(notice_contents);
		vo.setNotice_image(notice_image);

		Part part = request.getPart("notice_image");
		String path = "/members/notice/" + vo.getNotice_title();
		String result = FileUpload.upload(path, part);
		if (result != null) {
			vo.setNotice_image(result);
			HairshopDAO dao = new HairshopDAO();
			dao.noticeModify(vo);
		}

		response.sendRedirect("hairshopNoticeView.do?notice_no=" + notice_no);

	}

	private String getFilename(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;

	}

}
