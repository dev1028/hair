package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairShopReviewDAO;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersHsReviewIntrolCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersHsReviewIntrolCtrl");
		
		HairshopVo hsVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		
		// 헤어샵정보 뿌리는거
		HairShopReviewVo reviewVo = new HairShopReviewVo();
		reviewVo.setHs_no(hsVo.getHs_no());

		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(hsVo);
		HairShopReviewVo shop2 = MembersHairshopDAO.getInstance().reviewCount(hsVo);
		HairshopBookmarkVo shop3 = MembersHairshopDAO.getInstance().bookmarkCount(hsVo);
		request.setAttribute("shop", shop);
		request.setAttribute("shop2", shop2);
		request.setAttribute("shop3", shop3);
		// 헤어샵 정보 뿌리는거 끝
		
		
		ArrayList<HairShopReviewVo> reviewList = HairShopReviewDAO.getInstance().selectHsReivew(reviewVo);
		request.setAttribute("intro", reviewList);
		
		
		request.getRequestDispatcher("hsReviewIntro.jsp").forward(request, response);

	}

}
