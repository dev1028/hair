package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.EmpDAO;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.members.Controller;
import com.yedam.hairshop.model.EmpVo;
import com.yedam.hairshop.model.HairshopVo;

public class adminLoginCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// login
		// 1.파라미터 보에 담고
		EmpVo empVo = new EmpVo();
		empVo.setEmp_email(request.getParameter("emp_email"));
		empVo.setEmp_password(request.getParameter("emp_password"));
		EmpVo resultVo = EmpDAO.getInstance().loginSelectOne(empVo);

		String page = "";
		if (resultVo == null) { // 아이디없음
			request.setAttribute("errormsg", "noid");
			page = "/admin/adminLogin.jsp";
		} else {
			if (empVo.getEmp_password().equals(resultVo.getEmp_password())) {
				request.getSession().setAttribute("login", resultVo);
				request.getSession().setAttribute("empno", resultVo.getEmp_no());
				page = "/admin/adminMain.do";
				System.out.println("correct");
			} else { // 패스워드 불일치
				request.setAttribute("errormsg", "nopw");
				page = "/admin/adminLogin.jsp";
			}
		}
		// 4.뷰페이지이동 포워드 리다이렉트 또는 뷰페이지 출력
		System.out.println(page);
		request.getRequestDispatcher(page).forward(request, response);
	}

}
