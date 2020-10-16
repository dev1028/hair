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

public class AnalysisDesignerTotalCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String hs_no = request.getSession().getAttribute("hsno").toString();
		
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String month = request.getParameter("month");
		
		AnalysisVo vo = new AnalysisVo();
		vo.setMonth(month);
		vo.setHs_no(hs_no);
		vo.setStartdate("2020-09-01");
		vo.setEnddate("2020-10-01");
		ArrayList<AnalysisVo> rsvlist = AnalysisDAO.getInstance().designerRsvRank(vo);
		request.setAttribute("rsvlist", rsvlist);
		request.setAttribute("rsvjsonlist", JSONArray.fromObject(rsvlist).toString());
		ArrayList<AnalysisVo> saleslist = AnalysisDAO.getInstance().designerSalesRank(vo);
		request.setAttribute("saleslist", saleslist);
		request.setAttribute("salesjsonlist", JSONArray.fromObject(saleslist).toString());
		ArrayList<AnalysisVo> ratelist = AnalysisDAO.getInstance().designerRateRank(vo);
		request.setAttribute("ratelist", ratelist);
		request.setAttribute("ratejsonlist", JSONArray.fromObject(ratelist).toString());

		request.getRequestDispatcher("/hairshop/analysisDesignerTotal.jsp").forward(request, response);

	}

}
