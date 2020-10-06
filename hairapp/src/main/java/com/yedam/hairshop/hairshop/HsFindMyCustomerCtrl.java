package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.MembersReservationVo;

public class HsFindMyCustomerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String hsNo = (String) request.getSession().getAttribute("hsno");
				
				if(request.getParameter("inputSearch") != null) {
					MembersReservationVo mRVo = new MembersReservationVo();
					mRVo.setHs_no(hsNo);
					String divisionSearch = request.getParameter("divisionSearch");
					String inputSearch = request.getParameter("inputSearch");
					if(divisionSearch.equals("name")) {
						mRVo.setMem_name(inputSearch);
					} else if(divisionSearch.equals("tel")) {
						mRVo.setMem_phone(inputSearch);
					}
					List<MembersReservationVo> list = MembersReservationDAO.getInstance().selectRIByNameForHS(divisionSearch, mRVo);
					if(list.size() == 0) {
						request.setAttribute("customerNotFound", 0);
					} else {
						request.setAttribute("customerList", list);				
					}
					request.getRequestDispatcher("/hairshop/hsFindMyCustomer.jsp").forward(request, response);
						
				} else {
					response.sendRedirect("/hairapp/hairshop/hsFindMycustomerRe.do");
				}
				
				

	}

}
