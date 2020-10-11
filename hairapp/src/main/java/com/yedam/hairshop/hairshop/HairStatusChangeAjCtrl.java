package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;


public class HairStatusChangeAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hhiNo = request.getParameter("hhi_no");
		String hhiStatus = request.getParameter("hhi_status");
		HairshopHairInfoVo hVo = new HairshopHairInfoVo();
		hVo.setHhi_no(hhiNo);
		hVo.setHhi_status(hhiStatus);
		int r =HairshopHairInfoDAO.getInstance().updateHhiStatus(hVo);
		response.getWriter().print(r);		
	}

}
