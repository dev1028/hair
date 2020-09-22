package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;

public class PaymentCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String designerNo = request.getParameter("designerNo");
		
		HttpSession session = request.getSession();
		String hsNo = (String) session.getAttribute("hsNo");
		String hhiNo = (String) session.getAttribute("hhiNo");
		
		System.out.println("designerNo: " + designerNo);
		System.out.println("hsNo: " + hsNo);
		System.out.println("hhiNo: " + hhiNo);
		
		request.getRequestDispatcher("payment.jsp").forward(request, response);
	}

}
