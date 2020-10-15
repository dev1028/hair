package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerMyPageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("디자이너 수정페이지 ");
		request.setCharacterEncoding("utf-8");
		// HttpSession session = request.getSession();
		DesignerVo designerVo = (DesignerVo) request.getSession().getAttribute("login");

//		try {
//			designerVo = (DesignerVo) ((DesignerVo) request.getSession().getAttribute("login")).clone();
//		} catch (CloneNotSupportedException e) {
//			e.printStackTrace();
//		}

		// DesignerVo resultVo = DesignerDAO.getInstance().selectOneEmail(designerVo);

		System.out.println("여긴 디자이너 정보수정페이지");
		System.out.println("디자이너정보 : " + designerVo.getDesigner_no() +" "+ designerVo.getDesigner_name() + " " + designerVo.getDesigner_phone());
		request.setAttribute("designer", designerVo);
		request.getRequestDispatcher("/designer/designerMyPage.jsp").forward(request, response);

	}

}
