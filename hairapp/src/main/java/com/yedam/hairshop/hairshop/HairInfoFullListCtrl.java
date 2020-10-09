package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;

public class HairInfoFullListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String) request.getSession().getAttribute("hsno");
		HairshopHairInfoVo hsHIVo = new HairshopHairInfoVo();
		hsHIVo.setHs_no(hsNo);
		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectHairInfoList(hsHIVo);
		request.setAttribute("hairList", list);
		request.setAttribute("hairNotFound", 1);
		request.getRequestDispatcher("/hairshop/hairInfoList.jsp").forward(request, response);
	}

}
