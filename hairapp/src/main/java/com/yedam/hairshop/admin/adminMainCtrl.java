package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.AdminMemberManageDAO;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

import net.sf.json.JSONArray;

public class adminMainCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HairshopVo> list = new ArrayList<>();
		list = AdminMemberManageDAO.getInstance().newHairshopList();
		request.setAttribute("list", list);
		request.setAttribute("hairshoplist", JSONArray.fromObject(list));
		request.getRequestDispatcher("/admin/adminMain.jsp").forward(request, response);
//		response.sendRedirect("/hairapp/admin/adminMain.jsp");

	}

}
