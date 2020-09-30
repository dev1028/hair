package com.yedam.hairshop.members;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.FileRenamePolicy;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.dao.NoticeDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

//@MultipartConfig(location = "d:/upload", maxRequestSize = 1024 * 1024 * 10)
//@WebServlet("/members/membersNoticeW.do")
public class MembersNoticeWCtrl implements Controller {

	//private final String UPLOAD_DIRECTORY = "d:/upload";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersNoticeWCtrl");

//		// process only if its multipart content
//		if (ServletFileUpload.isMultipartContent(request)) {
//			try {
//				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
//
//				for (FileItem item : multiparts) {
//					if (!item.isFormField()) {
//						String name = new File(item.getName()).getName();
//						item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
//					}
//				}
//
//				// File uploaded successfully
//				request.setAttribute("message", "File Uploaded Successfully");
//			} catch (Exception ex) {
//				request.setAttribute("message", "File Upload Failed due to " + ex);
//			}
//
//		} else {
//			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
//		}

		// 파라미터 VO에 담기
		HairshopNoticeVo vo = new HairshopNoticeVo();
		
		String notice_no = request.getParameter("notice_no");
		String notice_title = request.getParameter("notice_title");
		String notice_contents = request.getParameter("notice_contents");
		String notice_writedate = request.getParameter("notice_writedate");
		String notice_hits = request.getParameter("notice_hits");
		String notice_image = request.getParameter("filename");
		String notice_categoryname = request.getParameter("notice_category");

		System.out.println("1"+vo);

		vo.setNotice_no(notice_no);
		vo.setNotice_title(notice_title);
		vo.setNotice_contents(notice_contents);
		vo.setNotice_writedate(notice_writedate);
		vo.setNotice_hits(notice_hits);
		vo.setNotice_image(notice_image);
		vo.setNotice_categoryname(notice_categoryname);
		System.out.println("2"+vo);
		
		// DB 등록 처리
		int resultVo = NoticeDAO.getInstance().insert(vo);
		System.out.println("3"+resultVo);
		request.setAttribute("write", resultVo);
		response.sendRedirect("membersNotice.do");

		//request.getRequestDispatcher("membersNotice.do").forward(request, response);

//		// 첨부 파일 처리
//		Part part = request.getPart("filename");
//		String fileName = getFileName(part);
//		String path = request.getServletContext().getRealPath("/images"); // "d:/upload";
//		System.out.println(path);
//
//		// 파일명 중복체크 -> 파일 중복되면 이름 다음에 숫자 붙여줌
//		File renameFile = FileRenamePolicy.rename(new File(path, fileName));
//		part.write(path + "/" + renameFile.getName()); // 디비에 저장된 이름으로 write 할거임
//		board.setNotice_image(renameFile.getName()); // 그것을 board에 담기

		// 목록으로 이동
		// response.sendRedirect("membersNotice.do");
		// request.getRequestDispatcher("membersNotice.do").forward(request, response);
	}

//	private String getFileName(Part part) throws UnsupportedEncodingException {
//		for (String cd : part.getHeader("Content-Disposition").split(";")) {
//			if (cd.trim().startsWith("notice_image")) { // filename으로 시작되는거 찾아서
//				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
//			}
//		}
//		return null;
//
//	}

}
