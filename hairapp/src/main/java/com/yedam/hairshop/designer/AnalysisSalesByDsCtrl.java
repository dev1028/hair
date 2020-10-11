package com.yedam.hairshop.designer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.SalesDAO;
import com.yedam.hairshop.model.SalesVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AnalysisSalesByDsCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String designer_no = request.getSession().getAttribute("designerNo").toString();
		String startDate = request.getParameter("start");
		String endDate = request.getParameter("end");
		System.out.println("ds_no"+designer_no.toString());
//		System.out.println(val);
		ArrayList<SalesVo> list = SalesDAO.getInstance().dailySalesByDesigner(startDate, endDate,designer_no);
	
		System.out.println(startDate+"ㄴㅇ");
		System.out.println(endDate);
;
		response.getWriter().print(JSONArray.fromObject(list).toString());
	}
	

}
