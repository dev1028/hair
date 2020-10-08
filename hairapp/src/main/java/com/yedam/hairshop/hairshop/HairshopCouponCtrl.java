package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.model.CouponVo;

public class HairshopCouponCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//HairshopVo vo =  (HairshopVo) request.getSession().getAttribute("login");
		//HairshopVo hsc = HairshopDAO.getInstance().selectOne(vo);
		
		CouponVo vo = new CouponVo();
		vo.setHs_no((String)request.getSession().getAttribute("hsno"));
		request.setAttribute("hsno", vo);
		System.out.println("미용실번호: " + vo.getHs_no() );
		request.getRequestDispatcher("/hairshop/hairshopCouponInsert.jsp").forward(request, response);
	}
	

}
