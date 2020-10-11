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

public class AnalysisTreatGenderCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<AnalysisVo> mlist = new ArrayList<>();
		String date = request.getParameter("date");
		AnalysisVo vo = new AnalysisVo();
		vo.setDate(date);
		System.out.println(date);
		mlist = AnalysisDAO.getInstance().treatRankFemale(vo);
		mlist = AnalysisDAO.getInstance().treatRankMale(mlist);

		String str = JSONArray.fromObject(mlist).toString();

		response.getWriter().print(str);

	}

}
