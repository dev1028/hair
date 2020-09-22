package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersVo;
import com.yedam.hairshop.model.PaymentVo;

public class PaymentCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String designerNo = request.getParameter("designerNo");
		
		HttpSession session = request.getSession();
		String hsNo = (String) session.getAttribute("hsNo");
		String hhiNo = (String) session.getAttribute("hhiNo");
		
		System.out.println("designerNo: " + designerNo);
		System.out.println("hsNo: " + hsNo);
		System.out.println("hhiNo: " + hhiNo);
		
		//결제할 때 헤어정보
		HairshopHairInfoVo tmpHairInfoVo = new HairshopHairInfoVo();
		tmpHairInfoVo.setHhi_no(hhiNo);
		HairshopHairInfoVo hairInfoVo = HairshopHairInfoDAO.getInstance().selectHairInfo(tmpHairInfoVo);
		request.setAttribute("hairInfo", hairInfoVo);
		if(hairInfoVo == null) {
			System.out.println("헤어정보 로딩 실패");
		}
		System.out.println("HHI_NAME:" + hairInfoVo.getHhi_name());
		
		//결제할때 샵정보
		HairshopVo tmpHairshopVo = new HairshopVo();
		tmpHairshopVo.setHs_no(hsNo);
		HairshopVo hairshopVo = HairshopDAO.getInstance().selectOne(tmpHairshopVo);
		request.setAttribute("hairshopInfo", hairshopVo);
		if(hairshopVo == null) {
			System.out.println("미용실 정보 로딩 실패");
		}
		
		//결제할때 디자이너 정보
		DesignerVo tmpDesignerVo = new DesignerVo();
		tmpDesignerVo.setDesigner_no(designerNo);
		DesignerVo designerVo = DesignerDAO.getInstance().selectOne(tmpDesignerVo);
		request.setAttribute("designerInfo", designerVo);
		if(designerVo == null) {
			System.out.println("디자이너 정보 로딩 실패");
		}
		
		
		
		//결제할 고객정보
		//MembersVo tmpMemberVo = new MembersVo();
		
		request.getRequestDispatcher("payment.jsp").forward(request, response);
	}

}
