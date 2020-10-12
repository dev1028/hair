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
		
		int photoResult = 0;
		int haishopResult = 0;

		Part part = request.getPart("notice_image");
		
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
//			String path = request.getServletContext().getRealPath("/");
			String path = "C:/hairapp/members/notice/";
			
			// 파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path, filename));
			part.write(path + "/" + renameFile.getName());
			vo.setNotice_image(renameFile.getName());

			int resultVo = NoticeDAO.getInstance().insert(vo);
			System.out.println("notice resultVo:" + resultVo);
			response.sendRedirect("membersNotice.do");
		}
		
		
		if (haishopResult == 1 && photoResult == 1) {
			response.getWriter().append("<script>").append("alert('수정에 성공하였습니다.');")
					.append("location.href='" + request.getContextPath() + "/members/membersNotice.do';")
					.append("</script>");
		} else {
			response.getWriter().append("<script>").append("alert('수정에 실패하였습니다.');")
					.append("location.href='" + request.getContextPath() + "/members/membersNotice.do';")
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
