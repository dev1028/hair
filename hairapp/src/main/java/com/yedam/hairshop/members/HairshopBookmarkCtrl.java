package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopBookmarkDAO;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.MembersVo;

import net.sf.json.JSONObject;

public class HairshopBookmarkCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairshopBookmarkCtrl");
		
		MembersVo loginVo = (MembersVo)request.getSession().getAttribute("login");
		HairshopBookmarkVo vo = new HairshopBookmarkVo();
		vo.setHs_no(request.getParameter("hs_no"));
		vo.setMem_no(loginVo.getMem_no());
		
		HairshopBookmarkDAO dao = HairshopBookmarkDAO.getInstance();
		
		JSONObject json = new JSONObject();
		if(dao.HasBookmark(vo)) {
			dao.DelBookmark(vo);
			json.put("type", "del");
		}else {
			dao.Bookmark(vo);
			json.put("type", "add");
		}
		
		String jsonString = new Gson().toJson(json);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
		
		//if(request.getParameter("detail") == null) {
		//	response.getWriter().write(jsonString);
	}

}
