package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopBookmarkDAO;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersVo;

public class MembersBookmarkHairshopCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MembersVo memVo = (MembersVo) session .getAttribute("login");
		if(memVo == null) {
			System.out.println("로그인 세션 만료");
			return;
		}
		
		HairshopBookmarkVo vo = new HairshopBookmarkVo();
		vo.setMem_no(memVo.getMem_no());
		List<HairshopVo> list = HairshopBookmarkDAO.getInstance().getBookmarkList(vo);
		System.out.println("list size: " + list.size());
		session.setAttribute("list", list);
		request.getRequestDispatcher("/members/membersBookmarkHairshop.jsp").forward(request, response);
	}

}
