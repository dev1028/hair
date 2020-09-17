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
		String designer_pw = request.getParameter("designer_pw");
		String designer_phone = request.getParameter("designer_phone");
		String designer_dayoff = request.getParameter("designer_dayoff");
		String work_start_time = request.getParameter("work_start_time");
		String work_end_time = request.getParameter("work_end_time");
		String hire_date = request.getParameter("hire_date");
		
		DesignerVo designerVO = new DesignerVo();
		
		designerVO.setDesigner_pw(designer_pw);
		designerVO.setDesigner_phone(designer_phone);
		designerVO.setDesigner_dayoff(designer_dayoff);
		designerVO.setWork_start_time(work_start_time);
		designerVO.setWork_end_time(work_end_time);
		designerVO.setHire_date(hire_date);
		
		int resultVO = DesignerDAO.getInstance().update(designerVO);

	}

}
