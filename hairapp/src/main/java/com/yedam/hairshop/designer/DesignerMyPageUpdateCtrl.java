package com.yedam.hairshop.designer;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.FileRenamePolicy;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerMyPageUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("디자이너 수정");
		String designer_pw = request.getParameter("designer_pw");
		String designer_phone = request.getParameter("designer_phone");
		String designer_dayoff = request.getParameter("designer_dayoff");
		String work_start_time = request.getParameter("work_start_time");
		String work_end_time = request.getParameter("work_end_time");
		String designer_profile = request.getParameter("designer_profile");
		String file_name = request.getParameter("file_name");
		String designer_no = request.getParameter("designer_no");

		DesignerVo designerVo = new DesignerVo();

		designerVo.setDesigner_pw(designer_pw);
		designerVo.setDesigner_phone(designer_phone);
		designerVo.setDesigner_dayoff(designer_dayoff);
		designerVo.setWork_start_time(work_start_time);
		designerVo.setWork_end_time(work_end_time);
		designerVo.setDesigner_profile(designer_profile);
		designerVo.setFile_name(file_name);
		designerVo.setDesigner_no(designer_no);

		Part part = request.getPart("file_name");
		String filename = getFilename(part);
		if (filename == null) {
			System.out.println("파일 에러");
			return;
		} else {
			String path = request.getServletContext().getRealPath("/");
			/*
			 * String path = "/hairshop/"+hsNo+"/profile"; String result =
			 * FileUpload.upload(path, part); if(result != null) { hPVo.setHsp_file(result);
			 * photoResult = HsPhotoDAO.getInstance().insert(hPVo); }
			 */

			// 파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path, filename));
			part.write(path + "/" + renameFile.getName());
			designerVo.setFile_name(renameFile.getName());

		}
		int resultVo = DesignerDAO.getInstance().mypageUpdate(designerVo);
		request.setAttribute("designer", resultVo);
		request.getRequestDispatcher("/designer/designerMyPageOutput.jsp").forward(request, response);
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
