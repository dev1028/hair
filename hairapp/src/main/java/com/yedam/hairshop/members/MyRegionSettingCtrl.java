package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MyRegionSettingCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lat = (String) request.getParameter("lat");
		String lng = (String) request.getParameter("lng");
		if(lat != null || lng != null) {
			request.getSession().setAttribute("lat", lat);
			request.getSession().setAttribute("lng", lng);
		}
		
		HttpSession session = request.getSession();
		MembersVo membersVo = (MembersVo) session.getAttribute("login");
		if(membersVo != null) {
			if(lat != null) {
				String roadAddress = request.getParameter("roadAddress");
				if(roadAddress != null) {
					membersVo.setMem_addr(roadAddress);
				}
				membersVo.setMem_latitude_longitude(lat + "," + lng);
				MembersDAO.getInstance().updateLatlng(membersVo);
			}
		}
		request.getRequestDispatcher("myRegionSetting.jsp").forward(request, response);
	}

}
