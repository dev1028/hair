package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.AdminAnalysisDAO;
import com.yedam.hairshop.model.AnalysisVo;

import net.sf.json.JSONArray;

public class AnalysisByHairshopCount implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String date = request.getParameter("date");
		AnalysisVo vo = new AnalysisVo();
		vo.setDate("2020-09");
		
		ArrayList<AnalysisVo> list = new ArrayList<>();
		list = AdminAnalysisDAO.getInstance().reservationRank(vo);
		
		String str = JSONArray.fromObject(list).toString();

		response.getWriter().print(str);
	}

}
