package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.CouponDAO;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersEventVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersHsEventIntroCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersHsEventIntroCtrl");
		
		HairshopVo hsVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		
		MembersEventVo eventVo = new MembersEventVo();
		eventVo.setHs_no(hsVo.getHs_no());
		
		ArrayList<MembersEventVo> couList = MembersHairshopDAO.getInstance().couponList(eventVo);
		for(MembersEventVo v : couList) {
			System.out.println(v);
		}
		
		
		// 헤어샵 정보 뿌리는거
		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(hsVo);
		
		// 결과 저장
		MembersEventVo coupon = CouponDAO.getInstance().memCoupon(eventVo);
		
		request.setAttribute("intro", couList);
		request.setAttribute("shop", shop);
		
		
		// 페이지 이동
		request.getRequestDispatcher("eventIntro.jsp").forward(request, response);

	}

}
