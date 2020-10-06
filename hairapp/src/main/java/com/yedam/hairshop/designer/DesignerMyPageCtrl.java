package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerMyPageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("디자이너 수정페이지 ");
		request.setCharacterEncoding("utf-8");
		// HttpSession session = request.getSession();
		String designer_email = ((DesignerVo)request.getSession().getAttribute("login")).getDesigner_email();
		
		DesignerVo designerVo = new DesignerVo();
		designerVo.setDesigner_email(designer_email);
		
		DesignerVo resultVo = DesignerDAO.getInstance().selectOneEmail(designerVo);
		request.setAttribute("designer", resultVo);
		request.getRequestDispatcher("/designer/designerMyPage.jsp").forward(request, response);

	}

}
