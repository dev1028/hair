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

public class AnalysisAgeCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<AnalysisVo> listf = new ArrayList<>();
		ArrayList<AnalysisVo> listm = new ArrayList<>();
		String date = request.getParameter("date");
		AnalysisVo vo = new AnalysisVo();
		vo.setDate(date);
		System.out.println(date);
		listf = AnalysisDAO.getInstance().countAgeByFemale(vo);
		listm = AnalysisDAO.getInstance().countAgeByMale(vo);

		JSONArray jarr = new JSONArray();
		JSONObject jobj = new JSONObject();
		for (AnalysisVo rvo : listf) {
System.out.println(rvo.getAge());
System.out.println(rvo.getAge_cnt());
			jobj.put("gender", "female");
			jobj.put("age", rvo.getAge());
			jobj.put("age_cnt", rvo.getAge_cnt());
			jarr.add(jobj);
		}
		for (AnalysisVo rvo : listm) {

			jobj.put("gender", "male");
			jobj.put("age", rvo.getAge());
			jobj.put("age_cnt", rvo.getAge_cnt());
			jarr.add(jobj);
		}
		String str = JSONArray.fromObject(jarr).toString();

		response.getWriter().print(str);

	}

}
