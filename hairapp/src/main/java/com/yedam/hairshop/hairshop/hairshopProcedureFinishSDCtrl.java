package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopProcedureFinishDAO;
import com.yedam.hairshop.model.HairshopProcedureFinishVo;

public class hairshopProcedureFinishSDCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hsNo = (String)request.getSession().getAttribute("hsno");
		HairshopProcedureFinishVo finishVo = new HairshopProcedureFinishVo();
		finishVo.setHs_no(hsNo);
		String search = request.getParameter("search");
		finishVo.setDesigner_name(search);
		ArrayList<HairshopProcedureFinishVo> list = HairshopProcedureFinishDAO.getInstance().finishDesigner(finishVo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/hairshop/hairshopProcedureFinishList.jsp").forward(request, response);
	}

}
