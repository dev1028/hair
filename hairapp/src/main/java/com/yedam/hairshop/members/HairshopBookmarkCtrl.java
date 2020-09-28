package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.HairshopBookmarkDAO;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.MembersVo;

public class HairshopBookmarkCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairshopBookmarkCtrl");
		
		MembersVo loginVo = (MembersVo)request.getSession().getAttribute("login");
		HairshopBookmarkVo vo = new HairshopBookmarkVo();
		vo.setHs_no(request.getParameter("hs_no"));
		vo.setMem_no(loginVo.getMem_no());
		
		HairshopBookmarkDAO dao = HairshopBookmarkDAO.getInstance();
		if(dao.HasBookmark(vo)) {
			dao.DelBookmark(vo);
		}else {
			dao.Bookmark(vo);
		}
		
		//String jsonString = new Gson().toJson(jsonArray);
		//response.setContentType("application/json");
		//response.setCharacterEncoding("UTF-8");

		//if(request.getParameter("detail") == null) {
		//	response.getWriter().write(jsonString);
	}

}
