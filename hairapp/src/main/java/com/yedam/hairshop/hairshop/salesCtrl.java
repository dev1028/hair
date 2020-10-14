package com.yedam.hairshop.hairshop;

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

public class salesCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		JSONArray jArray = new JSONArray();
		String hs_no = request.getSession().getAttribute("hsno").toString();
		String startDate = request.getParameter("start");
		String endDate = request.getParameter("end");
		String ds = request.getParameter("ds");
		ds = "10";
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(hs_no);
//		ArrayList<SalesVo> salesList = SalesDAO.getInstance().dailySalesAllAddDs(startDate, endDate,ds);
		ArrayList<SalesVo> salesList = SalesDAO.getInstance().dailySalesAll(startDate, endDate,hs_no);

		

//		 System.out.println(jArray);

		String str = JSONArray.fromObject(salesList).toString();

//		System.out.println(str);
		response.getWriter().print(str);

	}

}
