package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.ChangeUtil;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.model.HairshopVo;

public class MyHairshopInfoCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopVo loginVo = (HairshopVo) request.getSession().getAttribute("login");
		loginVo.setHs_dayoff(ChangeUtil.changeDayOffNumToStr(loginVo.getHs_dayoff()));
		loginVo.setHs_regdate(loginVo.getHs_regdate().split(" ")[0]);
		request.setAttribute("hairshop", loginVo);
		request.getRequestDispatcher("/hairshop/myHairshopInfo.jsp").forward(request, response);
		
	}

}
