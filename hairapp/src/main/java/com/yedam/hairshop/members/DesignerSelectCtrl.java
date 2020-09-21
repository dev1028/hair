package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerSelectCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DesignerDAO.getInstance().selectByHairShop()
		String hsNo = request.getParameter("hsNo");
		String hhiNo = request.getParameter("hhiNo");
		System.out.println(hsNo);
		
		DesignerVo vo = new DesignerVo();
		vo.setHs_no(hsNo);
		List<DesignerVo> list = DesignerDAO.getInstance().selectByHairShop(vo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/members/designerSelect.jsp").forward(request, response);
	}

}
