package com.yedam.hairshop.designer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopHairInfoVo;

public class DesHairInfoFullListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DesignerVo loginVo = (DesignerVo) request.getSession().getAttribute("login");
		String hsNo = loginVo.getHs_no();
		HairshopHairInfoVo hsHIVo = new HairshopHairInfoVo();
		hsHIVo.setHs_no(hsNo);
		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectHairInfoList(hsHIVo);
		request.setAttribute("hairList", list);
		request.getRequestDispatcher("/designer/desHairInfoList.jsp").forward(request, response);
	}

}
