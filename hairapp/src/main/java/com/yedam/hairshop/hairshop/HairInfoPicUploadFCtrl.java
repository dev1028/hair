package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.FileUpload;
import com.yedam.hairshop.dao.HairshopHairMoreInfoDAO;
import com.yedam.hairshop.model.HairshopHairMoreInfoVo;

public class HairInfoPicUploadFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String) request.getSession().getAttribute("hsno");
		String hhiNo = request.getParameter("hhi_no");
		Part part = request.getPart("hhmi_file");
		
		HairshopHairMoreInfoVo hhmiVo = new HairshopHairMoreInfoVo();
		hhmiVo.setHhi_no(hhiNo);
		
		String path = "/hairshop/" + hsNo + "/hairinfo";
		String result = FileUpload.upload(path, part);
		String resultString = "alert('사진업로드에 실패했습니다.');";;
		if(result != null) {
			hhmiVo.setHhmi_file(result);
			int r = HairshopHairMoreInfoDAO.getInstance().inserthairPic(hhmiVo);
			if(r==1) {
				resultString = "alert('사진업로드에 성공했습니다.');";
			} 		
		} 
		
		response.getWriter().append("<script>")
		.append(resultString)
		.append("location.href='"+request.getContextPath()+"/hairshop/hairInfoDetail.do?hhi_no="+hhiNo+"';")
		.append("</script>");	
	}

}
