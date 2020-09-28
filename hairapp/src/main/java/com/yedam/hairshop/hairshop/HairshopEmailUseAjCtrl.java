package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.members.Controller;

public class HairshopEmailUseAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//email count 해서 조회 1은 있음 0은 없음
		int r = HairshopDAO.getInstance().selectCntEmail(request.getParameter("hs_email"));
		response.getWriter().print(r);
	}

}
