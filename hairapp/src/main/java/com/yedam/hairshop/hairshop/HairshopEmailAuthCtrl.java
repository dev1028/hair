package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.HairshopDAO;

public class HairshopEmailAuthCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_email = request.getParameter("hs_email");
		
		
		
		HairshopDAO.getInstance().updateForAuth(hs_email);
		
		response.getWriter().append("<script>")
		.append("alert('인증완료되었습니다.');")
		.append("location.href='" + request.getContextPath() + "/ajax/hairshopReturnToLogin.do';")
		.append("</script>");
	}

}
