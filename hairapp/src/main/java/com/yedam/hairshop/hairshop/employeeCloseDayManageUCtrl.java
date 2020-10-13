package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.hairshopCloseDayManageDAO;
import com.yedam.hairshop.model.DesignerVo;

public class employeeCloseDayManageUCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairshopCloseDayManageUCtrl");
		String designer_no = request.getParameter("empno");
		System.out.println("디자이너 번호    " + designer_no);
		String[] designerDayoffs = request.getParameterValues("designerDayoff");
		if(designerDayoffs == null) {
			System.out.println("dayoffs is null");
		}
		else {
			String strDayoff = "";
			for(int i=0; i<designerDayoffs.length; i++) {
				strDayoff += designerDayoffs[i] + ",";
			}
			if(strDayoff.length() > 0)
				strDayoff = strDayoff.substring(0, strDayoff.length()-1);
			
			System.out.println("designerDayoffs: " + strDayoff);
			
			DesignerVo designerVo = new DesignerVo();
//			String designer_no = request.getSession().getAttribute("login")
	//		String designer_no = (String) request.getSession().getAttribute("login");
			System.out.println("디자이너 번호"+ designer_no);
			designerVo.setDesigner_no(designer_no);
			designerVo.setDesigner_dayoff(strDayoff);

			hairshopCloseDayManageDAO.getInstance().designerDayOffUpdate(designerVo);
			//request.getRequestDispatcher("/hairshop/employeeCloseDayManage.jsp").forward(request, response);
		}
		
	}

}
