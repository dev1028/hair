package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.FileUpload;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;

public class HairInfoInsertFormFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopHairInfoVo hHIVo = new HairshopHairInfoVo();

		String hsNo = (String) request.getSession().getAttribute("hsno");
		String hhiName = request.getParameter("hhi_name");
		String hhiPrice = request.getParameter("hhi_price");
		String hhiTime = request.getParameter("hhi_time");
		String tmicNo = request.getParameter("tmic_no");
		Part part = request.getPart("hhmi_file");

		hHIVo.setHhi_name(hhiName);
		hHIVo.setHhi_price(hhiPrice);
		hHIVo.setHhi_time(hhiTime);
		hHIVo.setTmic_no(tmicNo);
		hHIVo.setHs_no(hsNo);
		hHIVo.setHhi_status("1");
		
		String path = "/hairshop/"+hsNo+"/hairinfo";
		String result = FileUpload.upload(path, part);
		hHIVo.setHhmi_file(result);
		/*
		 * String filename; if(part == null) { filename = null; } else { filename =
		 * getFilename(part); }
		 * 
		 * if (filename == null) { System.out.println("파일 에러");
		 * hHIVo.setHhmi_file(null); } else { String path =
		 * request.getServletContext().getRealPath("/"); // 파일명 중복체크 File renameFile =
		 * FileRenamePolicy.rename(new File(path, filename)); part.write(path + "/" +
		 * renameFile.getName()); hHIVo.setHhmi_file(renameFile.getName()); }
		 * 
		 * System.out.println(hHIVo);
		 */
		
		hHIVo = HairshopHairInfoDAO.getInstance().insertHhi(hHIVo);
		
		if(hHIVo.getHhi_no() == null) {
			response.getWriter().append("<script>")
			.append("alert('시술등록에 실패하였습니다.');")
			.append("location.href='hairInfoInsert.do';")
			.append("</script>");
		} else 
			
			response.getWriter().append("<script>")
			.append("alert('시술등록에 성공하였습니다.');")
			.append("location.href='"+request.getContextPath()+"/hairshop/hairInfoDetail.do?hhi_no="+hHIVo.getHhi_no()+"';")
			.append("</script>");
		}
		
		
	}


