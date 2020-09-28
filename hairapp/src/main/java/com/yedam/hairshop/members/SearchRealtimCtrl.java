package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.yedam.hairshop.dao.SearchDAO;
import com.yedam.hairshop.model.SearchVo;

public class SearchRealtimCtrl implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String term = request.getParameter("term");
		JsonArray jsonArray = new JsonArray();
		SearchVo searchVo = new SearchVo();
		searchVo.setLabel(term);
//		System.out.println("seach term: " + term);
		if(term.length() < 1) {
			return;
		}
		
		List<SearchVo> list = SearchDAO.getInstance().selectListHairshop(searchVo);
		if(list.size() == 0)
		{
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("value", "-1");
			jsonObject.addProperty("label", "검색결과 없음");
			jsonObject.addProperty("desc", "");
			jsonObject.addProperty("icon", "");
			jsonObject.addProperty("image", "");
			jsonArray.add(jsonObject);
		}
		else {
			
			for(SearchVo vo : list) {
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("value", vo.getValue());
				jsonObject.addProperty("label", vo.getLabel());
				jsonObject.addProperty("desc", vo.getDesc());
				jsonObject.addProperty("icon", vo.getIcon());
				jsonObject.addProperty("image", vo.getImage());
				jsonArray.add(jsonObject);
			}
		}
		
		String jsonString = new Gson().toJson(jsonArray);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		if(request.getParameter("detail") == null) {
			response.getWriter().write(jsonString);
		}else {
			request.setAttribute("datas", jsonArray);
			request.getRequestDispatcher("/members/hairshopSelect.jsp").forward(request, response);
		}
	}
}
