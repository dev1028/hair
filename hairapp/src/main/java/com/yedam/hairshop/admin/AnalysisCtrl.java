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

public class AnalysisCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String term = request.getParameter("term");
		String hsNo = (String)request.getSession().getAttribute("hsno");
		
		AnalysisVo vo = new AnalysisVo();
		vo.setHs_no(hsNo);
		
		ArrayList<AnalysisVo> list = null;
		System.out.println(term);
		if(term.equals("day")) {
			list = AnalysisDAO.getInstance().getDayList(vo);
		}else if(term.equals("month")) {
			list = AnalysisDAO.getInstance().getMonthList(vo);
		}else if(term.equals("year")) {
			list = AnalysisDAO.getInstance().getYearList(vo);
		}
		
		String str = JSONArray.fromObject(list).toString();
		System.out.println(str);
		response.getWriter().print(str);
	}

}
