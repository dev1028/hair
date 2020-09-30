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
		// 여긴 잘됨? 여기서부터에러뜸 밑에 37라인
		// part널 뜨는이유는 첨부파일 등록안해서.
		String filename = getFilename(part);
		if (filename == null) {
			System.out.println("파일 에러");
			return;
		} else {
			String path = "c:/upload";
			
			// 파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path, filename));
			part.write(path + "/" + renameFile.getName());
			vo.setNotice_image(renameFile.getName());
			
			int resultVo = NoticeDAO.getInstance().insert(vo);
			System.out.println("3" + resultVo);
			request.setAttribute("write", resultVo);
			response.sendRedirect("membersNotice.do");
		}
	}
//
//		Part part = request.getPart("notice_image");
//		System.out.println("part" + part);
//		String notice_image = getFilename(part);
//		String path = "d:/upload";
//		System.out.println(path);
//
//		// 파일명 중복체크
//		File renameFile = FileRenamePolicy.rename(new File(path, notice_image));
//		part.write(path + "/" + renameFile.getName());
//		vo.setNotice_image(renameFile.getName());
//
//		int resultVo = NoticeDAO.getInstance().insert(vo);
//		System.out.println("3" + resultVo);
//		request.setAttribute("write", resultVo);
//		response.sendRedirect("membersNotice.do");



	private String getFilename(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

//		String notice_no = request.getParameter("notice_no");
//		String notice_title = request.getParameter("notice_title");
//		String notice_contents = request.getParameter("notice_contents");
//		String notice_writedate = request.getParameter("notice_writedate");
//		String notice_hits = request.getParameter("notice_hits");
//		String notice_image = request.getParameter("filename");
//		String notice_categoryname = request.getParameter("notice_category");
//
//		System.out.println("1"+vo);
//
//		vo.setNotice_no(notice_no);
//		vo.setNotice_title(notice_title);
//		vo.setNotice_contents(notice_contents);
//		vo.setNotice_writedate(notice_writedate);
//		vo.setNotice_hits(notice_hits);
//		vo.setNotice_image(notice_image);
//		vo.setNotice_categoryname(notice_categoryname);
//		System.out.println("2"+vo);
//		
//		// DB 등록 처리
//		int resultVo = NoticeDAO.getInstance().insert(vo);
//		System.out.println("3"+resultVo);
//		request.setAttribute("write", resultVo);
//		response.sendRedirect("membersNotice.do");

}
