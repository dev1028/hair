package com.yedam.hairshop.hairshop;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.FileRenamePolicy;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopHairMoreInfoVo;

public class HairInfoInsertFormFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopHairInfoVo hHIVo = new HairshopHairInfoVo();
		HairshopHairMoreInfoVo hHMIVo = new HairshopHairMoreInfoVo();
		
		String hsNo = (String) request.getSession().getAttribute("hsno");
		String hhiName = request.getParameter("hhi_name");
		String hhiPrice = request.getParameter("");
		String hhiTime = request.getParameter("hhi_time");
		String tmicNo = request.getParameter("tmic_no");
		Part part = request.getPart("file_name");
	
		
		hHIVo.setHhi_name(hhiName);
		hHIVo.setHhi_price(hhiPrice);
		hHIVo.setHhi_time(hhiTime);
		hHIVo.setTmic_no(tmicNo);
		hHIVo.setHs_no(hsNo);
		hHIVo.setHhi_status("1");
		
		int r = HairshopHairInfoDAO.getInstance().insertHhi(hHIVo);
		
		if(r == 1) {
			String filename = getFilename(part);
			if (filename == null) {
				System.out.println("파일 에러");
				return;
			} else {
				String path = request.getServletContext().getRealPath("/");

				// 파일명 중복체크
				File renameFile = FileRenamePolicy.rename(new File(path, filename));
				part.write(path + "/" + renameFile.getName());
				hHMIVo.setHhmi_file(renameFile.getName());

			}
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
