package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.GuestDAO;
import com.yedam.hairshop.model.HsGusetVo;

public class CustomerSearchCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("비회원 조회");

		String hg_no = request.getParameter("hg_no");
		String hg_name = request.getParameter("hg_name");
		String hg_phone = request.getParameter("hg_phone");

		HsGusetVo guest = new HsGusetVo();
		guest.setHg_phone(hg_phone);
		guest = GuestDAO.getInstance().selectOnePhone(guest);
		if (guest == null) {
			request.setAttribute("error", "비회원 정보가 없습니다.");

		} else {

			request.setAttribute("guest", guest);
		}
		request.getRequestDispatcher("designer/customerJoinInfo.jsp").forward(request, response);
	}

}
