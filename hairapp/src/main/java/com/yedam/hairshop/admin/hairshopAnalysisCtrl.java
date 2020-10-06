package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.SalesDAO;
import com.yedam.hairshop.model.DesignerVo;

public class hairshopAnalysisCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 ArrayList<DesignerVo> list = SalesDAO.getInstance().getDsName();
	request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("/admin/hairshopAnalysis.jsp").forward(request, response);

	}

}
