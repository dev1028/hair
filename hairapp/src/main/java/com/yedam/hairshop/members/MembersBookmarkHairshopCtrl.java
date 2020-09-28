package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.HairshopBookmarkDAO;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.MembersVo;

public class MembersBookmarkHairshopCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopBookmarkVo vo = new HairshopBookmarkVo();
		MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
		vo.setMem_no(memVo.getMem_no());
		HairshopBookmarkDAO.getInstance().getBookmarkList(vo);
		request.getRequestDispatcher("/members/membersBookmarkHairshop.jsp").forward(request, response);
	}

}
