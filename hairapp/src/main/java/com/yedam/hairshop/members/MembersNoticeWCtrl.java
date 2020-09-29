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
import com.yedam.hairshop.dao.NoticeDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

//@MultipartConfig(location = "d:/upload", maxRequestSize = 1024 * 1024 * 10)
//@WebServlet("/members/membersNoticeW.do")
public class MembersNoticeWCtrl implements Controller {

	private final String UPLOAD_DIRECTORY = "d:/upload";
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 VO에 담기
		HairshopNoticeVo board = new HairshopNoticeVo();

	 
		
		//process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }
           
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
         
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
    
        //request.getRequestDispatcher("/result.jsp").forward(request, response);
     


	    

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

		try { // 위의 파라미터 한꺼번에 담아주는거
			BeanUtils.copyProperties(board, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("============map============");
		Map<String, String[]> map = request.getParameterMap();
		System.out.println(map);
		System.out.println("notice_no=" + map.get("notice_no"));

		System.out.println("============names============");
		Enumeration<String> pnames = request.getParameterNames(); // 파라미터 이름만 읽어오기 가능
		while (pnames.hasMoreElements()) {
			System.out.println(pnames.nextElement());
		}

		// DB 등록 처리
		NoticeDAO dao = new NoticeDAO();
		dao.selectList();

		// 목록으로 이동
		//response.sendRedirect("membersNotice.do");
		request.getRequestDispatcher("membersNotice.do").forward(request, response);
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
