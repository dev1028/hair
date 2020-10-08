package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopCouponDAO;
import com.yedam.hairshop.model.CouponVo;

public class HairshopCouponInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String hsc_issuedate = request.getParameter("hsc_issuedate");
		String hsc_expiredate = request.getParameter("hsc_expiredate");

		String hsc_coupon_quantity = request.getParameter("hsc_coupon_quantity");
		String hsc_discount_rate = request.getParameter("hsc_discount_rate");
		String hsc_maxdiscount_pay = request.getParameter("hsc_maxdiscount_pay");
		String hsc_name = request.getParameter("hsc_name");
		
		CouponVo vo = new CouponVo();
		
		vo.setHs_no((String)request.getSession().getAttribute("hsno"));
		vo.setHsc_issuedate(hsc_issuedate);
		System.out.println("쿠폰insertCtrl 미용실번호" + vo.getHs_no());
		//vo.setHs_no(hs_no);
		vo.setHsc_expiredate(hsc_expiredate);
		vo.setHsc_coupon_quantity(hsc_coupon_quantity);
		vo.setHsc_discount_rate(hsc_discount_rate);
		vo.setHsc_maxdiscount_pay(hsc_maxdiscount_pay);
		vo.setHsc_name(hsc_name);
		HairshopCouponDAO.getInstance().insert(vo);
		
		request.getRequestDispatcher("/hairshop/HairshopCouponListCtrl.do").forward(request, response);
		
	}

}
