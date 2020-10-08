package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersHairShopIntroCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersHairShopIntroCtrl");
		
		HairshopVo vo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		MembersHairshopVo intro = MembersHairshopDAO.getInstance().selectOne(vo);
		HairShopReviewVo intro2 = MembersHairshopDAO.getInstance().reviewCount(vo);
		if(intro == null) {
			System.out.println("intro error");
		}
		else {
			// 결과 저장
			request.setAttribute("intro", intro);
			request.setAttribute("intro2", intro2);
			request.setAttribute("lat", intro.getHs_latlong().split(",")[0]); 
			request.setAttribute("lng", intro.getHs_latlong().split(",")[1]);
			System.out.println(intro.getHs_latlong());
			
			// 페이지 이동
			request.getRequestDispatcher("/members/hairshopIntro.jsp").forward(request, response);
		}
	}

}
