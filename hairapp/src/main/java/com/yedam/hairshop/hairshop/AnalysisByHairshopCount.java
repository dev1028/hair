package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.AdminAnalysisDAO;
import com.yedam.hairshop.dao.AnalysisDAO;
import com.yedam.hairshop.model.AnalysisVo;

import net.sf.json.JSONArray;

public class AnalysisByHairshopCount implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String date = request.getParameter("month");
		AnalysisVo vo = new AnalysisVo();
		vo.setDate("2020-10");

		ArrayList<AnalysisVo> list = new ArrayList<>();
//		list = AdminAnalysisDAO.getInstance().reservationRank(vo);

		vo.setMonth(date);

		ArrayList<AnalysisVo> rsvlist = AdminAnalysisDAO.getInstance().hairshopRsvRank(vo);
		request.setAttribute("rsvlist", rsvlist);
		request.setAttribute("rsvjsonlist", JSONArray.fromObject(rsvlist).toString());
		ArrayList<AnalysisVo> saleslist = AdminAnalysisDAO.getInstance().hairshopSalesRank(vo);
		request.setAttribute("saleslist", saleslist);
		request.setAttribute("salesjsonlist", JSONArray.fromObject(saleslist).toString());
		ArrayList<AnalysisVo> ratelist = AdminAnalysisDAO.getInstance().hairshopRateRank(vo);
		request.setAttribute("ratelist", ratelist);
		request.setAttribute("ratejsonlist", JSONArray.fromObject(ratelist).toString());




		request.getRequestDispatcher("/admin/adminAnalysisByHairshop.jsp").forward(request, response);



	}

}
