package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.CouponDAO;
import com.yedam.hairshop.model.MembersEventVo;

public class MembersCouponCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersCouponCtrl");
		
		// 파라미터 담기
		MembersEventVo eventVo = new MembersEventVo();
		
		String mem_no = request.getSession().getAttribute("memNo").toString();
		
		eventVo.setMem_no(mem_no);
		System.out.println("나와라eventVo : "+ eventVo);
		
		// 결과 저장
		ArrayList<MembersEventVo> holdingCoupon = CouponDAO.getInstance().memCouponList(eventVo);
		ArrayList<MembersEventVo> usedCoupon = CouponDAO.getInstance().memUsedCouponList(eventVo);

		// 결과 저장
		request.setAttribute("holdingCoupon", holdingCoupon);
		request.setAttribute("usedCoupon", usedCoupon);
		
		// 페이지 이동
		request.getRequestDispatcher("membersCoupon.jsp").forward(request, response);

	}

}
