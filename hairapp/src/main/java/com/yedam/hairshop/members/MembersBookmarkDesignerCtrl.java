package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerBookmarkDAO;
import com.yedam.hairshop.model.DesignerBookmarkVo;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.MembersVo;

public class MembersBookmarkDesignerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersBookmarkDesignerCtrl");
		
		HttpSession session = request.getSession();
		MembersVo memVo = (MembersVo) session .getAttribute("login");
		if(memVo == null) {
			System.out.println("로그인 세션 만료");
			return;
		}
		
		DesignerBookmarkVo vo = new DesignerBookmarkVo();
		vo.setMem_no(memVo.getMem_no());
		List<DesignerVo> list = DesignerBookmarkDAO.getInstance().getBookmarkList(vo);
		for(DesignerVo tmpVo : list) {
			tmpVo.setDesigner_book("1");;
		}
		request.setAttribute("list", list);
		System.out.println("list size: " + list.size());
		request.getRequestDispatcher("/members/membersBookmarkDesigner.jsp").forward(request, response);
	}

}
