package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersHairShopIntroCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersHairShopIntroCtrl");
		
		HairshopVo vo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		List<MembersHairshopVo> intro = MembersHairshopDAO.getInstance().hairshopIntroAll(vo);
		System.out.println("1: "+intro);

		// 결과 저장
		request.setAttribute("intro", intro);
		
		// 페이지 이동
		request.getRequestDispatcher("/members/hairshopIntro.jsp").forward(request, response);

	}

}
