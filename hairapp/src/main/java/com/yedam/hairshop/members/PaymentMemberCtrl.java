package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.dao.PaymentDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersVo;
import com.yedam.hairshop.model.PaymentVo;

public class PaymentMemberCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//같은 시간대 3개이상 이면 결제가 불가능함.
		System.out.println("PaymentMemberCtrl");
		
		HttpSession session = request.getSession();
		HairshopVo hairshopVo = (HairshopVo) session.getAttribute("selHairshopVo");
		HairshopHairInfoVo hairInfoVo = (HairshopHairInfoVo) session.getAttribute("selHairInfoVo");
		DesignerVo designerVo = (DesignerVo) session.getAttribute("selDesignerVo");
		MembersVo loginVo = (MembersVo) session.getAttribute("login");
				
		PaymentVo payVo = new PaymentVo();
		payVo.setMem_no(loginVo.getMem_no());
		payVo.setHs_no(hairshopVo.getHs_no());
		payVo.setMdr_online_price(hairInfoVo.getHhi_price());
		payVo.setDesigner_no(designerVo.getDesigner_no());
		
		System.out.println(payVo);
		//나중에 마일리지 쿠폰 등등을 실제 금액 계산해야함.
		PaymentDAO.getInstance().onlinePay(payVo);
	}

}
