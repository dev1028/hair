package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopProcedureFinishDAO;
import com.yedam.hairshop.model.HairshopProcedureFinishVo;

public class hairshopProcedureFinishListCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopProcedureFinishVo vo = new HairshopProcedureFinishVo();
		
		vo.setHs_no((String)request.getSession().getAttribute("hsno"));
		
		ArrayList<HairshopProcedureFinishVo> list = HairshopProcedureFinishDAO.getInstance().selectAll(vo);
		request.setAttribute("list",list);
		request.getRequestDispatcher("/hairshop/hairshopProcedureFinishList.jsp").forward(request, response);
	}

}
