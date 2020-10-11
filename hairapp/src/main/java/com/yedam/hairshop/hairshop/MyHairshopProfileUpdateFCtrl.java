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
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.dao.HsPhotoDAO;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.HsPhotoVo;

public class MyHairshopProfileUpdateFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String) request.getSession().getAttribute("hsno");
		String hsProfile = request.getParameter("hs_profile");
		String hsNotice = request.getParameter("hs_notice");
		Part part = request.getPart("hsp_file");

		HsPhotoVo hPVo = new HsPhotoVo();
		HairshopVo hVo = new HairshopVo();
		hVo.setHs_no(hsNo);
		hVo.setHs_profile(hsProfile);
		hVo.setHs_notice(hsNotice);

		int photoResult = 0;
		int haishopResult = 0;

		haishopResult = HairshopDAO.getInstance().updateNoticeAndProfile(hVo);

		String filename;
		if (part == null) {
			filename = null;
		} else {
			filename = getFilename(part);
		}
		if (filename == null) {
			System.out.println("파일 에러");
			photoResult = 1;
		} else {
			String path = request.getServletContext().getRealPath("/");
			// 파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path, filename));
			part.write(path + "/" + renameFile.getName());
			hPVo.setHsp_file(renameFile.getName());
			hPVo.setHs_no(hsNo);
			photoResult = HsPhotoDAO.getInstance().insert(hPVo);
		}

		if (haishopResult == 1 && photoResult == 1) {
			response.getWriter().append("<script>").append("alert('수정에 성공하였습니다.');")
					.append("location.href='" + request.getContextPath() + "/hairshop/myHairshopProfile.do';")
					.append("</script>");
		} else {
			response.getWriter().append("<script>").append("alert('수정에 실패하였습니다.');")
					.append("location.href='" + request.getContextPath() + "/hairshop/myHairshopProfile.do';")
					.append("</script>");
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
