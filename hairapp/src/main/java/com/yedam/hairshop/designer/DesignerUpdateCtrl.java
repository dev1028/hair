package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerUpdateCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("디자이너 수정");
		String designer_pw = request.getParameter("designer_pw");
		String designer_phone = request.getParameter("designer_phone");
		String designer_dayoff = request.getParameter("designer_dayoff");
		String work_start_time = request.getParameter("work_start_time");
		String work_end_time = request.getParameter("work_end_time");
		String hire_date = request.getParameter("hire_date");
		String designer_profile = request.getParameter("designer_profile");
		String designer_no = request.getParameter("designer_no");
		
		DesignerVo designerVo = new DesignerVo();
		
		designerVo.setDesigner_pw(designer_pw);
		designerVo.setDesigner_phone(designer_phone);
		designerVo.setDesigner_dayoff(designer_dayoff);
		designerVo.setWork_start_time(work_start_time);
		designerVo.setWork_end_time(work_end_time);
		designerVo.setHire_date(hire_date);
		designerVo.setDesigner_profile(designer_profile);
		designerVo.setDesigner_no(designer_no);
		
		int resultVo = DesignerDAO.getInstance().update(designerVo);
		request.setAttribute("designer", resultVo);
		request.getRequestDispatcher("/designer/designerMain.do").forward(request, response);
	}
}
