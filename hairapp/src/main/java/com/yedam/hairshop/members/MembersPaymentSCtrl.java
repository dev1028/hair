package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersPaymentSCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersPaymentSCtrl");
		
		HairshopVo hsVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		
		
		// 헤어샵 정보 뿌리는거
		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(hsVo);
		HairShopReviewVo shop2 = MembersHairshopDAO.getInstance().reviewCount(hsVo);
		HairshopBookmarkVo shop3 = MembersHairshopDAO.getInstance().bookmarkCount(hsVo);

	}

}
