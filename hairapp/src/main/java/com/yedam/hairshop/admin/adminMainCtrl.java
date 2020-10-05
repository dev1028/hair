package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

public class adminMainCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<HairshopVo>hsList = HairshopDAO.getInstance().selectAll();
		request.setAttribute("hsList", hsList);
		request.getRequestDispatcher("/admin/adminMain.jsp").forward(request, response);
//		response.sendRedirect("/hairapp/admin/adminMain.jsp");

	}

}
