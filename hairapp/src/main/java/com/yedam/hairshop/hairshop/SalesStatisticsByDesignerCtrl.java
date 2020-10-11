package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.SalesDAO;
import com.yedam.hairshop.model.DesignerVo;

public class SalesStatisticsByDesignerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String hs_no = request.getSession().getAttribute("hsno").toString();
		
		ArrayList<DesignerVo> list = SalesDAO.getInstance().getDsName(hs_no);
		request.setAttribute("list", list);

		request.getRequestDispatcher("/hairshop/hairshopStatisticsByDs.jsp").forward(request, response);
	}
}