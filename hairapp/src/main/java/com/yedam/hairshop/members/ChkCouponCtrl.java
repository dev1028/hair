package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersCouponDAO;
import com.yedam.hairshop.model.MembersCouponVo;

import net.sf.json.JSONObject;

public class ChkCouponCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mc_no = request.getParameter("mc_no");
		final int sumPrice = Integer.valueOf(request.getParameter("sumPrice"));		
		MembersCouponVo vo = new MembersCouponVo();
		vo.setMc_no(mc_no);
		vo = MembersCouponDAO.getInstance().selectCoupon(vo);
		if(vo != null) {
			//int discount = (int) (Integer.parseInt(vo.getHsc_discount_rate()) * 0.01);
			double discount = (sumPrice * Integer.parseInt(vo.getHsc_discount_rate())) * 0.01;
			final int maxDiscount = (int)(Integer.parseInt(vo.getHsc_maxdiscount_pay().replace(",", "")));
			if(discount > maxDiscount)
				discount = maxDiscount;
			
			JSONObject obj = new JSONObject();
			obj.put("discount", discount);
			System.out.println(obj.toString());
			response.getWriter().print(obj.toString());
		}else {
			System.out.println("vo를 찾을 수 없습니다.");
		}
	}

}
