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

public class AnalysisTreatTableCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		AnalysisVo vo = new AnalysisVo();
		vo.setDate("2020-09");
		vo.setHs_no("2");
		ArrayList<AnalysisVo> list = new ArrayList<>();
		list = AnalysisDAO.getInstance().treatRank(vo);
		
		String str = JSONArray.fromObject(list).toString();

		response.getWriter().print(str);
	}

}
