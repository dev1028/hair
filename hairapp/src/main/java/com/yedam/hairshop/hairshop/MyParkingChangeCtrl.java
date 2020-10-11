package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

public class MyParkingChangeCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String) request.getSession().getAttribute("hsno");
		String hsParking = request.getParameter("hs_parking");
		HairshopVo hVo = new HairshopVo();
		hVo.setHs_parking(hsParking);
		hVo.setHs_no(hsNo);
		int r = HairshopDAO.getInstance().updateHsParking(hVo);
		if(r==1) {
			hVo = (HairshopVo) request.getSession().getAttribute("login");
			hVo.setHs_parking(hsParking);
			request.getSession().setAttribute("login",hVo); 
		}
		
		response.sendRedirect(request.getContextPath()+"/hairshop/myHairshopInfo.do");
	}

}
