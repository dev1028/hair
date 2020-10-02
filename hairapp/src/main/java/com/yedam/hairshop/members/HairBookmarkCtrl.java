package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairBookmarkDAO;
import com.yedam.hairshop.dao.HairshopBookmarkDAO;
import com.yedam.hairshop.model.HairBookmarkVo;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.MembersVo;

import net.sf.json.JSONObject;

public class HairBookmarkCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairBookmarkCtrl");
		MembersVo loginVo = (MembersVo)request.getSession().getAttribute("login");
		
		HairBookmarkVo vo = new HairBookmarkVo();
		vo.setHhi_no(request.getParameter("hhi_no"));
		vo.setMem_no(loginVo.getMem_no());
		
		HairBookmarkDAO dao = HairBookmarkDAO.getInstance();

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
	}

}
