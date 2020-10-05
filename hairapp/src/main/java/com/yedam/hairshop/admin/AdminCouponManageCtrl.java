package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.CouponDAO;
import com.yedam.hairshop.model.CouponVo;

public class AdminCouponManageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CouponVo> list = new ArrayList<>();
		list = CouponDAO.getInstance().selectAll(null);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/adminCouponManage.jsp").forward(request, response);

	}

}
