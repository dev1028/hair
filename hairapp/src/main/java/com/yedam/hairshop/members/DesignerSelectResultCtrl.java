package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerSelectResultCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DesignerSelectResultCtrl");
		
		String designerNo = request.getParameter("designerNo");
		if(designerNo != null) {
			DesignerVo tmpDesignerVo = new DesignerVo();
			tmpDesignerVo.setDesigner_no(designerNo);
			DesignerVo designerVo = DesignerDAO.getInstance().selectOne(tmpDesignerVo);
			
			HttpSession session = request.getSession();
			session.setAttribute("selDesignerVo", designerVo);
		}
		request.getRequestDispatcher("payment.do").forward(request, response);
	}

}
