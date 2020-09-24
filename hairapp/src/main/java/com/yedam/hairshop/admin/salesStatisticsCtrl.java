package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.EmpDAO;
import com.yedam.hairshop.dao.SalesDAO;
import com.yedam.hairshop.model.EmpVo;
import com.yedam.hairshop.model.SalesVo;

public class salesStatisticsCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		request.getRequestDispatcher("/hairshop/hairshopStatistics.jsp").forward(request, response);
	}

}
