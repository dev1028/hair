package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.hairshopCloseDayManageDAO;
import com.yedam.hairshop.model.HairshopProcedureFinishVo;
import com.yedam.hairshop.model.HairshopVo;

public class HsFindMyCustomerReCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String)request.getSession().getAttribute("hsno");
		HairshopVo dayoffVo = new HairshopVo();
		dayoffVo.setHs_no(hsNo);
		
		String hs_dayoff = request.getParameter("hs_dayoff");
		
		HairshopVo hairshopVo = new HairshopVo();
		hairshopVo.setHs_dayoff("hs_dayoff");
		
		int resultVo = hairshopCloseDayManageDAO.getInstance().update(hairshopVo);
		
		request.setAttribute(name, o);
		request.setAttribute("resultVo", resultVo);
		request.getRequestDispatcher("/hairshop/employeeCloseDayManage.jsp").forward(request, response);

	}

}
