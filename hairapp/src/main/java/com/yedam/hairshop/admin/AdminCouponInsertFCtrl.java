package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.CouponDAO;
import com.yedam.hairshop.model.CouponVo;

public class AdminCouponInsertFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_no = request.getParameter("hs_no");
		String hsc_issuedate = request.getParameter("hsc_issuedate");
		String hsc_expiredate = request.getParameter("hsc_expiredate");

		String hsc_coupon_quantity = request.getParameter("hsc_coupon_quantity");
		String hsc_discount_rate = request.getParameter("hsc_discount_rate");
		String hsc_maxdiscount_pay = request.getParameter("hsc_maxdiscount_pay");
		String hsc_name = request.getParameter("hsc_name");

		CouponVo vo = new CouponVo();
		vo.setHs_no(hs_no);
		vo.setHsc_coupon_quantity(hsc_coupon_quantity);
		vo.setHsc_discount_rate(hsc_discount_rate);
		vo.setHsc_expiredate(hsc_expiredate);
		vo.setHsc_issuedate(hsc_issuedate);
		vo.setHsc_maxdiscount_pay(hsc_maxdiscount_pay);
		vo.setHsc_name(hsc_name);
		CouponDAO.getInstance().insert(vo);
		ArrayList<CouponVo> list = new ArrayList<>();
		list = CouponDAO.getInstance().selectAll(null);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminCouponManage.jsp").forward(request, response);
		// request.getRequestDispatcher("/hairapp/admin/adminCouponFind.do").forward(request,
		// response);
	}

}
