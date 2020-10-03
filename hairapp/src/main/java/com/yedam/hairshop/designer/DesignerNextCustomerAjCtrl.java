package com.yedam.hairshop.designer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersReservationDAO;

public class DesignerNextCustomerAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String desNo = (String) request.getSession().getAttribute("designerNo");
		String startTime = request.getParameter("startTime");
		
		Map<String, String> resultCustomer = new HashMap<String, String>();
		resultCustomer = MembersReservationDAO.getInstance().selectReservationNext(desNo, startTime);
		
	}

}
