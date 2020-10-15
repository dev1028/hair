package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.CouponDAO;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.CouponVo;
import com.yedam.hairshop.model.HairshopVo;

public class AdminCouponDeleteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] hsc_nolist = request.getParameterValues("hsc_no");

		for (String hsc_no : hsc_nolist) {

			CouponVo vo = new CouponVo();
			vo.setHsc_no(hsc_no);
			CouponDAO.getInstance().delete(vo);

		}
		ArrayList<CouponVo> list = new ArrayList<>();
		List<HairshopVo> hairshoplist = new ArrayList<>();
		list = CouponDAO.getInstance().selectAll(null);
		request.setAttribute("list", list);
		hairshoplist = HairshopDAO.getInstance().selectAll();
		System.out.println(list.get(0).getHs_name());
		request.setAttribute("hairshoplist", hairshoplist);
		request.getRequestDispatcher("/admin/adminCouponManage.jsp").forward(request, response);
	}
}
