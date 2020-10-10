package com.yedam.hairshop.admin;

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

public class AnalysisGenderCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		ArrayList<AnalysisVo> list = new ArrayList<>();
		String date = request.getParameter("date");
		AnalysisVo vo = new AnalysisVo();
		vo.setDate(date);
		System.out.println(date);
		list = AnalysisDAO.getInstance().countGender(vo);
		JSONArray jarr = new JSONArray();
		JSONObject jobj = new JSONObject(); 
		for(AnalysisVo rvo : list) {
			
		jobj.put(rvo.getGender(), rvo.getGender_cnt());
		
		jarr.add(jobj);
		}
		String str = JSONArray.fromObject(jarr).toString();

		response.getWriter().print(str);

		
		
	}

}
