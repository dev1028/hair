package com.yedam.hairshop.admin;

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

		JSONObject jObj = new JSONObject();

		for (SalesVo vo : salesList) {
			jObj = new JSONObject();
			jObj.put("mdrDt", vo.getMdrDate());
			jObj.put("hNm", vo.getHName());
			jObj.put("dsNm", vo.getDsName());
			jObj.put("mdrNo", vo.getMdrNo());
			jObj.put("memNm", vo.getMemName());
			jObj.put("cd", vo.getCard());
			jObj.put("cs", vo.getCash());
			jObj.put("ka", vo.getKakao());
			jObj.put("ac", vo.getAccount());
			jObj.put("to", vo.getTotalAmountRsv());
			jArray.add(jObj);
		}

//		 System.out.println(jArray);

		String str = JSONArray.fromObject(jArray).toString();

//		System.out.println(str);
		response.getWriter().print(str);

	}

}
