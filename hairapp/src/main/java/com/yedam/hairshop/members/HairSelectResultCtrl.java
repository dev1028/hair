package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopHairInfoVo;

public class HairSelectResultCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairSelectResultCtrl");
		
		//선택된 헤어정보를 session에 담는다.
		String hhiNo = request.getParameter("hhiNo");
		HairshopHairInfoVo hairInfoVo = new HairshopHairInfoVo();
		hairInfoVo.setHhi_no(hhiNo);
		HairshopHairInfoVo selHairInfoVo = HairshopHairInfoDAO.getInstance().selectHairInfo(hairInfoVo);
		request.getSession().setAttribute("selHairInfoVo", selHairInfoVo);
		
		request.getRequestDispatcher("designerSelect.do").forward(request, response);
		
		/*
		String hsNo = request.getParameter("hsNo");		//헤어샵번호
		request.getSession().setAttribute("hsNo", hsNo);
		

		DesignerVo vo = new DesignerVo();
		vo.setHs_no(hsNo);
		List<DesignerVo> list = DesignerDAO.getInstance().selectByHairShop(vo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/members/designerSelect.jsp").forward(request, response);
		*/
	}

}
