package com.yedam.hairshop.designer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.dao.HairshopHairMoreInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopHairMoreInfoVo;

public class DesHairInfoDetailCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hhiNo = request.getParameter("hhi_no");
		HairshopHairInfoVo hVo = new HairshopHairInfoVo();
		hVo.setHhi_no(hhiNo);
		hVo = HairshopHairInfoDAO.getInstance().selectOneHairInfo(hVo);
		HairshopHairMoreInfoVo hhmiVo = new HairshopHairMoreInfoVo();
		hhmiVo.setHhi_no(hVo.getHhi_no());
		List<HairshopHairMoreInfoVo> list = HairshopHairMoreInfoDAO.getInstance().selectByHhiNo(hhmiVo);
		request.setAttribute("hair", hVo);
		request.setAttribute("picList", list);
		request.getRequestDispatcher("/designer/desHairInfoDetail.jsp").forward(request, response);
	}

}
