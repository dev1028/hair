package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class DesignerSelectResultCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DesignerSelectResultCtrl");
		
		String strDate = request.getParameter("date");
		String strStartHour = request.getParameter("hs_starttime");
		request.getSession().setAttribute("date", strDate);
		request.getSession().setAttribute("hour", strStartHour);
//		System.out.println(strDate);
//		System.out.println(strStartHour);
		
		String designerNo = request.getParameter("designerNo");
		if(designerNo != null) {
			DesignerVo tmpDesignerVo = new DesignerVo();
			tmpDesignerVo.setDesigner_no(designerNo);
			DesignerVo designerVo = DesignerDAO.getInstance().selectOne(tmpDesignerVo);
			
			HttpSession session = request.getSession();
			session.setAttribute("selDesignerVo", designerVo);
		}
		
		HairshopVo hsVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		
		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(hsVo);
		HairShopReviewVo shop2 = MembersHairshopDAO.getInstance().reviewCount(hsVo);
		HairshopBookmarkVo shop3 = MembersHairshopDAO.getInstance().bookmarkCount(hsVo);
		request.setAttribute("shop", shop);
		request.setAttribute("shop2", shop2);
		request.setAttribute("shop3", shop3);
		
		
		
		request.getRequestDispatcher("payment.do").forward(request, response);
	}

}
