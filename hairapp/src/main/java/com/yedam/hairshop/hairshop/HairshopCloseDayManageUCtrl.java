package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.hairshopCloseDayManageDAO;
import com.yedam.hairshop.model.HairshopVo;

public class HairshopCloseDayManageUCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairshopCloseDayManageUCtrl");

		String[] dayoffs = request.getParameterValues("dayoff");
		if (dayoffs == null) {
			System.out.println("dayoffs is null");
		} else {
			String strDayoff = "";
			for (int i = 0; i < dayoffs.length; i++) {
				strDayoff += dayoffs[i] + ",";
			}
			if (strDayoff.length() > 0)
				strDayoff = strDayoff.substring(0, strDayoff.length() - 1);

			System.out.println("dayoff: " + strDayoff);

			HairshopVo hairshopVo = new HairshopVo();
			String hsNo = (String) request.getSession().getAttribute("hsno");
			hairshopVo.setHs_no(hsNo);
			hairshopVo.setHs_dayoff(strDayoff);
			int r =hairshopCloseDayManageDAO.getInstance().dayOffUpdate(hairshopVo);
			
			// 왜 안되노
//			if (r == 1) {
//				hairshopVo = (HairshopVo) request.getSession().getAttribute("hsno");
//				hairshopVo.setHs_dayoff(strDayoff);
//				request.getSession().setAttribute("hsno", hairshopVo);
//			}
		}
		//response.sendRedirect(request.getContextPath() + "/hairshop/employeeCloseDayManage.do");
	}
}
