package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersHairShopIntroCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersHairShopIntroCtrl");
		
		//hsNo을 받았을 때도 예약 기능 사용 가능하도록 변경.
		HairshopVo vo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		if(vo == null) {
			String hsNo = request.getParameter("hsNo");
			if(hsNo != null) {
				vo = new HairshopVo();
				vo.setHs_no(hsNo);
				vo = HairshopDAO.getInstance().selectOne(vo);
				request.getSession().setAttribute("selHairshopVo", vo);
			}
		}
		
		MembersHairshopVo intro = MembersHairshopDAO.getInstance().selectOne(vo);
		
		if(intro == null) {
			System.out.println("intro error");
		}
		else {
			// 결과 저장
			request.setAttribute("intro", intro);
			request.setAttribute("lat", intro.getHs_latlong().split(",")[0]); 
			request.setAttribute("lng", intro.getHs_latlong().split(",")[1]);
			System.out.println(intro.getHs_latlong());
			
			// 페이지 이동
			request.getRequestDispatcher("/members/hairshopIntro.jsp").forward(request, response);
		}
	}

}
