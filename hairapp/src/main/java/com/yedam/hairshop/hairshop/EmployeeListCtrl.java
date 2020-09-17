package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopVo;

public class EmployeeListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//직원관리 페이지로 가기전 미용실번호를 가져와야함
		HairshopVo hVo = (HairshopVo) request.getSession().getAttribute("login");
		DesignerVo dVo = new DesignerVo();
		dVo.setHs_no(hVo.getHs_no());
		ArrayList<DesignerVo> emplist = DesignerDAO.getInstance().selectByHairShop(dVo);
		
		request.setAttribute("emplist", emplist);
		request.getRequestDispatcher("/hairshop/employeeList.jsp").forward(request, response);
	}

}
