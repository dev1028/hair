package com.yedam.hairshop.designer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.MembersReservationVo;

public class FindMyCustomerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("/hairapp/designer/findMyCustomer.jsp");
		DesignerVo dVo = (DesignerVo) request.getSession().getAttribute("login");
		
		if(request.getParameter("inputSearch") != null) {
			MembersReservationVo mRVo = new MembersReservationVo();
			mRVo.setDesigner_no(dVo.getDesigner_no());
			mRVo.setHs_no(dVo.getHs_no());
			String divisionSearch = request.getParameter("divisionSearch");
			String inputSearch = request.getParameter("inputSearch");
			if(divisionSearch.equals("name")) {
				mRVo.setMem_name(inputSearch);
			} else if(divisionSearch.equals("tel")) {
				mRVo.setMem_phone(inputSearch);
			}
			List<MembersReservationVo> list = MembersReservationDAO.getInstance().selectReservationInfoByName(divisionSearch, mRVo);
			if(list.size() == 0) {
				request.setAttribute("customerNotFound", 0);
			} else {
				request.setAttribute("customerList", list);				
			}
			request.getRequestDispatcher("/designer/findMyCustomer.jsp").forward(request, response);
				
		} else {
			response.sendRedirect("/hairapp/designer/findMycustomerRe.do");
		}
		
		
	}

}
