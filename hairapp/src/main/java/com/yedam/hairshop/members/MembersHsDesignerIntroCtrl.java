package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersHsDesignerIntroCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersHsDesignerIntroCtrl");
		
		HairshopVo shopVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		
		//List<MembersHairshopVo> in = MembersHairshopDAO.getInstance().designerIntroAll(vo);
		
		DesignerVo designerVo = new DesignerVo();
		designerVo.setHs_no(shopVo.getHs_no());
		ArrayList<DesignerVo> list = DesignerDAO.getInstance().selectByHairShop(designerVo);	// 디자이너 정보 담는거
		for(DesignerVo v : list) {
			System.out.println(v);
		}
		
		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(shopVo);
		
		System.out.println();
		System.out.println("1: "+list);

		// 결과 저장
		request.setAttribute("intro", list);
		request.setAttribute("shop", shop);
		
		// 페이지 이동
		request.getRequestDispatcher("/members/designerIntro.jsp").forward(request, response);

	}

}
