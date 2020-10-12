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

public class AnalysisDesignerRsvRankCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_no = request.getSession().getAttribute("hsno").toString();
		AnalysisVo vo = new AnalysisVo();
		vo.setHs_no(hs_no);
		ArrayList<AnalysisVo> list = AnalysisDAO.getInstance().designerRsvRank(vo);
		
		response.getWriter().print(JSONArray.fromObject(list).toString());

	}

}
