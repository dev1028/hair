package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;
//import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;

public class DesignerSelectCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DesignerSelectCtrl");

		HttpSession session = request.getSession();
		HairshopVo hairshopVo = (HairshopVo) session.getAttribute("selHairshopVo");
		
		DesignerVo vo = new DesignerVo();
		vo.setHs_no(hairshopVo.getHs_no());
		List<DesignerVo> list = DesignerDAO.getInstance().selectByHairShop(vo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/members/designerSelect.jsp").forward(request, response);
	}

}
