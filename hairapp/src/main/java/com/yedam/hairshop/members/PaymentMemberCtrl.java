package com.yedam.hairshop.members;

import java.io.IOException;

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
		
		
		HttpSession session = request.getSession();
		MembersVo loginVo = (MembersVo) session.getAttribute("login");
		HairshopVo hairshopVo = (HairshopVo) session.getAttribute("selHairshopVo");
//		HairshopHairInfoVo hairInfoVo = (HairshopHairInfoVo) session.getAttribute("selHairInfoVo");
		DesignerVo designerVo = (DesignerVo) session.getAttribute("selDesignerVo");
		
		PaymentVo payVo = new PaymentVo();
		payVo.setMem_no(loginVo.getMem_no());
		payVo.setDesigner_no(designerVo.getDesigner_no());
		payVo.setHs_no(hairshopVo.getHs_no());
		
		PaymentDAO.getInstance().pay(payVo);
		
		/*
			String mdr_no;				//예약 번호
			String mdr_date;			//예약 일자
			String mem_no;				//고객번호
			String designer_no;			//디자이너 번호
			String mdr_status;			//예약 상태
			String mdr_category_code;	//결제분류코드
			String mdr_online_price;	//온라인예약결제금액
			String mdr_request;			//헤어샵 요청사항
			String hs_no;				//미용실 번호
		 */
	}

}
