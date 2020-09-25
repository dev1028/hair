package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.SalesDAO;
import com.yedam.hairshop.model.SalesVo;

public class salesStatisticsFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDate = request.getParameter("start");
		String endDate = request.getParameter("end");
		String ds = request.getParameter("ds");
		ArrayList<SalesVo> list = SalesDAO.getInstance().dailySalesAll(startDate, endDate);

		System.out.println("fctl");
		

		request.setAttribute("salesResult", list);
//		response.sendRedirect("");
		request.getRequestDispatcher("/hairshop/hairshopStatistics.jsp").forward(request, response);
	}

}
