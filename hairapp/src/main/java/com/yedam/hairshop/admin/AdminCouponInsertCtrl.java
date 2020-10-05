package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

public class AdminCouponInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<HairshopVo> list = new ArrayList<>();
		list = HairshopDAO.getInstance().selectAll();
		System.out.println(list.get(0).getHs_name());
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/couponInsert.jsp").forward(request, response);

	}

}
