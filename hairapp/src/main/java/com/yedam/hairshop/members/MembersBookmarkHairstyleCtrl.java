package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerBookmarkDAO;
import com.yedam.hairshop.dao.HairBookmarkDAO;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.MembersVo;

public class MembersBookmarkHairstyleCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersBookmarkHairstyleCtrl");

		HttpSession session = request.getSession();
		MembersVo memVo = (MembersVo) session .getAttribute("login");
		if(memVo == null) {
			System.out.println("로그인 세션 만료");
			return;
		}
		
		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().getBookmarkList(memVo.getMem_no());
		for(HairshopHairInfoVo tmpVo : list) {
			tmpVo.setHhi_book("1");;
		}
		request.setAttribute("list", list);
		System.out.println("헤어 북마크 개수: " + list.size());
		request.getRequestDispatcher("/members/membersBookmarkHairstyle.jsp").forward(request, response);
	}

}
