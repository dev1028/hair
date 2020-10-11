package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairshopHairInfoVo;

public class HairSelectResultCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairSelectResultCtrl");
		
		String[] hhiNos = request.getParameterValues("cart");
		String hour = request.getParameter("total_hour");
		request.getSession().setAttribute("total_hour", hour);
		System.out.println(hour + "시간");
		
		if(hhiNos == null) {
			return;
		}
		else {
			List<HairshopHairInfoVo> listHairInfoVo = new ArrayList<HairshopHairInfoVo>();
			for(String hhiNo : hhiNos) {
				HairshopHairInfoVo tmpHairInfoVo = new HairshopHairInfoVo();
				tmpHairInfoVo.setHhi_no(hhiNo);
				
				HairshopHairInfoVo hairInfoVo = HairshopHairInfoDAO.getInstance().selectHairInfo(tmpHairInfoVo);
				listHairInfoVo.add(hairInfoVo);
			}
			request.getSession().setAttribute("selListHairInfoVo", listHairInfoVo);
			request.getRequestDispatcher("designerSelect.do").forward(request, response);
		}
		
//		
//		//선택된 헤어정보를 session에 담는다.
//		String hhiNo = request.getParameter("hhiNo");
//		HairshopHairInfoVo hairInfoVo = new HairshopHairInfoVo();
//		hairInfoVo.setHhi_no(hhiNo);
//		
//		HairshopHairInfoVo selHairInfoVo = HairshopHairInfoDAO.getInstance().selectHairInfo(hairInfoVo);
//		if(selHairInfoVo == null)
//		{
//			System.out.println("selHairInfoVo is null");
//		}
//		else
//		{
//			request.getSession().setAttribute("selHairInfoVo", selHairInfoVo);
//			request.getRequestDispatcher("designerSelect.do").forward(request, response);
//		}
	}

}
