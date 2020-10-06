package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersCouponDAO;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersCouponVo;
import com.yedam.hairshop.model.MembersVo;

public class PaymentCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//결제할 고객정보
		MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
		HairshopVo hairshopVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		MembersCouponVo vo = new MembersCouponVo();
		vo.setMem_no(memVo.getMem_no());
		vo.setHs_no(hairshopVo.getHs_no());
		
		List<MembersCouponVo> listCoupon = MembersCouponDAO.getInstance().selectListUnusedCoupon(vo);
		request.setAttribute("listCoupon", listCoupon);
		request.getRequestDispatcher("payment.jsp").forward(request, response);
	}

}
