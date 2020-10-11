package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.model.HairshopVo;

public class HairshopCloseDayManageCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HairshopVo vo = new HairshopVo();
		vo.setHs_no((String)request.getSession().getAttribute("hsno"));
		System.out.println("휴무페이지 미용실번호: " + vo.getHs_no());
		request.setAttribute("hsno", vo);
		request.getRequestDispatcher("/hairshop/HairshopCloseDayManage.jsp").forward(request, response);
	}

}
