package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.SalesDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.SalesVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SalesBydesignerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_no = request.getSession().getAttribute("hsno").toString();
		String startDate = request.getParameter("start");
		String endDate = request.getParameter("end");
		String designer_no = request.getParameter("designer_no");
		System.out.println("ds_no" + designer_no.toString());
		ArrayList<SalesVo> salesList = SalesDAO.getInstance().dailySalesAllAddDs(startDate, endDate, designer_no,
				hs_no);

		System.out.println(startDate + "ㄴㅇ");
		System.out.println(endDate);
		System.out.println(hs_no);

		String str = JSONArray.fromObject(salesList).toString();

		response.getWriter().print(str);
	}

}
