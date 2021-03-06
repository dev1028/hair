package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.FileUpload;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class hairshopNoticeWriteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공지사항 작성");

		// 파라미터 VO에 담기
		HairshopNoticeVo vo = new HairshopNoticeVo();

		try {
			BeanUtils.copyProperties(vo, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		System.out.println("noticeW vo: " + vo);

		Part part = request.getPart("notice_image");
		String path = "/members/notice/" + vo.getNotice_title();
		String result = FileUpload.upload(path, part);
		if (result != null) {
			vo.setNotice_image(result);
			int resultVo = HairshopDAO.getInstance().insert(vo);
			System.out.println("notice resultVo:" + resultVo);
		}
		response.sendRedirect("hairshopNoticeCtrl.do");
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
