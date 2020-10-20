package com.yedam.hairshop.designer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.AnalysisDAO;
import com.yedam.hairshop.model.AnalysisVo;

import net.sf.json.JSONArray;

public class designerChart implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String designer_no = request.getSession().getAttribute("designerNo").toString();
		ArrayList<AnalysisVo> list = new ArrayList<>();

		list = AnalysisDAO.getInstance().designerChart(designer_no);
		response.getWriter().print(JSONArray.fromObject(list));
	}

}
