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
		JSONArray jArray = new JSONArray();
		String hs_no = request.getSession().getAttribute("hsno").toString();
		String startDate = request.getParameter("start");
		String endDate = request.getParameter("end");
		String designer_no = request.getParameter("designer_no");
		System.out.println("ds_no"+designer_no.toString());
//		System.out.println(val);
		ArrayList<SalesVo> salesList = SalesDAO.getInstance().dailySalesAllAddDs(startDate, endDate,designer_no, hs_no);
	
		System.out.println(startDate+"ㄴㅇ");
		System.out.println(endDate);
		System.out.println(hs_no);
//if (salesList.isEmpty()) {
//	String dsNo=SalesDAO.getInstance().getdsList(designer_no);
//	JSONObject jObj = new JSONObject();
//	jObj.put("dsNo", dsNo);
//	jArray.add(jObj);
//}
		JSONObject jObj = new JSONObject();

		for (SalesVo vo : salesList) {
			jObj = new JSONObject();
			jObj.put("mdrDt", vo.getMdrDate());
			jObj.put("hNm", vo.getHName());
			jObj.put("dsNm", vo.getDsName());
			jObj.put("dsNo", vo.getDsNo());
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
