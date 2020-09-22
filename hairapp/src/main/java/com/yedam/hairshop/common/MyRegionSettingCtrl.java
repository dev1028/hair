package com.yedam.hairshop.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyRegionSettingCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("myRegionSetting.jsp").forward(request, response);
//		request.getRequestDispatcher("/members/memberMain.jsp").forward(request, response);
	}

}
