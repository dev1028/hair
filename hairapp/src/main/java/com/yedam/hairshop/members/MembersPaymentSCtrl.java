package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;
import com.yedam.hairshop.model.MembersReservationVo;
import com.yedam.hairshop.model.PaymentVo;

public class MembersPaymentSCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersPaymentSCtrl");
		
		HairshopVo hsVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		PaymentVo payVo = (PaymentVo) request.getSession().getAttribute("payVo");
		System.out.println("payVo나와라: "+payVo);
		
		MembersReservationDAO dao = MembersReservationDAO.getInstance();
		MembersReservationVo resultVo = dao.drHairshop3(payVo);
		MembersReservationVo resultVo2 = dao.drHairshop4(payVo);
		System.out.println("resultVo: " + resultVo);
		System.out.println("resultVo2: " + resultVo2);
		
		
		// 헤어샵 정보 뿌리는거
		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(hsVo);
		HairShopReviewVo shop2 = MembersHairshopDAO.getInstance().reviewCount(hsVo);
		HairshopBookmarkVo shop3 = MembersHairshopDAO.getInstance().bookmarkCount(hsVo);
		
		
		// 결과 저장
		request.setAttribute("list", resultVo);
		request.setAttribute("list2", resultVo2);
		
		request.setAttribute("shop", shop);
		request.setAttribute("shop2", shop2);
		request.setAttribute("shop3", shop3);

		// 페이지 이동
		request.getRequestDispatcher("/members/paymentSuccess.jsp").forward(request, response);

	}

}
