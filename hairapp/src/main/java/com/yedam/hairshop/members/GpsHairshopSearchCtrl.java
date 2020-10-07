package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

public class GpsHairshopSearchCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<HairshopVo> list = HairshopDAO.getInstance().selectAll();
		
		String lat = (String) request.getParameter("lat");
		String lng = (String) request.getParameter("lng");
		if(lat != null || lng != null) {
			request.getSession().setAttribute("lat", lat);
			request.getSession().setAttribute("lng", lng);
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("gpsHairshopSearch.jsp").forward(request, response);
	}

}
