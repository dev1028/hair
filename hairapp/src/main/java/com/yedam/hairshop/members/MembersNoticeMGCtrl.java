package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.NoticeDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class MembersNoticeMGCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersNoticeMGCtrl");
		
		HairshopNoticeVo vo = (HairshopNoticeVo) request.getSession().getAttribute("view");
		
		HairshopNoticeVo resultVo = NoticeDAO.getInstance().noticeView(vo);
		request.getSession().setAttribute("modify", resultVo);
		System.out.println("modify: " + resultVo);
		
		request.getRequestDispatcher("/members/membersNoticeModify.jsp").forward(request, response);

	}

}
