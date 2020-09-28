package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.members.Controller;
import com.yedam.hairshop.model.HairshopVo;


public class HairshopDesignerLoginCtrl implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	// login
		// 1.파라미터 보에 담고
		HairshopVo hsVo = new HairshopVo();
		hsVo.setHs_email(request.getParameter("hs_email"));
		hsVo.setHs_pw(request.getParameter("hs_pw"));
		
		// 2.서비스 처리(db)
		// 싱글톤사용
		HairshopVo resultVo = HairshopDAO.getInstance().loginSelectOne(hsVo);

		// 3.결과저장
		String page = "";
		if (resultVo == null) { // 아이디없음
			request.setAttribute("errormsg", "noid");
			page = "/hairshop/hairshopDesignerLogin.jsp";
		} else {
			if (hsVo.getHs_pw().equals(resultVo.getHs_pw())) {
				request.getSession().setAttribute("login", resultVo);
				request.getSession().setAttribute("hsno", resultVo.getHs_no());
				page = "/hairshop/hairshopMain.do";
			} else { // 패스워드 불일치
				request.setAttribute("errormsg", "nopw");
				page = "/hairshop/hairshopDesignerLogin.jsp";
			}
		}
		// 4.뷰페이지이동 포워드 리다이렉트 또는 뷰페이지 출력
		request.getRequestDispatcher(page).forward(request, response);
	}

}
