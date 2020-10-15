package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class CheckDesignerTimeAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String) request.getSession().getAttribute("hsno");
		String hsStartTime = request.getParameter("hs_starttime");
		String hsEndTime = request.getParameter("hs_endtime");
		
		DesignerVo dVo = new DesignerVo();
		dVo.setWork_start_time(hsStartTime);
		dVo.setWork_end_time(hsEndTime);
		dVo.setHs_no(hsNo);
		int r = DesignerDAO.getInstance().selectDesStartEndTime(dVo);	
		response.getWriter().print(r);

	}

}
