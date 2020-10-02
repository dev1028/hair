package com.yedam.hairshop.members;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.FileRenamePolicy;
import com.yedam.hairshop.dao.NoticeDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class MembersNoticeWCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersNoticeWCtrl");

		// 파라미터 VO에 담기
		HairshopNoticeVo vo = new HairshopNoticeVo();

		try {
			BeanUtils.copyProperties(vo, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		System.out.println("vo" + vo);

		Part part = request.getPart("notice_image");
		String filename = getFilename(part);
		if (filename == null) {
			System.out.println("파일 에러");
			return;
		} else {
			String path = request.getServletContext().getRealPath("/");

			// 파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path, filename));
			part.write(path + "/" + renameFile.getName());
			vo.setNotice_image(renameFile.getName());

			int resultVo = NoticeDAO.getInstance().insert(vo);
			System.out.println("notice resultVo:" + resultVo);
			response.sendRedirect("membersNotice.do");
		}
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
