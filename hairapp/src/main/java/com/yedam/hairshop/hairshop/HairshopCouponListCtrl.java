package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopCouponDAO;
import com.yedam.hairshop.model.CouponVo;

public class HairshopCouponListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("쿠폰리스트");
		
		List<CouponVo> list = HairshopCouponDAO.getInstance().selectAll();

		request.setAttribute("list",list);
		request.getRequestDispatcher("/hairshop/hairshopCouponList.jsp").forward(request, response);

	}

}
