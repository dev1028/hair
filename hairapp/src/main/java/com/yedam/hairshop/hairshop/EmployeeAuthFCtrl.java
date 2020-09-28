package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.members.Controller;

public class EmployeeAuthFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String designer_email = request.getParameter("designer_email");
		
		
		
		DesignerDAO.getInstance().updateForAuth(designer_email);
		
		response.getWriter().append("<script>")
		.append("alert('인증완료되었습니다.');")
		.append("location.href='hairshopReturnToLogin.do';")
		.append("</script>");
	}

}
