package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
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
		MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
		if(memVo == null)
			return;
			
		HttpSession session = request.getSession();
		List<HairshopHairInfoVo> listHairInfoVo = (List<HairshopHairInfoVo>) session.getAttribute("selListHairInfoVo");
		if(listHairInfoVo == null)
			return;
		
		String date = request.getParameter("date");
		String time = request.getParameter("hs_starttime");
		if(time == null)
			return;

		HairshopVo hairshopVo = (HairshopVo) session.getAttribute("selHairshopVo");
		DesignerVo designerVo = (DesignerVo) session.getAttribute("selDesignerVo");
		
		PaymentVo payVo = new PaymentVo();
		payVo.setMem_no(memVo.getMem_no());
		payVo.setHs_no(hairshopVo.getHs_no());
		payVo.setDesigner_no(designerVo.getDesigner_no());
		payVo.setMdr_date(date + " " + time);
		System.out.println(payVo.getMdr_date());
		payVo.setHhi_no1("-1");
		payVo.setHhi_no2("-1");
		payVo.setHhi_no3("-1");
		if(listHairInfoVo.size() > 0)
			payVo.setHhi_no1(listHairInfoVo.get(0).getHhi_no());
		if(listHairInfoVo.size() > 1)
			payVo.setHhi_no2(listHairInfoVo.get(1).getHhi_no());
		if(listHairInfoVo.size() > 2)
			payVo.setHhi_no3(listHairInfoVo.get(2).getHhi_no());
		
		
//		HairshopVo hairshopVo = (HairshopVo) session.getAttribute("selHairshopVo");
//		HairshopHairInfoVo hairInfoVo = (HairshopHairInfoVo) session.getAttribute("selHairInfoVo");
//		DesignerVo designerVo = (DesignerVo) session.getAttribute("selDesignerVo");
//		MembersVo loginVo = (MembersVo) session.getAttribute("login");
//		HairshopHairInfoVo selHairInfoVo = (HairshopHairInfoVo) session.getAttribute("selHairInfoVo");
//
//		String date = request.getParameter("date");
//		String time = request.getParameter("hs_starttime");
//
//		// System.out.println(date + " " + time);
//		PaymentVo payVo = new PaymentVo();
//		payVo.setHhi_no(selHairInfoVo.getHhi_no());
//		payVo.setMem_no(loginVo.getMem_no());
//		payVo.setMdr_date(date + " " + time);
//		payVo.setHs_no(hairshopVo.getHs_no());
//		payVo.setMdr_online_price(hairInfoVo.getHhi_price());
//		payVo.setDesigner_no(designerVo.getDesigner_no());
//
//		// 나중에 마일리지 쿠폰 등등을 실제 금액 계산해야함.
//		PaymentDAO.getInstance().onlinePay(payVo);
		PaymentDAO.getInstance().onlinePay(payVo);
	}

}
