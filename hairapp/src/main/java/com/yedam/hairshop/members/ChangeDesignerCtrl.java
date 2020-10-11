package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerBookmarkDAO;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerBookmarkVo;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersVo;

public class ChangeDesignerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		String hour = request.getParameter("hour");
		System.out.println(date);
		System.out.println(hour);
		
		HttpSession session = request.getSession();
		session.setAttribute("date", date);
		session.setAttribute("hour", hour);
		
		HairshopVo hairshopVo = (HairshopVo) session.getAttribute("selHairshopVo");
		
		DesignerVo vo = new DesignerVo();
		vo.setHs_no(hairshopVo.getHs_no());
		List<DesignerVo> list = DesignerDAO.getInstance().notRetireeByHairShop(vo);
		
		//북마크 세팅
		MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
		for(DesignerVo v : list) {
			if(memVo != null) {
				DesignerBookmarkVo bookVo = new DesignerBookmarkVo();
				bookVo.setDesigner_no(v.getDesigner_no());
				bookVo.setMem_no(memVo.getMem_no());
				//북마크 되어 있는 것이라면
				if(DesignerBookmarkDAO.getInstance().HasBookmark(bookVo)) {
					v.setDesigner_book("1");
				}
			}
		}
		
		String str = new Gson().toJsonTree(list).toString();
		response.getWriter().print(str);
		//request.setAttribute("list", list);
		//request.getRequestDispatcher("/members/designerSelect.jsp").forward(request, response);
	}

}
