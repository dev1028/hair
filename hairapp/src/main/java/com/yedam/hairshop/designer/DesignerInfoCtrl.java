	package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerInfoCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		//session에서 조회하는걸로 수정해야됨.		
		DesignerVo vo = (DesignerVo)request.getSession().getAttribute("login");
		
		DesignerVo designer = DesignerDAO.getInstance().selectOne(vo);
		request.setAttribute("designer", designer);
		System.out.println("designer NO: " + designer.getDesigner_no());
		request.getRequestDispatcher("/designer/designerUpdate.jsp").forward(request, response);
	}
}
