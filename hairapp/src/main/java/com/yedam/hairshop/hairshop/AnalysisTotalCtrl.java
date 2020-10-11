package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.AnalysisDAO;
import com.yedam.hairshop.model.AnalysisVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AnalysisTotalCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		AnalysisVo vo = new AnalysisVo();
		vo.setDate(date);

		ArrayList<AnalysisVo> list = AnalysisDAO.getInstance().countTotal(vo);
		JSONArray jarr = new JSONArray();
		for (AnalysisVo rvo : list) {
			JSONObject jobj = new JSONObject();
			jobj.put("date", rvo.getDate());
			jobj.put("cnt", rvo.getCnt());
System.out.println(rvo.getCnt());
			jarr.add(jobj);
		}
		String str = JSONArray.fromObject(jarr).toString();

		response.getWriter().print(str);
	}
}
