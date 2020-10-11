package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.AdminMemberManageDAO;
import com.yedam.hairshop.model.HairshopVo;

import net.sf.json.JSONArray;

public class AdminNewHairshopApprovalCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String hs_no=request.getParameter("hs_no");
		AdminMemberManageDAO.getInstance().hairshopApproval(hs_no);
		ArrayList<HairshopVo> list = new ArrayList<>();
		list = AdminMemberManageDAO.getInstance().newHairshopList();
		request.setAttribute("list", list);
		request.setAttribute("hairshoplist", JSONArray.fromObject(list));
		request.getRequestDispatcher("/admin/adminNewHairshopList.jsp").forward(request, response);
		

	}

}
