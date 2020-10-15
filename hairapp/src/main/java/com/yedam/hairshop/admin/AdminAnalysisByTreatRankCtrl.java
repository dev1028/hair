package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.AdminAnalysisDAO;
import com.yedam.hairshop.model.AnalysisVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AdminAnalysisByTreatRankCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<AnalysisVo> list = AdminAnalysisDAO.getInstance().rankByTreat();
		JSONArray jarr = new JSONArray();
		for (AnalysisVo rvo : list) {
			//JSONObject jobj = new JSONObject();
			JSONObject jobj = JSONObject.fromObject(rvo);
			//jobj.put(rvo.getHhi_name(), rvo.getCnt());
			jarr.add(jobj);
		}
		String str = JSONArray.fromObject(jarr).toString();
		System.out.println(str);
		response.getWriter().print(str);
	}

}
