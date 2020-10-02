package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

public class AdminHairshopManageFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<HairshopVo> list = HairshopDAO.getInstance().selectAll();
		System.out.println(list.get(0).getHs_no());
		request.setAttribute("list", list);

	request.getRequestDispatcher("/admin/adminHairshopManage.jsp").forward(request, response);
	}

}
