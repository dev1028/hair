package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.ChangeUtil;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopVo;


public class employeeCloseDayManageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_no = (String) request.getSession().getAttribute("hsno");
		DesignerVo dVo = new DesignerVo();
		//HairshopVo hvo = new HairshopVo();
		//hvo.setHs_no(hs_no);

		//HairshopVo loginVo = (HairshopVo) request.getSession().getAttribute("login");
		
		HairshopVo tmpVo = new HairshopVo();
		tmpVo.setHs_no(hs_no);
		HairshopVo loginVo = HairshopDAO.getInstance().selectOne(tmpVo);
		
		loginVo.setHs_dayoff(ChangeUtil.changeDayOffNumToStr(loginVo.getHs_dayoff()));
		loginVo.setHs_regdate(loginVo.getHs_regdate().split(" ")[0]);
		
		
		
		
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
			System.out.println(emplist);
			request.setAttribute("hairshop", loginVo);
			request.setAttribute("emplist", emplist);
			request.getRequestDispatcher("/hairshop/employeeCloseDayManage.jsp").forward(request, response);
		
	}
}
