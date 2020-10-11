package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;

public class CheckSameHhiNameAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String) request.getSession().getAttribute("hsno");
		String hhiName = request.getParameter("hhi_name");
		System.out.println(hsNo);
		
		HairshopHairInfoVo hHIVo = new HairshopHairInfoVo();
		hHIVo.setHs_no(hsNo);
		hHIVo.setHhi_name(hhiName);
		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectHairInfoByName(hHIVo);
		if(list.size() == 0) {
			response.getWriter().print(0);
		} else {
			response.getWriter().print(1);
		}
	}

}
