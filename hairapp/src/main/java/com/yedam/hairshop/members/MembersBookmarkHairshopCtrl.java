package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.dao.HairshopBookmarkDAO;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.MembersVo;

public class MembersBookmarkHairshopCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopBookmarkVo vo = new HairshopBookmarkVo();
		HttpSession session = request.getSession();
		MembersVo memVo = (MembersVo) session .getAttribute("login");
		if(memVo == null) {
			System.out.println("로그인 세션 만료");
			return;
		}
//		System.out.println("MEM_NO: " + memVo.getMem_no());
		vo.setMem_no(memVo.getMem_no());
		List<HairshopBookmarkVo> list = HairshopBookmarkDAO.getInstance().getBookmarkList(vo);
		System.out.println("list size: " + list.size());
		session.setAttribute("list", list);
		request.getRequestDispatcher("/members/membersBookmarkHairshop.jsp").forward(request, response);
	}

}
