package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.SalesDAO;

import net.sf.json.JSONArray;

public class ChartCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//String hs_no= request.getSession().getAttribute("hsno").toString();
		List<Map<String, String>> list = SalesDAO.getInstance().chart("2");
		
		String str = JSONArray.fromObject(list).toString();
		response.getWriter().print(str);

	}

}
