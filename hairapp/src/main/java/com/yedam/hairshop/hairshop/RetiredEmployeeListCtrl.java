package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.DesignersLeaveInfoDAO;
import com.yedam.hairshop.members.Controller;
import com.yedam.hairshop.model.DLeaveInfoJoinDesignerVo;

public class RetiredEmployeeListCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_no = (String) request.getSession().getAttribute("hsno");
		DLeaveInfoJoinDesignerVo dVo = new DLeaveInfoJoinDesignerVo();
		dVo.setHs_no(hs_no);
		ArrayList<DLeaveInfoJoinDesignerVo> list = DesignersLeaveInfoDAO.getInstance().selectHSAll(dVo);

			request.setAttribute("rlist", list);			
		
		
		request.getRequestDispatcher("/hairshop/retiredEmployeeList.jsp").forward(request, response);
	}

}
