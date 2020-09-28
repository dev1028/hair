package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;

public class HairSelectCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairSelectCtrl");
		
//		HairshopVo vo = new HairshopVo();
//		String hsNo = request.getParameter("hsNo");
//		request.getSession().setAttribute("hsNo", hsNo);
//		vo.setHs_no(hsNo);
		
		HairshopVo vo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");

		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectListHairshopHairInfo_InHairshop(vo);
		request.setAttribute("list", list);
		//System.out.println(list.size() + "개의 헤어스타일 검색");
		
		request.getRequestDispatcher("/members/hairSelect.jsp").forward(request, response);
//		request.getRequestDispatcher("/members/payment.jsp").forward(request, response);
	}

}
