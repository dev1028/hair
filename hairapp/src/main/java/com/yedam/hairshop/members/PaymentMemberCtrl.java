package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
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
		String mc_no = request.getParameter("radio_coupon");
		if(mc_no == null || mc_no.equals(""))
			mc_no = "-1";
		
		String use_saved_money = request.getParameter("use_saved_money");
		if(use_saved_money == null || use_saved_money.equals(""))
			use_saved_money = "0";
		
		System.out.println("coupon: " + mc_no);
		
		System.out.println("PaymentMemberCtrl");
		MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
		
		try {
			if(memVo == null)
				throw new Exception("memVo is null");

			String hairLength = request.getParameter("hairLength");
			if(hairLength == null)
				throw new Exception("hairLength is null");
			
			String hairStatus = request.getParameter("hairStatus");
			if(hairStatus == null)
				throw new Exception("hairStatus is null");
			
			memVo.setMem_hair_length(hairLength);
			memVo.setMem_hair_status(hairStatus);
			
			int r = MembersDAO.getInstance().updateHairInfo(memVo);
			System.out.println(r + "건 헤어 정보 업데이트 됨");
			
			HttpSession session = request.getSession();
			List<HairshopHairInfoVo> listHairInfoVo = (List<HairshopHairInfoVo>) session.getAttribute("selListHairInfoVo");
			if(listHairInfoVo == null)
				throw new Exception("ListHairInfo is null");
			
			
			String date = (String) session.getAttribute("date");
			if(date == null)
				throw new Exception("date is null");
			
			String hour = (String) session.getAttribute("hour");
			if(hour == null)
				throw new Exception("hour is null");

			HairshopVo hairshopVo = (HairshopVo) session.getAttribute("selHairshopVo");
			DesignerVo designerVo = (DesignerVo) session.getAttribute("selDesignerVo");
			
			PaymentVo payVo = new PaymentVo();
			payVo.setMc_no(mc_no);
			payVo.setMem_no(memVo.getMem_no());
			payVo.setHs_no(hairshopVo.getHs_no());
			payVo.setDesigner_no(designerVo.getDesigner_no());
			payVo.setMdr_date(date + " " + hour);
			payVo.setUse_saved_money(use_saved_money);
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
			
			
			int mdrNo = PaymentDAO.getInstance().onlinePayi0(payVo);
			if(mdrNo >= 0) {
				request.getRequestDispatcher("/members/paymentImport.jsp").forward(request, response);
				payVo.setMdr_no(String.valueOf(mdrNo));
				session.setAttribute("payVo", payVo);
				System.out.println("결제 대기 상태로 돌임");
			}
			else {
				request.getRequestDispatcher("/members/paymentError.jsp").forward(request, response);
				System.out.println("예약 불가능한 시간.");
			}
			
//			int mdrNo = PaymentDAO.getInstance().onlinePay(payVo);
//			System.out.println("mdrNo: " + mdrNo);
//			if(mdrNo > 0) {
//				session.setAttribute("mdrNo", String.valueOf(mdrNo));
//				request.getRequestDispatcher("/members/paymentImport.jsp").forward(request, response);
//			}else {
//				request.getRequestDispatcher("/members/paymentError.jsp").forward(request, response);
//				System.out.println("예약 불가능한 시간.");
//			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
