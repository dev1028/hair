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
		String latlng = request.getParameter("latlng");
		String roadAddress = request.getParameter("roadAddress");
		
		HttpSession session = request.getSession();
		MembersVo membersVo = (MembersVo) session.getAttribute("login");
		if(membersVo != null) {
			if(latlng != null) {
				latlng = latlng.replace("(", "").replace(")", "");
				System.out.println(roadAddress);
				membersVo.setMem_addr(roadAddress);
				membersVo.setMem_latitude_longitude(latlng);
				MembersDAO.getInstance().updateLatlng(membersVo);
			}else {
				latlng = membersVo.getMem_latitude_longitude();
			}
			String[] tmplatlng = latlng.split(",");
			request.setAttribute("latlng", latlng);
			request.setAttribute("lat", tmplatlng[0]);
			request.setAttribute("lng", tmplatlng[1]);
		}
		request.getRequestDispatcher("myRegionSetting.jsp").forward(request, response);
	}

}
