package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

public class HairshopSelectResultCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairshopSelectResultCtrl");
		
		//선택된 헤어샵 정보를 session에 담는다.
		String hsNo = request.getParameter("hsNo");
		if(hsNo != null) {
			HairshopVo vo = new HairshopVo();
			System.out.println("hsNo: " + hsNo);
			vo.setHs_no(hsNo);
		
			HairshopVo selHairshopVo = HairshopDAO.getInstance().selectOne(vo);
			request.getSession().setAttribute("selHairshopVo", selHairshopVo);
			request.getRequestDispatcher("hairSelect.do").forward(request, response);
		}else {
			System.out.println("헤어샵이 선택 되지 않았습니다.");
		}
	}

}
