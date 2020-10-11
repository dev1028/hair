package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.ChangeUtil;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class employeeCloseDayManageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_no = (String) request.getSession().getAttribute("hsno");
		DesignerVo dVo = new DesignerVo();
		dVo.setHs_no(hs_no);
		ArrayList<DesignerVo> emplist = DesignerDAO.getInstance().selectByHairShop(dVo);
		for (DesignerVo emp : emplist) {
			if (emp.getDesigner_dayoff() == null) {
				emp.setDesigner_dayoff("-");
			} else {
				emp.setDesigner_dayoff(ChangeUtil.changeDayOffNumToStr(emp.getDesigner_dayoff()));
			}

			if (emp.getHire_date() == null) {
				emp.setHire_date("-");
			} else {
				String[] dateList = emp.getHire_date().trim().split(" ");
				emp.setHire_date(dateList[0]);
			}
		}
		
			request.setAttribute("emplist", emplist);
			request.getRequestDispatcher("/hairshop/employeeCloseDayManage.jsp").forward(request, response);
		
	}
}
