package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerBookmarkDAO;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.DesignerBookmarkVo;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;
import com.yedam.hairshop.model.MembersVo;

public class MembersHsDesignerIntroCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersHsDesignerIntroCtrl");
		
		HairshopVo shopVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		
		//List<MembersHairshopVo> in = MembersHairshopDAO.getInstance().designerIntroAll(vo);
		
		DesignerVo designerVo = new DesignerVo();
		designerVo.setHs_no(shopVo.getHs_no());
		ArrayList<DesignerVo> list = DesignerDAO.getInstance().notRetireeByHairShop(designerVo);	// 디자이너 정보 담는거
		for(DesignerVo v : list) {
			System.out.println(v);
		}
		
		// 북마크 세팅
		MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
		for (DesignerVo v : list) {
			if (memVo != null) {
				DesignerBookmarkVo bookVo = new DesignerBookmarkVo();
				bookVo.setDesigner_no(v.getDesigner_no());
				bookVo.setMem_no(memVo.getMem_no());
				// 북마크 되어 있는 것이라면
				if (DesignerBookmarkDAO.getInstance().HasBookmark(bookVo)) {
					v.setDesigner_book("1");
				}
			}
		}
		
		// 헤어샵 정보 뿌리는거
		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(shopVo);
		HairShopReviewVo shop2 = MembersHairshopDAO.getInstance().reviewCount(shopVo);
		HairshopBookmarkVo shop3 = MembersHairshopDAO.getInstance().bookmarkCount(shopVo);
		
		System.out.println();
		System.out.println("1: "+list);

		// 결과 저장
		request.setAttribute("intro", list);
		request.setAttribute("shop", shop);
		request.setAttribute("shop2", shop2);
		request.setAttribute("shop3", shop3);
		
		// 페이지 이동
		request.getRequestDispatcher("/members/designerIntro.jsp").forward(request, response);

	}

}
