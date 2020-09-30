package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerBookmarkDAO;
import com.yedam.hairshop.model.DesignerBookmarkVo;
import com.yedam.hairshop.model.MembersVo;

import net.sf.json.JSONObject;

public class DesignerBookmarkCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DesignerBookmarkCtrl");
		
		MembersVo loginVo = (MembersVo)request.getSession().getAttribute("login");
		DesignerBookmarkVo vo = new DesignerBookmarkVo();
		String designer_no = request.getParameter("designer_no");
		if(designer_no != null) {
			vo.setDesigner_no(designer_no);
			vo.setMem_no(loginVo.getMem_no());
			
			DesignerBookmarkDAO dao = DesignerBookmarkDAO.getInstance();
			
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
		}else {
			System.out.println("designer_no is null");
		}
	}

}
